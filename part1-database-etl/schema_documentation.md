## ENTITY: customers
Purpose: Stores customer information
Attributes:
  - customer_id: Unique identifier (Primary Key).
  - first_name: Customer's first name, cannot be null.
  - last_name: Customer's last name, cannot be null.
  - email: Customer's email id, should be unique and cannot be null.
  - phone: Customer's phone number.
  - city: Customer's city.
  - registration_date: Customer's date of registration.

Relationships:
  - One customer can place MANY orders (1:M with orders table)


## ENTITY: products
Purpose: Stores products information
Attributes:
  - product_id: Product's unique identifier (Primary Key).
  - product_name: Product's name, cannot be null.
  - category: Product's category, cannot be null.
  - price: Product's price, cannot be null.
  - stock_quantity: Product's stock quantity, default value of this is 0.

Relationships:
  - One product can be placed MANY times [order_items] (1:M with orders_items table)


## ENTITY: orders
Purpose: Stores orders information
Attributes:
  - order_id: Unique identifier of the order (Primary Key).
  - customer_id: refers to the customer_id (customer who placed the order) in customers table (Foreign Key), cannot be null.
  - order_date: Date the order is placed, cannot be null.
  - total_amount: Total price of the order, cannot be null.
  - status: Represents the status of the order, default value is pending.

Relationships:
  - One order has  MANY order_itmes  (1:M with orders_items table)
  - One customer can place many orders (M:1 with customers table)


## ENTITY: order_items
Purpose: Stores order_items information
Attributes:
  - order_item_id: Unique id for every order_item in a order (Primary Key).
  - order_id: refers to the id of order that this item is part of (Foreign Key), cannot be null.
  - product_id: refers to the product_id (id of this product placed) from the products table (Foreign Key), cannot be null.
  - quantity: the no.of items in the order, cannot be null.
  - unit_price: price of each unit, cannot be null.
  - subtotal: this is the product of quantity and price that gives the sub-total of this item, cannot be null.

Relationships:
  - One product can be placed MANY times [order_items] (M:1 with products table)
  - One order can have multiple order_items (M:1 with orders table)


CUSTOMERS
(customer_id PK)
    |
    | 1–M
    |
ORDERS
(order_id PK, customer_id FK)
    |
    | 1–M
    |
ORDER_ITEMS
(order_item_id PK, order_id FK, product_id FK)
    |
    | M–1
    |
PRODUCTS
(product_id PK)


## Third Normal Form (3NF) Justification:

A relation is in Third Normal Form (3NF) if it is in 2NF and has no transitive dependency, i.e., every non-key attribute depends only on a candidate key.
**Formally:**
For every functional dependency X → A, either:
X is a superkey, or
A is a prime attribute

### Customers

- Primary Key: customer_id
- Alternate Key: email (Unique)
- FD: customer_id → first_name, last_name, email, phone, city, registration_date; email → first_name, last_name, phone, city, registration_date
- Justification: All non-key attributes depend directly on the primary/alternate key with no transitive dependency.

### Products

- Primary Key: product_id
- FD: product_id → product_name, category, price, stock_quantity
- Justification: All attributes are fully functionally dependent on the primary key.

### Orders

- Primary Key: order_id
- FD: order_id → customer_id, order_date, total_amount, status
- Justification: Customer details are not stored in this table, preventing transitive dependencies.

### Order_Items

- Primary Key: order_item_id
- Natural Key: (order_id, product_id)
- FD: (order_id, product_id) → quantity, unit_price, subtotal
Note: subtotal is a derived attribute (quantity × unit_price)<br>
⚠️ Strict 3NF violated due to derived attribute
✅ Acceptable denormalization in practice

**The schema satisfies Third Normal Form (3NF) as all non-key attributes in each relation are fully functionally dependent on the primary key and there are no transitive dependencies. The order_items.subtotal attribute represents a deliberate denormalization for performance optimization and does not introduce update anomalies under controlled application logic.**


## Sample Data Representation

### Customers table:
| customer_id | first_name | last_name | email                                                       | phone          | city      | registration_date |
| ----------- | ---------- | --------- | ----------------------------------------------------------- | -------------- | --------- | ----------------- |
| C001        | Rahul      | Sharma    | [rahul.sharma@gmail.com](mailto:rahul.sharma@gmail.com)     | +91-9876543210 | Bangalore | 2023-01-15        |
| C002        | Priya      | Patel     | [priya.patel@yahoo.com](mailto:priya.patel@yahoo.com)       | +91-9988776655 | Mumbai    | 2023-02-20        |
| C004        | Sneha      | Reddy     | [sneha.reddy@gmail.com](mailto:sneha.reddy@gmail.com)       | +91-9123456789 | Hyderabad | 2023-04-15        |
| C005        | Vikram     | Singh     | [vikram.singh@outlook.com](mailto:vikram.singh@outlook.com) | +91-9988112233 | Chennai   | 2023-05-22        |

### Products table:
| product_id | product_name       | category    | price     | stock_quantity |
| ---------- | ------------------ | ----------- | --------- | -------------- |
| P001       | Samsung Galaxy S21 | Electronics | 45999.00  | 150            |
| P002       | Nike Running Shoes | Fashion     | 3499.00   | 80             |
| P003       | Apple MacBook Pro  | Electronics | 14141.53  | 45             |
| P004       | Levi’s Jeans       | Fashion     | 2999.00   | 120            |

### Orders table:
| order_id | customer_id | order_date | total_amount     | status       |
| -------- | ----------- | ---------- | ---------------- | ------------ |
| T001     | C001        | 2024-01-15 | 45999.00         | Completed    |
| T002     | C002        | 2024-01-16 | 5998.00          | Completed    |
| T005     | C005        | 2024-01-20 | 1950.00          | Completed    |
| T006     | C006        | 2024-01-22 | 12999.00         | Completed    |

### Order_items table:
| order_item_id | order_id | product_id | quantity | unit_price     | subtotal        |
| ------------- | -------- | ---------- | -------- | -------------- | --------------- |
| 01            | T001     | P001       | 1        | 45999.00       | 45999.00        |
| 02            | T002     | P004       | 2        | 2999.00        | 5998.00         |
| 03            | T005     | P009       | 3        | 650.00         | 1950.00         |
| 04            | T006     | P012       | 1        | 12999.00       | 12999.00        |
