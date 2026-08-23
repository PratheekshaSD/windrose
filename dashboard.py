import streamlit as st
import psycopg2
import pandas as pd

st.title("Windrose Dashboard")

conn = psycopg2.connect(
    host="localhost",
    port=5433,
    user="windrose",
    password="windrose_dev_pw",
    dbname="windrose"
)

st.header("Weather & AQI Data")
weather_df = pd.read_sql("SELECT * FROM weather_aqi ORDER BY fetched_at DESC", conn)
st.dataframe(weather_df)

st.header("Agent Decisions")
decisions_df = pd.read_sql("SELECT * FROM agent_decisions ORDER BY created_at DESC", conn)
if decisions_df.empty:
    st.write("No agent decisions yet — nothing needed intervention.")
else:
    st.dataframe(decisions_df)

conn.close()