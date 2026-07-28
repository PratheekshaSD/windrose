class Transformer:
    POLLUTANTS = ["pm25","pm10","co","no2","o3","so2"]

    def transform(self,weather_data,aqi_data):
        result={
            "city": weather_data["city"],
            "temperature": weather_data["temperature"],
            "humidity": weather_data["humidity"],
            "wind_speed": weather_data["wind_speed"],
            "aqi_available": aqi_data["aqi_available"]
        }

        for pollutant in self.POLLUTANTS:
            result[pollutant]=aqi_data.get(pollutant)

        return result