-- =========================
-- INSERT INTO dim_date
-- January – February 2024
-- =========================

INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,true),
(20240121,'2024-01-21','Sunday',21,1,'January','Q1',2024,true),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,true),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,false),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,false),
(20240217,'2024-02-17','Saturday',17,2,'February','Q1',2024,true),
(20240218,'2024-02-18','Sunday',18,2,'February','Q1',2024,true),
(20240224,'2024-02-24','Saturday',24,2,'February','Q1',2024,true),
(20240225,'2024-02-25','Sunday',25,2,'February','Q1',2024,true),
(20240228,'2024-02-28','Wednesday',28,2,'February','Q1',2024,false);

-- =========================
-- INSERT INTO dim_product
-- 15 products | 3 categories
-- =========================

INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','iPhone 14','Electronics','Mobile',69999),
('P002','Samsung TV 43"','Electronics','Television',32999),
('P003','HP Laptop','Electronics','Laptop',55999),
('P004','Boat Earbuds','Electronics','Accessories',1499),
('P005','Dell Monitor','Electronics','Monitor',12999),
('P006','Nike Shoes','Fashion','Footwear',4599),
('P007','Levi Jeans','Fashion','Clothing',2999),
('P008','Adidas T-Shirt','Fashion','Clothing',1299),
('P009','Puma Sneakers','Fashion','Footwear',5499),
('P010','H&M Jacket','Fashion','Outerwear',6999),
('P011','Basmati Rice 5kg','Groceries','Food Grains',650),
('P012','Organic Honey','Groceries','Health Food',450),
('P013','Almonds 1kg','Groceries','Dry Fruits',899),
('P014','Masoor Dal 1kg','Groceries','Pulses',120),
('P015','Cooking Oil 1L','Groceries','Essentials',199);

-- =========================
-- INSERT INTO dim_customer
-- 12 customers | 4 cities
-- =========================

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Rahul Sharma','Bangalore','Karnataka','Retail'),
('C002','Priya Patel','Mumbai','Maharashtra','Retail'),
('C003','Amit Kumar','Delhi','Delhi','Retail'),
('C004','Sneha Reddy','Hyderabad','Telangana','Retail'),
('C005','Vikram Singh','Bangalore','Karnataka','Corporate'),
('C006','Anjali Mehta','Mumbai','Maharashtra','Retail'),
('C007','Ravi Verma','Delhi','Delhi','Corporate'),
('C008','Pooja Iyer','Bangalore','Karnataka','Retail'),
('C009','Karthik Nair','Hyderabad','Telangana','Retail'),
('C010','Deepa Gupta','Delhi','Delhi','Retail'),
('C011','Arjun Rao','Mumbai','Maharashtra','Corporate'),
('C012','Lakshmi Krishnan','Hyderabad','Telangana','Retail');

-- =========================
-- INSERT INTO fact_sales
-- 40 transactions
-- =========================

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240101,1,1,2,69999,3000,136998),
(20240102,6,2,1,4599,0,4599),
(20240103,3,3,1,55999,2000,53999),
(20240104,11,4,5,650,0,3250),
(20240105,2,5,1,32999,1000,31999),
(20240106,9,6,2,5499,500,10498),
(20240107,4,7,3,1499,0,4497),
(20240108,8,8,2,1299,0,2598),
(20240109,14,9,10,120,0,1200),
(20240110,12,10,4,450,0,1800),
(20240113,1,11,1,69999,5000,64999),
(20240114,6,12,2,4599,0,9198),
(20240115,5,1,1,12999,1000,11999),
(20240120,15,2,6,199,0,1194),
(20240121,7,3,2,2999,0,5998),
(20240120,3,4,1,55999,3000,52999),
(20240121,10,5,1,6999,0,6999),
(20240106,13,6,3,899,0,2697),
(20240107,2,7,1,32999,2000,30999),
(20240114,4,8,4,1499,0,5996),
(20240201,11,9,2,650,0,1300),
(20240202,12,10,1,450,0,450),
(20240203,14,11,5,120,0,600),
(20240204,15,12,3,199,0,597),
(20240205,8,1,2,1299,0,2598),
(20240206,9,2,1,5499,0,5499),
(20240210,6,3,1,4599,0,4599),
(20240211,7,4,2,2999,0,5998),
(20240212,10,5,1,6999,0,6999),
(20240214,13,6,2,899,0,1798),
(20240217,1,7,3,69999,2000,203997),
(20240217,2,8,1,32999,1000,31999),
(20240218,3,9,2,55999,0,111998),
(20240218,4,10,1,1499,0,1499),
(20240224,5,11,4,12999,500,51196),
(20240224,6,12,2,4599,0,9198),
(20240225,7,1,1,2999,0,2999),
(20240225,8,2,2,1299,0,2598),
(20240228,9,3,3,5499,500,14997),
(20240228,10,4,1,6999,0,6999);