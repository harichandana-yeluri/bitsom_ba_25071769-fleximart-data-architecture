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