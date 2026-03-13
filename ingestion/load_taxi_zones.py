import duckdb
import pandas as pd

FILE_PATH = "data/taxi_zone_lookup.csv"
DB_FILE = "taxi.duckdb"

def main():

    df = pd.read_csv(FILE_PATH)
    df.columns = [c.lower() for c in df.columns]

    conn = duckdb.connect(DB_FILE)

    conn.execute("DROP TABLE IF EXISTS raw_taxi_zones")

    conn.register("zones_view", df)

    conn.execute("""
        CREATE TABLE raw_taxi_zones AS
        SELECT * FROM zones_view
    """)

    print("Taxi zones loaded:", len(df))

    conn.close()

if __name__ == "__main__":
    main()
