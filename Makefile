install:
	pip install -r requirements.txt

ingest:
	python ingestion/load_taxi_data.py
	python ingestion/load_taxi_zones.py

build:
	cd taxi_analytics && dbt run

test:
	cd taxi_analytics && dbt test

pipeline:
	python pipeline/run_pipeline.py
