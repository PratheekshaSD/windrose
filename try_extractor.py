from src.windrose.extractors.weather_extractor import WeatherExtractor
from src.windrose.extractors.weather_extractor import WeatherExtractor, InvalidValuesError
extractor = WeatherExtractor()
result = extractor.fetch("Bengaluru", 12.97, 77.59)
print(result)

try:
    extractor.fetch("Fake City", 999, 999)
except InvalidValuesError as e:
    print(f"Correctly caught: {e}")