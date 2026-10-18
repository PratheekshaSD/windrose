import psycopg2
import os
from dotenv import load_dotenv

class Loader:
    def __init__(self):
        load_dotenv()
        self.host = os.getenv("DB_HOST")
        self.port = os.getenv("DB_PORT")
        self.user = os.getenv("DB_USER")
        self.password = os.getenv("DB_PASSWORD")
        self.dbname = os.getenv("DB_NAME")

    def load(self, row):
        conn = psycopg2.connect(
            host=self.host,
            port=self.port,
            user=self.user,
            password=self.password,
            dbname=self.dbname
        )
        cursor = conn.cursor()

        columns = row.keys()
        columns_str = ", ".join(columns)
        placeholders = ", ".join(["%s"] * len(columns))
        query = f"INSERT INTO weather_aqi ({columns_str}) VALUES ({placeholders})"

        cursor.execute(query, list(row.values()))
        conn.commit()

        cursor.close()
        conn.close()

    def save_agent_decision(self, city, error_message, action, reasoning, source):
        conn=psycopg2.connect(
            host=self.host,
            port=self.port,
            user=self.user,
            password=self.password,
            dbname=self.dbname
        )

        cursor=conn.cursor()

        query="""
            INSERT INTO agent_decisions(city, error_message, action, reasoning, source)
            VALUES (%s, %s, %s, %s, %s)
            """

        cursor.execute(query,(city, error_message, action, reasoning, source))
        conn.commit()

        cursor.close()
        conn.close()