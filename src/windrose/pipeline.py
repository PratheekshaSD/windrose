class Pipeline:
    def __init__(self, weather_exctractor, aqi_extractor, transformer, loader, cities):
        self.weather_exctractor = weather_exctractor
        self.aqi_extractor = aqi_extractor
        self.transformer = transformer
        self.loader = loader
        self.cities = cities

    def run(self):
        success_count = 0
        failures=[]

        for city in self.cities:
            print(f"🏙️  Processing {city['name']}...")

            try:
                weather_data = self.weather_exctractor.fetch(city["name"], city["latitude"], city["longitude"])
            except Exception as e:
                failures.append({"city":city,"error":str(e)})
                continue

            try:
                aqi_data = self.aqi_extractor.fetch(city["name"], city["latitude"], city["longitude"])
            except Exception as e:
                aqi_data={
                    "aqi_available":False,
                    "pm25":None,"pm10":None,"co":None,
                    "no2":None,"o3":None,"so2":None
                }

            row = self.transformer.transform(weather_data, aqi_data)
            self.loader.load(row)
            success_count += 1
            print(f"✅ {city['name']} done!")

        print(f"\n🎉 Pipeline run complete — {success_count}/{len(self.cities)} cities loaded successfully.")

        return {"success_count": success_count,"failures":failures}
