import subprocess
import sys

def run_step(name, command):
    print(f"\n=== Running: {name} ===")
    result = subprocess.run(command, shell=True)
    if result.returncode != 0:
        print(f"Step failed: {name}")
        sys.exit(1)

def main():

    run_step(
        "Load Taxi Trips",
        "python ingestion/load_taxi_data.py"
    )

    run_step(
        "Load Taxi Zones",
        "python ingestion/load_taxi_zones.py"
    )

    run_step(
        "dbt Run Models",
        "cd taxi_analytics && dbt run"
    )

    run_step(
        "dbt Run Tests",
        "cd taxi_analytics && dbt test"
    )

    print("\nPipeline completed successfully.")

if __name__ == "__main__":
    main()
