CREATE TABLE IF NOT EXISTS weather_aqi (
    city          TEXT NOT NULL,
    temperature   DOUBLE PRECISION,
    humidity      DOUBLE PRECISION,
    wind_speed    DOUBLE PRECISION,
    aqi_available BOOLEAN,
    pm25          DOUBLE PRECISION,
    pm10          DOUBLE PRECISION,
    co            DOUBLE PRECISION,
    no2           DOUBLE PRECISION,
    o3            DOUBLE PRECISION,
    so2           DOUBLE PRECISION,
    fetched_at    TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (city, fetched_at)
);
