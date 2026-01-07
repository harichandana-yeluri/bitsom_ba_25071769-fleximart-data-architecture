# Section 1: Schema Overview

## FlexiMart Data Warehouse – Star Schema Description

### FACT TABLE: `fact_sales`

**Grain:**  
One row represents a single sales transaction for **one product sold to one customer on a specific date**.

**Business Process:**  
Sales transactions recorded at the product level.

### Measures (Numeric Facts):
- **quantity_sold:** Number of units of a product sold in a transaction.
- **unit_price:** Selling price per unit at the time of sale.
- **discount_amount:** Discount applied to the transaction, if any.
- **total_amount:** Final sales value after discount, calculated as  
  **(quantity_sold × unit_price) − discount_amount**.

### Foreign Keys:
- **date_key → dim_date:** Links each sale to the corresponding date.
- **product_key → dim_product:** Links each sale to the product sold.
- **customer_key → dim_customer:** Links each sale to the customer who made the purchase.

---

### DIMENSION TABLE: `dim_date`

**Purpose:**  
Provides a comprehensive date reference for time-based analysis such as daily, monthly, quarterly, and yearly sales trends.

**Type:**  
Conformed Dimension

### Attributes:
- **date_key (PK):** Surrogate key representing the date (integer, format: YYYYMMDD)
- **full_date:** Actual calendar date
- **day_of_week:** Name of the day (Monday, Tuesday, etc.)
- **day_of_month:** Day number within the month (1–31)
- **month:** Month number (1–12)
- **month_name:** Name of the month (January, February, etc.)
- **quarter:** Quarter of the year (Q1, Q2, Q3, Q4)
- **year:** Calendar year (e.g., 2023, 2024)
- **is_weekend:** Boolean indicator specifying whether the date falls on a weekend

---

### DIMENSION TABLE: `dim_product`

**Purpose:**  
Stores descriptive information about products to support product-level sales analysis.

**Type:**  
Slowly Changing Dimension (SCD Type 1)

### Attributes:
- **product_key (PK):** Surrogate key generated for each product record
- **product_id:** Business key identifying the product from the source system
- **product_name:** Name of the product
- **category:** High-level product category (e.g., Electronics, Fashion, Groceries)
- **subcategory:** Detailed product classification
- **unit_price:** Standard selling price of the product

---

### DIMENSION TABLE: `dim_customer`

**Purpose:**  
Captures customer-related descriptive data for customer-centric sales analysis.

**Type:**  
Slowly Changing Dimension (SCD Type 1)

### Attributes:
- **customer_key (PK):** Surrogate key uniquely identifying each customer record
- **customer_id:** Business key from the source customer system
- **customer_name:** Full name of the customer
- **city:** City of residence
- **state:** State of residence
- **customer_segment:** Customer classification (e.g., Retail, Corporate)

---

### Summary

The FlexiMart data warehouse follows a **star schema design** with a central `fact_sales` table connected to three dimension tables: `dim_date`, `dim_product`, and `dim_customer`.  
This structure enables efficient analytical queries for evaluating sales performance across **time**, **products**, and **customers**, supporting effective business intelligence and decision-making.



# Section 2: Design Decisions

## 1. Why you chose this granularity (transaction line-item level)

The transaction line-item level was chosen to capture sales data at the lowest level of detail, where each record represents a single product sold to a customer on a specific date. This granularity provides maximum analytical flexibility, allowing data to be aggregated for time-based, product-wise, and customer-wise analysis.

It also ensures accurate revenue and discount calculations, since prices and discounts can vary by product within the same transaction. Additionally, storing detailed data supports advanced analysis such as customer behavior and product performance. Overall, this granularity follows data warehousing best practices and makes the schema scalable for future analytical needs.

## 2. Why surrogate keys instead of natural keys

Surrogate keys are used instead of natural keys because they provide better performance, stability, and flexibility in a data warehouse environment. Surrogate keys are system-generated and have no business meaning, which ensures they remain unchanged even if source system identifiers change.

Using surrogate keys also improves query performance, as integer-based keys are faster to join than alphanumeric natural keys. Additionally, surrogate keys simplify the management of slowly changing dimensions, allowing multiple versions of a dimension record to exist without relying on changing business keys.

Overall, surrogate keys ensure data integrity, efficient joins, and long-term maintainability, making them more suitable than natural keys for dimensional modeling.

## 3. How this design supports drill-down and roll-up operations

This star schema design supports drill-down and roll-up operations by storing data at a detailed transaction level in the fact table and linking it to well-structured dimension tables.

Roll-up operations are enabled through hierarchical attributes in dimensions, such as day → month → quarter → year in the dim_date table and product → category in the dim_product table. These hierarchies allow data to be aggregated smoothly from detailed levels to higher summary levels.

Drill-down operations are supported because the fact table stores the lowest level of detail. Users can start from summarized data, such as yearly or category-level sales, and drill down to monthly, daily, or individual product and customer-level sales.

Thus, the combination of detailed facts and hierarchical dimensions allows flexible navigation between summarized and detailed views of sales data.



# Section 3: Sample Data Flow

**Source Transaction** (OLTP System):
Order # 101, Customer "John Doe", Product "Laptop", Qty: 2, Price: 50000
- Order Number: 101
- Customer Name: John Doe
- Product: Laptop
- Quantity: 2
- Unit Price: 50,000
- Order Date: 15-01-2024

### ETL Processing Overview

1. Extract:
    - Transaction details are extracted from the source order and customer systems.

2. Transform:
    - Customer and product names are matched with existing records in dimension tables.
    - Surrogate keys are generated or retrieved for date, product, and customer.
    - Total sales amount is calculated as quantity × unit price.

3. Load:
    - The transformed data is loaded into the fact and dimension tables.

**Becomes in Data Warehouse:**
**dim_date**
{
  date_key: 20240115,
  full_date: '2024-01-15',
  month: 1,
  quarter: 'Q1',
  year: 2024
}

**dim_product**
{
  product_key: 5,
  product_name: 'Laptop',
  category: 'Electronics'
}

**dim_customer**
{
  customer_key: 12,
  customer_name: 'John Doe',
  city: 'Mumbai'
}

**fact_sales**
{
  date_key: 20240115,
  product_key: 5,
  customer_key: 12,
  quantity_sold: 2,
  unit_price: 50000,
  total_amount: 100000
}

### Explanation:
The original source transaction is decomposed during ETL into dimension records (date, product, customer) and a fact record. The fact table stores only numeric measures and foreign keys, while descriptive information is maintained in dimension tables, enabling efficient analytical querying in the data warehouse.
