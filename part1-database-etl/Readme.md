# Database Design and ETL Pipeline

## Sub-section overview:
In this sub-section, three raw .csv files located in the data folder are processed: customers_raw.csv, products_raw.csv, and sales_raw.csv.
The focus of this section is on data cleaning, formatting, validation, and ingestion into a structured relational database using Python and Pandas as part of an ETL pipeline. A data quality report summarizing cleaning actions performed on each dataset. Schema documentation explaining the database tables and relationships used. Business queries written to extract analytical insights based on given business scenarios.

## Structure:

### etl_pipeline
This Python script implements the complete Extract, Transform, Load (ETL) workflow using Pandas and database connectors.

**File 1**: customers_raw.csv (20+ records)
**Issues**: Missing emails, inconsistent phone formats, duplicate entries.
**Transformations Applied:** Removal of duplicate entries, Standardization of phone number formats and date, Handling of missing values.

**File 2**: products_raw.csv (15+ records)
**Issues**: Missing prices, inconsistent category names, null stock values.
**Transformations Applied:** Missing values handled, Standardization of category and handling null value in stock.

**File 3**: sales_raw.csv (30+ records)
**Issues**: Date format inconsistencies, missing customer/product IDs, duplicate transactions.
**Transformations Applied:** Date format normalization, Handling missing values, Removal of duplicate transactions.
**The sales.csv is divided into two tables namely orders and order_items**

### business_queries.sql
This file contains SQL queries executed on the cleaned and ingested data stored in the relational database.
The queries address specific business scenarios such as customer purchase history, product sales analysis, and monthly sales trends, enabling meaningful insights from the processed data.

### data_quality_report.txt
This file provides a detailed summary of the data quality checks and transformations applied during the ETL process. This report ensures transparency and traceability of data cleaning operations.

**Generated report includes:**

    - Number of records processed per file

    - Number of duplicates removed

    - Number of missing values handled

    - Number of records loaded successfully

### schema_documentation
This file documents the database schema used for storing the cleaned data.
**It explains:**

- Table structures,functionality and attributes

- Primary and foreign key relationships 

- Rationale behind schema design choices

- How the schema supports business queries and analysis