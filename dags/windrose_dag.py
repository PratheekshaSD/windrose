import sys
sys.path.insert(0, "/opt/airflow")

import os
from dotenv import load_dotenv
load_dotenv()


from src.windrose.extractors.weather_extractor import WeatherExtractor
from src.windrose.extractors.aqi_extractor import AQIExtractor
from src.windrose.transformer import Transformer
from src.windrose.loader import Loader
from src.windrose.config import CITIES
from src.windrose.agent import classify_error,ask_llm

from airflow.sdk import dag, task 
import pendulum

@dag(
    schedule="@daily", #run daily once 
    start_date=(pendulum.datetime(2026,7,30,tz="UTC")),
    catchup=False  #avoid backfilling all the missed dates
)
def windrose_pipeline():

    @task
    def extract_weather():
        weather_extractor=WeatherExtractor()
        results=[]
        failures=[]

        for city in CITIES:
            try:
                weather_data =weather_extractor.fetch(city["name"], city["latitude"], city["longitude"])
                results.append({"city":city,"data":weather_data})
            except Exception as e:
                failures.append({"city":city,"error":str(e)})
                continue
        return {"results":results,"failures":failures}

    @task
    def extract_aqi():
        aqi_extractor=AQIExtractor(api_key=os.getenv("OPENAQ_API_KEY"))
        results=[]
        for city in CITIES:
            try:
                aqi_data =aqi_extractor.fetch(city["name"], city["latitude"], city["longitude"])
                results.append({"city":city,"data":aqi_data})
            except Exception as e:
                aqi_data={
                    "aqi_available":False,
                    "pm25":None,"pm10":None,"co":None,
                    "no2":None,"o3":None,"so2":None
                }
                results.append({"city": city, "data": aqi_data})
        return results

    @task
    def transform_and_load(weather_results, aqi_results):
        import json
        if isinstance(weather_results,str):
            weather_results=json.loads(weather_results)
        if isinstance(aqi_results,str):
            aqi_results=json.loads(aqi_results)
        transformer = Transformer()
        loader = Loader()
        failures = []

        for weather_item in weather_results["results"]:
            city = weather_item["city"]
            weather_data = weather_item["data"]
            
            aqi_item = next((x for x in aqi_results if x["city"]["name"] == city["name"]), None)
            aqi_data = aqi_item["data"] if aqi_item else {
                "aqi_available": False,
                "pm25": None, "pm10": None, "co": None,
                "no2": None, "o3": None, "so2": None
            }

            try:
                row = transformer.transform(weather_data, aqi_data)
                loader.load(row)
            except Exception as e:
                failures.append({"city": city, "error": str(e)})

        return failures

    @task
    def run_agent(failures):
        weather_extractor=WeatherExtractor()
        aqi_extractor=AQIExtractor(api_key=os.getenv("OPENAQ_API_KEY"))
        transformer=Transformer()
        loader=Loader()


        for failure in failures:
            decision=classify_error(failure["error"])
            source="rule"
            if decision is None:
                decision=ask_llm(failure["error"])
                source="llm"

            action=decision["action"]
            city=failure["city"]

            if action=="retry":
                try:
                    weather_data = weather_extractor.fetch(city["name"], city["latitude"], city["longitude"])
                    try:
                        aqi_data = aqi_extractor.fetch(city["name"], city["latitude"], city["longitude"])
                    except:
                        aqi_data = {
                            "aqi_available": False,
                            "pm25": None, "pm10": None, "co": None,
                            "no2": None, "o3": None, "so2": None
                        }
                    row = transformer.transform(weather_data, aqi_data)
                    loader.load(row)
                    print(f"{city['name']} : retry succeeded")

                except Exception as e:
                    print(f"{city['name']} : retry failed again - {e}")

            elif action=="skip":
                    print(f"{city['name']} : skipped - {decision['reasoning']}")
            elif action =="alert":
                    print(f"ALERT - {city['name']} needs attetnion: {decision['reasoning']}")
            
            loader.save_agent_decision(
                city=city["name"],
                error_message=failure["error"],
                action=action,
                reasoning=decision.get("reasoning",""),
                source=source
            )

    weather = extract_weather()
    aqi = extract_aqi()
    failures = transform_and_load(weather, aqi)
    run_agent(failures)
windrose_pipeline()
