# Mobility Data Platform

An end-to-end analytics engineering project that ingests NYC Taxi trip
data, transforms it into analytics-ready models using dbt, and organizes
it into warehouse-style datasets for downstream reporting and analysis.

This project demonstrates a warehouse-first analytics workflow including
ingestion, transformation layers, dimensional modeling, and data quality
testing.

------------------------------------------------------------------------

# Architecture

The pipeline follows a layered analytics engineering design.

NYC Taxi Dataset │ ▼ Python Ingestion Scripts (load_taxi_data.py,
load_taxi_zones.py) │ ▼ DuckDB Warehouse raw_taxi_trips raw_taxi_zones │
▼ dbt Staging Layer stg_taxi_trips stg_taxi_zones │ ▼ dbt Intermediate
Layer int_trip_metrics │ ▼ Analytics Mart Layer fact_trips dim_date
dim_location

Each layer has a specific responsibility:

Raw layer\
Stores ingested source data without heavy transformation.

Staging layer\
Standardizes column names and prepares datasets for transformation.

Intermediate layer\
Creates reusable metrics and derived business logic.

Mart layer\
Produces analytics-ready fact and dimension tables.

------------------------------------------------------------------------

# Tech Stack

Programming: Python\
Data Warehouse: DuckDB\
Transformation Layer: dbt\
Data Quality Testing: dbt tests\
Version Control: Git / GitHub\
Dataset: NYC Taxi Trip Records

------------------------------------------------------------------------

# Dataset

Source data comes from the NYC Taxi & Limousine Commission.

Dataset used:

NYC Yellow Taxi Trip Records (January 2025)

The dataset contains millions of trip records including:

-   pickup and dropoff timestamps
-   trip distance
-   passenger counts
-   payment type
-   location identifiers
-   revenue metrics

------------------------------------------------------------------------

# Data Models

## Fact Table

fact_trips

Primary analytics dataset containing trip-level metrics including:

-   trip date
-   pickup hour
-   pickup and dropoff locations
-   passenger count
-   trip distance
-   fare amount
-   tip amount
-   total revenue
-   trip duration

## Dimension Tables

dim_date

Calendar dimension supporting time-based analysis including:

-   year
-   month
-   day
-   weekday

dim_location

Taxi zone dimension including:

-   borough
-   zone name
-   service area

------------------------------------------------------------------------

# Data Quality

Data quality checks are implemented using dbt tests.

Examples include:

-   not_null tests on critical fields
-   unique tests on dimension keys
-   referential integrity tests between fact and dimension tables

Run tests using:

dbt test

Current project metrics:

-   6 dbt models
-   14 data quality tests

------------------------------------------------------------------------

# Running the Project

## 1. Clone the repository

git clone `<repo-url>`{=html} cd mobility-data-platform

## 2. Create Python environment

python3.12 -m venv .venv source .venv/bin/activate

## 3. Install dependencies

pip install -r requirements.txt

## 4. Load source datasets

python ingestion/load_taxi_data.py\
python ingestion/load_taxi_zones.py

## 5. Build warehouse models

cd taxi_analytics\
dbt run

## 6. Run data quality checks

dbt test

## 7. Pipeline Orchestration

The project includes a simple orchestration script that runs the full pipeline:

python pipeline/run_pipeline.py

This executes:

1. Data ingestion scripts
2. dbt model builds
3. dbt data quality tests

------------------------------------------------------------------------

# Example Analytical Questions

The curated warehouse enables analysis such as:

-   Which pickup zones generate the highest revenue?
-   What hours of the day have the highest taxi demand?
-   What borough produces the highest trip volume?
-   What is the average revenue per mile by day of week?

------------------------------------------------------------------------

# Repository Structure

mobility-data-platform │ ├── ingestion/ │ ├── load_taxi_data.py │ └──
load_taxi_zones.py │ ├── taxi_analytics/ │ ├── models/ │ │ ├── staging/
│ │ ├── intermediate/ │ │ └── marts/ │ │ │ └── dbt_project.yml │ ├──
data/ ├── docs/ ├── screenshots/ ├── requirements.txt └── README.md

------------------------------------------------------------------------

# Purpose of the Project

This project demonstrates core analytics engineering concepts:

-   warehouse-first transformation design
-   layered dbt modeling
-   fact and dimension tables
-   data quality validation
-   reproducible data pipelines

The goal is to demonstrate modern analytics engineering workflows using
Python, DuckDB, and dbt.
