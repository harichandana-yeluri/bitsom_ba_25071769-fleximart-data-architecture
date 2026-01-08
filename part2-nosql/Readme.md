# DNoSQL Database Analysis

## Sub-section overview:
In this subsection, the focus is on working with product catalog data using MongoDB, a NoSQL database. The dataset is ingested into MongoDB and analyzed using basic to advanced aggregation and grouping queries to derive insights for specific business scenarios.
This section demonstrates how semi-structured data can be efficiently stored, queried, and analyzed using NoSQL technologies, highlighting use cases where NoSQL databases are preferred over traditional relational databases.
 

## Structure:

### products_catalog.json
This file contains the product catalog data in JSON format, which serves as the source dataset for ingestion into the MongoDB database.
The data is semi-structured and designed to leverage MongoDB’s flexible schema capabilities.

### mongodb_operations.js
This JavaScript file contains:

    - Code for ingesting the products_catalog.json data into MongoDB

    - MongoDB queries and aggregation pipelines to address given business scenarios

    - Examples of filtering, grouping, sorting, and aggregation operations

It demonstrates practical usage of MongoDB for real-world analytical queries.

### nosql_analysis.md
This file provides a NoSQL justification and analysis report, covering the following topics:

    - Limitations of traditional RDBMS systems

    - Benefits of using NoSQL databases

    - Trade-offs and disadvantages of NoSQL (such as consistency and transaction limitations)

The document explains why MongoDB is suitable for the given dataset and business requirements.
