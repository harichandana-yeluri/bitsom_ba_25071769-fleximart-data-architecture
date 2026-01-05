## Section A: Limitations of RDBMS

A traditional relational database management system (RDBMS) is designed around fixed schemas, normalised tables, and predefined relationships. While this approach works well for structured and uniform data, it becomes inefficient and complex when handling highly variable and evolving datasets such as the given product catalogue. The following points explain, in detail, why a relational database would struggle with the stated requirements

### 1. Products having different attributes (e.g., laptops have RAM/processor, shoes have size/color)
In a relational database, all records in a table must conform to the same schema. This becomes problematic when products belonging to different categories require distinct sets of attributes.
- For example:
    - Laptops require attributes such as RAM, processor, storage, and screen size.
    - Shoes require attributes such as size, colour, sole type, and material.
To accommodate this in an RDBMS, one of the following approaches must be used:
- Wide tables with many nullable columns, where most columns remain unused for certain product types, leading to:
    - Wasted storage
    - Poor readability
    - Increased complexity in queries
- Multiple subtype tables (e.g., Laptop_Details, Shoe_Details), which introduces:
    - Complex joins
    - Increased maintenance overhead
    - Difficulty in retrieving complete product data efficiently
Thus, relational databases lack the flexibility to handle heterogeneous attributes naturally within a single table.

### 2. Frequent schema changes when adding new product types
Relational databases enforce a strict schema, meaning any change to the structure requires Data Definition Language (DDL) operations such as ALTER TABLE.
When new product types are introduced:
- New columns must be added to existing tables, or
- New tables must be created to store additional attributes<br>
This leads to several challenges:
- Downtime or performance degradation during schema migrations
- Risk of breaking existing queries, views, or stored procedures
- Increased coordination between development and database administration teams
In dynamic business environments where product categories evolve frequently, such rigidity makes RDBMS systems less scalable and slower to adapt.

### 3. Storing customer reviews as nested data
Customer reviews represent a one-to-many relationship, where each product can have multiple reviews. In a relational database, this requires:
- A separate Reviews table
- Foreign key relationships linking reviews to products
- Multiple joins to retrieve product details along with their reviews<br>
This approach introduces the following issues:
- Increased query complexity due to joins
- Performance overhead when retrieving deeply related data
- Difficulty in representing hierarchical or nested data structures
Moreover, reviews often contain semi-structured data (e.g., varying comments, optional fields), which is not well-suited to rigid relational schemas.

## Section B: NoSQL Benefits

MongoDB, as a document-oriented NoSQL database, is specifically designed to address the limitations of relational databases when dealing with heterogeneous, evolving, and large-scale data. The given product dataset clearly illustrates how MongoDB efficiently solves the stated problems through the following mechanisms.

### 1. Flexible schema (document structure)
MongoDB stores data in JSON-like BSON documents, where each document can have a different structure without enforcing a rigid schema.
- Products of different categories can store only the attributes relevant to them.
    - For example:
        - A smartphone document may include RAM, a processor, and a battery.
        - A clothing document may include sizes_available, material, and fit.
- There is no requirement for all documents in a collection to share identical fields.<br>
**Advantages:**
    - Eliminates the need for nullable columns or multiple subtype tables
    - Simplifies data modelling for diverse product categories
    - Allows rapid iteration and adaptation to business requirements<br>
Thus, MongoDB naturally supports heterogeneous product attributes within a single collection.

### 2. Embedded documents (reviews within products)
MongoDB allows embedded documents and arrays, enabling related data to be stored together in a single document.
- In the given dataset, customer reviews are embedded directly inside each product document as an array of review objects.
- This design aligns with MongoDB’s principle of data locality, where frequently accessed related data is stored together.<br>
**Advantages:**
- Eliminates the need for joins to fetch product and review data
- Improves read performance by retrieving all relevant information in a single query
- Accurately represents real-world hierarchical relationships<br>
As a result, MongoDB handles nested and one-to-many relationships more efficiently than relational databases.

### 3. Horizontal scalability
MongoDB is built to support horizontal scaling through a mechanism known as sharding.
- Data is distributed across multiple servers (shards) based on a shard key (e.g., product_id or category).
- As the dataset grows, additional servers can be added to the cluster without downtime.<br>
**Key advantages:**
- Handles large volumes of products, reviews, and user activity efficiently
- Maintains high availability and performance under increasing load
- Avoids the vertical scaling limitations common in relational databases<br>
This makes MongoDB highly suitable for large-scale, high-traffic applications.