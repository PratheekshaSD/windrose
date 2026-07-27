import os
from dotenv import load_dotenv
load_dotenv()

from src.windrose.extractors.weather_extractor import WeatherExtractor
from src.windrose.extractors.weather_extractor import WeatherExtractor, InvalidValuesError
extractor = WeatherExtractor()
result = extractor.fetch("Bengaluru", 12.97, 77.59)
print(result)

try:
    extractor.fetch("Fake City", 999, 999)
except InvalidValuesError as e:
    print(f"Correctly caught: {e}")


from src.windrose.extractors.aqi_extractor import AQIExtractor

api_key = os.getenv("OPENAQ_API_KEY")
aqi_extractor = AQIExtractor(api_key=api_key)
result = aqi_extractor.fetch("Bengaluru", 12.97, 77.59)
print(result)