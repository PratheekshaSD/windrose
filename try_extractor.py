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
result = aqi_extractor.fetch("Karwar", 14.80, 74.13)
print(result)


from src.windrose.transformer import Transformer

transformer = Transformer()
weather_result = extractor.fetch("Karwar", 14.80, 74.13)
aqi_result = aqi_extractor.fetch("Karwar", 14.80, 74.13)
final_row = transformer.transform(weather_result, aqi_result)
print(final_row)


weather_bengaluru = extractor.fetch("Bengaluru", 12.97, 77.59)
aqi_bengaluru = aqi_extractor.fetch("Bengaluru", 12.97, 77.59)
final_bengaluru = transformer.transform(weather_bengaluru, aqi_bengaluru)
print(final_bengaluru)

from src.windrose.loader import Loader

loader = Loader()
loader.load(final_row)
print("Loaded successfully!")