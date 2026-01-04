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
