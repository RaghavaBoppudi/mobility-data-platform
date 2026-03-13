# Architecture

This project implements a warehouse-first analytics pipeline using Python, DuckDB, and dbt.

## Pipeline Flow

NYC Taxi Dataset  
↓  
Python ingestion scripts  
↓  
DuckDB warehouse (raw tables)  
↓  
dbt staging models  
↓  
dbt intermediate models  
↓  
analytics marts (fact + dimensions)  
↓  
analytical queries

## Data Layers

### Raw Layer
Source data loaded into DuckDB:
- raw_taxi_trips
- raw_taxi_zones

### Staging Layer
Standardized tables used for downstream transformations:
- stg_taxi_trips
- stg_taxi_zones

### Intermediate Layer
Derived metrics and reusable logic:
- int_trip_metrics

### Mart Layer
Analytics-ready warehouse models:
- fact_trips
- dim_date
- dim_location
