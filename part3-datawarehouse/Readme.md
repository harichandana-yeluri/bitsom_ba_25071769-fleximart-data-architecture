# Data Warehouse and Analytics

## Sub-section overview:
This sub-section focuses on the design and implementation of a data warehouse (fleximart_dw) to support analytical reporting and decision-making.
Cleaned and validated data from the OLTP system is transformed and loaded into an OLAP-optimized star schema, enabling efficient aggregation, slicing, dicing, and trend analysis.


## Structure:

### star_schema_desgin.md
This file contains a detailed overview of the star schema design used for the fleximart_dw data warehouse.

**It documents:**

    - Fact and dimension tables

    - Granularity and business process definition

    - Design decisions such as surrogate keys and denormalization

    - Sample data flow from source systems to the data warehouse

### warehouse_schema.sql
This file contains the SQL DDL statements used to create the fleximart_dw database schema, 

**including:**

    - Dimension tables (dim_date, dim_product, dim_customer)

    -  Fact table (fact_sales)

    - Primary and foreign key relationships

### warehouse_data.sql
TThis file contains SQL INSERT statements used to populate the fleximart_dw tables with sample data for analytical processing. The data is designed to reflect real-world sales patterns and ensure meaningful analytical results.

**Minimum Data Requirements:**

    - dim_date: 30 dates covering January–February 2024 (including weekdays and weekends)

    - dim_product: 15 products across 3 categories

    - dim_customer: 12 customers across 4 cities

    - fact_sales: 40 realistic sales transactions


### analytics_queries.sql
This file contains OLAP analytical queries executed on the data warehouse to support various business scenarios, 

**such as:**

    - Time-based sales analysis (drill-down and roll-up)

    - Product performance evaluation

    - Customer segmentation and revenue analysis

These queries demonstrate the effectiveness of the star schema in supporting analytical workloads.