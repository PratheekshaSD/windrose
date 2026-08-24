import streamlit as st
import psycopg2
import pandas as pd
import base64

st.set_page_config(page_title="Windrose Dashboard", page_icon="🌦️", layout="wide")

def set_background(image_file):
    with open(image_file, "rb") as f:
        encoded = base64.b64encode(f.read()).decode()

    st.markdown(
        f"""
        <style>
        .stApp {{
            background: transparent !important;
        }}

        .stApp::before {{
            content: "";
            position: fixed;
            top: -10%;
            left: 0;
            width: 100%;
            height: 120%;
            background-image: url("data:image/jpeg;base64,{encoded}");
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            z-index: -2;
        }}

        .stApp::after {{
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.55);
            z-index: -1;
        }}

        [data-testid="stMetricValue"] {{
            color: white !important;
        }}

        [data-testid="stDataFrame"] {{
            background-color: rgba(0, 0, 0, 0.6);
            border-radius: 10px;
            padding: 10px;
        }}
        </style>
        """,
        unsafe_allow_html=True
    )

set_background("background.jpeg")

st.title("🌦️ Windrose Dashboard")
st.caption("Weather + AQI pipeline, with a self-healing agent watching over it")

conn = psycopg2.connect(
    host="localhost",
    port=5433,
    user="windrose",
    password="windrose_dev_pw",
    dbname="windrose"
)

weather_df = pd.read_sql(
    "SELECT * FROM weather_aqi ORDER BY fetched_at DESC",
    conn
)

decisions_df = pd.read_sql(
    "SELECT * FROM agent_decisions ORDER BY created_at DESC",
    conn
)

col1, col2, col3 = st.columns(3)

col1.metric("Total records fetched", len(weather_df))
col2.metric("Cities tracked", weather_df["city"].nunique())
col3.metric("Agent interventions", len(decisions_df))

st.divider()

st.subheader("📊 Weather & AQI Data")
st.dataframe(weather_df, use_container_width=True)

st.divider()

st.subheader("🤖 Agent Decisions")

if decisions_df.empty:
    st.success("No agent decisions yet — every run has gone smoothly ✅")
else:
    def action_badge(action):
        colors = {
            "retry": "🔄",
            "skip": "⏭️",
            "alert": "🚨"
        }
        return f"{colors.get(action, '')} {action}"

    decisions_df["action"] = decisions_df["action"].apply(action_badge)

    st.dataframe(decisions_df, use_container_width=True)

conn.close()