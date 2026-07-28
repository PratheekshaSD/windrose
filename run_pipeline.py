from src.windrose.pipeline import Pipeline

import os 
from dotenv import load_dotenv
load_dotenv()

from src.windrose.extractors.weather_extractor import WeatherExtractor
from src.windrose.extractors.aqi_extractor import AQIExtractor
from src.windrose.transformer import Transformer
from src.windrose.loader import Loader
from src.windrose.config import CITIES

weather_extractor = WeatherExtractor()
aqi_extractor = AQIExtractor(api_key=os.getenv("OPENAQ_API_KEY"))
transformer = Transformer()
loader = Loader()

pipeline = Pipeline(weather_extractor, aqi_extractor, transformer, loader, CITIES)
pipeline.run()