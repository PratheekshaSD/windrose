class Transformer:
    POLLUTANTS = ["pm25","pm10","co","no2","o3","so2"]

    def transform(self,weather_data,aqi_data):
        merged={**weather_data,**aqi_data}  #merging both results from the extractor

        for pollutant in self.POLLUTANTS:   #placing None for Missing keys
            if pollutant not in merged:
                merged[pollutant]=None
        return merged
