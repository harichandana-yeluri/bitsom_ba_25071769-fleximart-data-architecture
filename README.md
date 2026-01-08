# FlexiMart Data Architecture Project

**Student Name:** Yeluri Venkata Lakshmi Hari Chandana

**Student ID:** bitsom_ba_25071769

**Email:** harichandana.yeluri@gmail.com

**Date:** 08/01/2026

## Project Overview

In this project, three different structures are used to represent various stages of data conditioning, formatting, loading, and analysis. The first section focuses on cleaning raw data and transforming it into a structured database for efficient storage and further processing. The second section demonstrates the ingestion of product data into a NoSQL database, highlighting its functionality along with the advantages and limitations of using a NoSQL approach. The third section covers data warehouse design, explaining how data is structured and transformed from an OLTP system into an OLAP system to support analytical reporting and decision-making.

## Repository Structure
```text
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
└── README.md

## Technologies Used

- Python 3.x, pandas, mysql-connector-python
- MySQL 8.0 
- MongoDB 6.0


## Setup Instructions

To execute this project smoothly, ensure that **Python**, **Pandas**, **MySQL**, and **MongoDB** are pre-installed and properly configured on your system. Additionally, a **Jupyter Notebook extension in Visual Studio Code** is required to run and test the ETL pipeline.


### Database Setup

- Install **MySQL Server** and configure the **root user** with the required credentials.
- Install **MySQL Workbench** to provide a graphical interface for database management and query execution.
- Create the required databases by executing the provided SQL scripts.
- Run the schema scripts for both **`fleximart` (OLTP)** and **`fleximart_dw` (Data Warehouse)** to ensure all necessary tables are created before data loading.
- Verify that tables are successfully created and accessible before proceeding with data ingestion and ETL processes.

# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


### MongoDB Setup
- Install **MongoDB** to support semi-structured data storage and processing.
- Install **MongoDB Compass** as a graphical tool to visualize collections and execute queries on NoSQL data.
- Ensure that MySQL and MongoDB services are running and accessible before executing the mongoDB operations.
- Create a database named **fleximart** and collection **product_catalog**


mongosh < part2-nosql/mongodb_operations.js

## Key Learnings
Through this project, I learned how to clean and transform raw data and ingest it into a structured database, followed by querying the data to derive meaningful analysis. I also gained experience in ingesting data into MongoDB and performing queries on semi-structured data based on business requirements. Additionally, I learned how to design and implement ETL processes to move data from an OLTP system to an OLAP system. The project also helped me understand star schema design and how to generate analytical reports using a data warehouse.


## Challenges Faced

1. **Problem faced**:
    - **solution:** 


2. **Problem faced**:
    - **solution:**