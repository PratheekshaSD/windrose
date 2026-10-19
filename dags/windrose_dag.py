import sys
sys.path.insert(0, "/opt/airflow")

import os
from dotenv import load_dotenv
load_dotenv()

from src.windrose.extractors.weather_extractor import WeatherExtractor
from src.windrose.extractors.aqi_extractor import AQIExtractor
from src.windrose.transformer import Transformer
from src.windrose.loader import Loader
from src.windrose.pipeline import Pipeline
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
    def run_pipeline():
        weather_extractor=WeatherExtractor()
        aqi_extractor=AQIExtractor(api_key=os.getenv("OPENAQ_API_KEY"))
        transformer=Transformer()
        loader=Loader(host='postgres-windrose',port=5432)
        pipeline=Pipeline(weather_extractor,aqi_extractor,transformer,loader,CITIES)

        result=pipeline.run()

        for failure in result["failures"]:
            decision=classify_error(failure["error"])
            source="rule"
            if decision is None:
                decision=ask_llm(failure["error"])
                source="llm"

            action=decision["action"]
            city=failure["city"]

            if action=="retry":
                try:
                    weather_data=weather_extractor.fetch(city["name"],city["latitude"],city["longitude"])
                    aqi_data=aqi_extractor.fetch(city["name"],city["latitude"],city["longitude"])
                    row=transformer.transform(weather_data,aqi_data)
                    loader.load(row)
                    print(f"{city['name']} : retry succeeded")
                except Exception as e:
                    print(f"{city['name']} : retry failed again-{e}")
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

    run_pipeline()

windrose_pipeline()
