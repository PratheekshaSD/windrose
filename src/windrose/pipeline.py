class Pipeline:
    def __init__(self, weather_exctractor, aqi_extractor, transformer, loader, cities):
        self.weather_exctractor = weather_exctractor
        self.aqi_extractor = aqi_extractor
        self.transformer = transformer
        self.loader = loader
        self.cities = cities

    def run(self):
        success_count = 0

        for city in self.cities:
            print(f"🏙️  Processing {city['name']}...")

            try:
                weather_data = self.weather_exctractor.fetch(city["name"], city["latitude"], city["longitude"])
                aqi_data = self.aqi_extractor.fetch(city["name"], city["latitude"], city["longitude"])
                row = self.transformer.transform(weather_data, aqi_data)
                self.loader.load(row)
                success_count += 1
                print(f"✅ {city['name']} done!")
            except Exception as e:
                print(f"❌ {city['name']} failed: {e}")

        print(f"\n🎉 Pipeline run complete — {success_count}/{len(self.cities)} cities loaded successfully.")