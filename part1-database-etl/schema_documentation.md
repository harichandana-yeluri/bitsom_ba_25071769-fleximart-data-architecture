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

### Customers
Primary Key: customer_id
Alternate Key: email
FD: customer_id → all other attributes
Justification: All non-key attributes depend directly on the primary/alternate key with no transitive dependency.