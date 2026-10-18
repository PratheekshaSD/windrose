import requests
import os
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv("OPENAQ_API_KEY")
HEADERS = {"X-API-Key": API_KEY}

CITIES = [
    {"name": "Karwar", "latitude": 14.80, "longitude": 74.13},
    {"name": "Bengaluru", "latitude": 12.97, "longitude": 77.59},
    {"name": "Delhi", "latitude": 28.65, "longitude": 77.23},
    {"name": "Mumbai", "latitude": 19.08, "longitude": 72.88},
    {"name": "Chennai", "latitude": 13.08, "longitude": 80.27},
    {"name": "Hyderabad", "latitude": 17.38, "longitude": 78.49},
    {"name": "Pune", "latitude": 18.52, "longitude": 73.86},
    {"name": "Kolkata", "latitude": 22.57, "longitude": 88.36},
    {"name": "Ahmedabad", "latitude": 23.02, "longitude": 72.57},
    {"name": "Jaipur", "latitude": 26.91, "longitude": 75.79},
    {"name": "Lucknow", "latitude": 26.85, "longitude": 80.95},
    {"name": "Kochi", "latitude": 9.93, "longitude": 76.27},
    {"name": "Mysuru", "latitude": 12.30, "longitude": 76.64},
    {"name": "Shimoga", "latitude": 13.93, "longitude": 75.57},
    {"name": "Hampi", "latitude": 15.34, "longitude": 76.46},
    {"name": "Nagpur", "latitude": 21.15, "longitude": 79.09},
    {"name": "Bhopal", "latitude": 23.26, "longitude": 77.41},
    {"name": "Guwahati", "latitude": 26.14, "longitude": 91.74},
    {"name": "Chandigarh", "latitude": 30.73, "longitude": 76.78},
    {"name": "Coimbatore", "latitude": 11.02, "longitude": 76.96},
    {"name": "TestBrokenCity", "latitude": 999, "longitude": 999},
]

for city in CITIES:
    url = "https://api.openaq.org/v3/locations"
    params = {
        "coordinates": f"{city['latitude']},{city['longitude']}",
        "radius": 25000,  # 25km radius, in meters
        "limit": 5
    }
    response = requests.get(url, headers=HEADERS, params=params)
    data = response.json()
    count = len(data.get("results", []))

    if count > 0:
        print(f"✅ {city['name']}: {count} station(s) nearby")
    else:
        print(f"❌ {city['name']}: no stations nearby")