import requests 
import time

class InvalidValuesError(Exception):
    pass

class MaxRetriesError(Exception):
    pass

class WeatherExtractor:
    def __init__(self,max_retries=3,retry_delay=2):
        self.max_retries=max_retries
        self.retry_delay=retry_delay
    
    def fetch(self,city_name,latitude,longitude):
        if (latitude>90 or latitude<-90 or longitude >180 or longitude<-180): 
            raise InvalidValuesError(f"Bruh give valid values!!")

        url="https://api.open-meteo.com/v1/forecast"

        for attempt in range (1,self.max_retries+1):
            print(f"Attempt {attempt}/{self.max_retries} for {city_name}")

            try: 
                response=requests.get(
                    url,
                    params={
                        "latitude":latitude,
                        "longitude":longitude,
                        "current":"temperature_2m,relative_humidity_2m,wind_speed_10m"
                        }
                    )
            
            except Exception as e:
                print(f"Something is wrong{e}🤨🤨")
                if attempt<self.max_retries:
                    time.sleep(self.retry_delay)
                    continue
                else:
                    raise MaxRetriesError(f"Failed to fetch for the {city_name} after {self.max_retires} attempts")
        
            if response.status_code==200:
                    data=response.json()
                    temperature=data["current"]["temperature_2m"]
                    humidity=data["current"]["relative_humidity_2m"]
                    wind_speed=data["current"]["wind_speed_10m"]
                    return  {
                        "city":city_name,
                        "temperature":temperature,
                        "humidity":humidity,
                        "wind_speed":wind_speed
                        }

            else:
                print(f"Bad response: {response.status_code}")
                if attempt<self.max_retries:
                    time.sleep(self.retry_delay)
                    continue
                else:
                    raise MaxRetriesError(f"Failed to fetch for the {city_name} after {self.max_retires} attempts")
