import psycopg2

class Loader:
    def __init__(self, host="localhost", port=5433, user="windrose", password="windrose_dev_pw", dbname="windrose"):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.dbname = dbname

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