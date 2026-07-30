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
        loader=Loader()
        pipeline=Pipeline(weather_extractor,aqi_extractor,transformer,loader,CITIES)
        pipeline.run()

    run_pipeline()

windrose_pipeline()
