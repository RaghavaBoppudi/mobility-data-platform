# Mobility Data Platform

An end-to-end analytics engineering project that ingests NYC Taxi trip
data, transforms it into analytics-ready models using dbt, and organizes
it into warehouse-style datasets for downstream reporting and analysis.

This project demonstrates a **warehouse-first analytics workflow**
including ingestion, transformation layers, dimensional modeling, and
data quality testing.

------------------------------------------------------------------------

# Architecture

The pipeline follows a layered analytics engineering design.

NYC Taxi Dataset │ ▼ Python Ingestion Script │ ▼ DuckDB Raw Table
(raw_taxi_trips) │ ▼ dbt Staging Layer (stg_taxi_trips) │ ▼ dbt
Intermediate Layer (int_trip_metrics) │ ▼ dbt Mart Layer fact_trips
dim_date

Each layer has a specific responsibility.

**Raw layer** Stores ingested source data without heavy transformation.

**Staging layer** Standardizes column names, types, and removes
inconsistencies.

**Intermediate layer** Creates derived metrics and reusable business
logic.

**Mart layer** Produces analytics-ready datasets designed for reporting
and dashboarding.

------------------------------------------------------------------------

# Tech Stack

Programming: Python\
Data Warehouse: DuckDB\
Transformation: dbt\
Data Quality: dbt tests\
Version Control: Git / GitHub\
Dataset: NYC Taxi Trip Records

------------------------------------------------------------------------

# Dataset

Source data comes from the NYC Taxi & Limousine Commission.

Dataset used: NYC Yellow Taxi Trip Records (January 2025)

The dataset contains millions of trip records including:

-   pickup and dropoff timestamps
-   trip distance
-   passenger counts
-   payment information
-   location identifiers
-   revenue metrics

------------------------------------------------------------------------

# Data Models

## Staging Layer

**stg_taxi_trips**

Standardizes raw ingestion data by: - renaming columns - selecting
relevant fields - preparing the dataset for transformation

------------------------------------------------------------------------

## Intermediate Layer

**int_trip_metrics**

Adds derived metrics including:

-   trip duration
-   trip date
-   pickup hour
-   revenue per mile

------------------------------------------------------------------------

## Mart Layer

**fact_trips**

Main analytics table containing trip metrics used for reporting and
analysis.

Fields include:

-   trip date
-   pickup hour
-   pickup and dropoff location
-   passenger count
-   trip distance
-   revenue metrics

------------------------------------------------------------------------

**dim_date**

Date dimension enabling time-based analysis such as:

-   year
-   month
-   day
-   day of week

------------------------------------------------------------------------

# Data Quality

Data quality checks are implemented using **dbt tests**.

Examples include:

-   `not_null` tests for critical fields
-   `unique` constraints for dimension keys
-   validation of required analytical fields

Tests are executed using:

dbt test

------------------------------------------------------------------------

# Running the Project

## 1. Clone the repository

git clone `<repo-url>`{=html} cd mobility-data-platform

## 2. Create Python environment

python3.12 -m venv .venv source .venv/bin/activate

## 3. Install dependencies

pip install -r requirements.txt

## 4. Run ingestion pipeline

python ingestion/load_taxi_data.py

This loads the NYC Taxi dataset into DuckDB.

## 5. Run dbt models

cd taxi_analytics dbt run

## 6. Run data quality tests

dbt test

------------------------------------------------------------------------

# Example Analytical Questions

The curated datasets enable analysis such as:

-   What hours of the day have the highest taxi demand?
-   Which pickup locations generate the highest revenue?
-   What is the average revenue per mile for taxi trips?
-   How do passenger counts affect trip distance and fare?

------------------------------------------------------------------------

# Future Improvements

Planned enhancements include:

-   orchestration using Apache Airflow
-   additional dimensional models for taxi zones
-   dashboarding layer for interactive analytics
-   cloud warehouse deployment

------------------------------------------------------------------------

# Repository Structure

mobility-data-platform │ ├── ingestion/ │ └── load_taxi_data.py │ ├──
taxi_analytics/ │ ├── models/ │ │ ├── staging/ │ │ ├── intermediate/ │ │
└── marts/ │ │ │ └── dbt_project.yml │ ├── data/ ├── screenshots/ ├──
docs/ ├── requirements.txt └── README.md

------------------------------------------------------------------------

# Purpose of the Project

This project demonstrates core analytics engineering concepts:

-   warehouse-first transformation design
-   layered dbt modeling
-   dimensional analytics structures
-   data quality validation
-   reproducible data pipelines

It is intended as a learning project for modern analytics engineering
workflows.
