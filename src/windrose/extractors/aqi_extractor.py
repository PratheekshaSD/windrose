import requests
import time 
from datetime import datetime,timezone,timedelta

class InvalidValuesError(Exception):
    pass

class MaxRetriesError(Exception):
    pass

class AQIExtractor:
    def __init__(self, max_retries=3, retry_delay=2, api_key=None,staleness_hours=48):
        self.max_retries=max_retries
        self.retry_delay=retry_delay
        self.api_key=api_key
        self.staleness_hours=staleness_hours

    def fetch(self,city_name,latitude,longitude):
        if (latitude>90 or latitude<-90 or longitude >180 or longitude<-180): 
            raise InvalidValuesError(f"Bruh give valid values!!")

        url= "https://api.openaq.org/v3/locations"

        params={
                "coordinates": f"{latitude},{longitude}",
                "radius": 10000 ,     #25km search radius for stations
                "limit":5      #no of stations to get back 
            }

        headers={
            "X-API-Key":self.api_key
        }

        for attempt in range(1,self.max_retries+1):
            try:
                response= requests.get(
                    url,
                    params=params,
                    headers=headers
                )
                data=response.json()
                candidates=data["results"][:5]
                print(f"{city_name}: found {len(candidates)} candidate stations: {[c['id'] for c in candidates]}")
            
                for station in candidates:
                    location_id=station["id"]
                    latest_response=requests.get(
                        f"{url}/{location_id}/latest",
                        headers=headers
                    )
                    latest_data=latest_response.json()

                    if latest_data["results"]:
                        api_time=latest_data["results"][0]["datetime"]["utc"]
                        current_time=datetime.now(timezone.utc)
                        reading_time=datetime.fromisoformat(api_time)
                        time_difference=current_time-reading_time

                        if time_difference<=timedelta(hours=self.staleness_hours):
                            sensor_map = {s["id"]: s["parameter"]["name"] for s in station["sensors"]}
                            print(f"{city_name} sensor_map: {sensor_map}")

                            clean_result = {"city": city_name, "aqi_available": True}
                            for reading in latest_data["results"]:
                                pollutant = sensor_map.get(reading["sensorsId"])
                                if pollutant:
                                    clean_result[pollutant] = reading["value"]
                            return clean_result
                return {"city": city_name,"aqi_available":False}

            except Exception as e:
                print(f"Something is wrong{e}🤨🤨")
                if attempt<self.max_retries:
                    time.sleep(self.retry_delay)
                    continue
                else:
                    raise MaxRetriesError(f"Failed to fetch for the {city_name} after {self.max_retries} attempts")

