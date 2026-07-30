# 🌬️ Windrose

A daily-scheduled data pipeline that pulls weather and air quality data for multiple cities, joins them, and stores the result — orchestrated by Apache Airflow, running fully in Docker.

## 🔧 What it does

Every day, the pipeline:
1. Fetches current weather (temperature, humidity, wind speed) for a list of cities from **Open-Meteo**
2. Fetches current air quality readings (PM2.5, PM10, CO, NO2, O3, SO2) for the same cities from **OpenAQ**
3. Merges both into a single clean record per city
4. Loads it into a PostgreSQL table, building a historical dataset over time

Not every city has an active, recently-reporting AQI sensor nearby — the pipeline detects this (checking the nearest few stations by distance, filtering out stale readings older than 48 hours) and records `aqi_available: false` rather than failing, so the pipeline stays useful even with incomplete source data.

## 🤔 Why Airflow

Two independent data sources, each capable of failing separately, feeding into one output. Airflow gives per-source retry handling, a fan-in dependency (load only proceeds once both fetches for a city are handled), and daily scheduling with run history — without needing to hand-roll that logic in a cron script.

## 🏗️ Architecture

```
Open-Meteo API ──┐
                  ├──> Transformer ──> PostgreSQL (postgres-windrose)
OpenAQ API ───────┘
```

- **Extractors** (`src/windrose/extractors/`) — one per data source, each with retry-with-backoff and fail-fast validation on bad input
- **Transformer** (`src/windrose/transformer.py`) — merges both extractor outputs into a fixed-schema row, filling missing pollutants with `None`
- **Loader** (`src/windrose/loader.py`) — writes the row into Postgres via a dynamically-built `INSERT`
- **Pipeline** (`src/windrose/pipeline.py`) — orchestrates the above across a config-driven list of cities, with per-city fault isolation (one city failing doesn't block the rest)
- **DAG** (`dags/windrose_dag.py`) — thin Airflow wrapper, schedules `Pipeline.run()` to run daily via the TaskFlow API

## 🐳 Infrastructure

- **Docker Compose**, running Airflow (LocalExecutor — apiserver, scheduler, dag-processor, triggerer) plus two separate Postgres instances: one for Airflow's own internal metadata, one (`postgres-windrose`) for the actual pipeline data
- LocalExecutor was chosen over CeleryExecutor since this runs on a single machine with no need for a distributed task queue
- Secrets (Fernet key, OpenAQ API key, DB credentials) are kept in a gitignored `.env` file, never committed

## 🚀 Setup

```bash
git clone <repo-url>
cd windrose
# create .env with AIRFLOW_UID, FERNET_KEY, OPENAQ_API_KEY (see .env.example)
docker compose up airflow-init
docker compose up -d
```

Airflow UI: `http://localhost:8080` (default: `airflow` / `airflow`)

## 🛠️ Tech stack

Python · Apache Airflow 3.3 (TaskFlow API) · PostgreSQL · Docker Compose · psycopg2 · Open-Meteo API · OpenAQ API

## 📝 Notes

- City list lives in `src/windrose/config.py`, easy to extend without touching pipeline logic