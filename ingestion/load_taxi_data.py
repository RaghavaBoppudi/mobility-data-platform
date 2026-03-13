import duckdb
import pandas as pd

FILE_PATH = "data/yellow_tripdata_2025-01.parquet"
DB_FILE = "taxi.duckdb"

def main():

    print("Reading dataset...")
    df = pd.read_parquet(FILE_PATH)

    df.columns = [c.lower() for c in df.columns]

    print("Connecting to DuckDB...")
    conn = duckdb.connect(DB_FILE)

    print("Writing raw table...")
    conn.execute("DROP TABLE IF EXISTS raw_taxi_trips")

    conn.register("df_view", df)

    conn.execute("""
        CREATE TABLE raw_taxi_trips AS
        SELECT * FROM df_view
    """)

    print("Done. Rows loaded:", len(df))

    conn.close()

if __name__ == "__main__":
    main()