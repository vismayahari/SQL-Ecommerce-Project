CREATE database e_commerce;
USE e_commerce;

CREATE table customer (
    customer_id int primary key,
    customer_name varchar(100),
    city varchar(50),
    signup_date date
);

INSERT INTO customer
(customer_id, customer_name, city, signup_date)
VALUES
(1, 'Aparna', 'Kochi', '2025-01-10'),
(2, 'Adarsh', 'Palakkad', '2025-02-15'),
(3, 'Amal', 'Kollam', '2025-03-20'),
(4, 'Arjun', 'Thrissur', '2025-04-05'),
(5, 'Diya', 'Kochi', '2025-05-12'),
(6, 'Athira', 'Tvm', '2025-06-15'),
(7, 'Vinay', 'Kochi', '2025-07-02'),
(8, 'Sneha', 'Alappuzha', '2025-07-10'),
(9, 'Akhil', 'Thrissur', '2025-07-18'),
(10, 'Arathi', 'Palakkad', '2025-08-01'),
(11, 'Nikhil', 'Kollam', '2025-08-05'),
(12, 'Anju', 'Kochi', '2025-08-12'),
(13, 'Amritha', 'Alappuzha', '2025-08-20'),
(14, 'Athi', 'Tvm', '2025-09-01'),
(15, 'Abi', 'Palakkad', '2025-09-10');
SELECT * FROM customer;

CREATE table order_s(
    order_id int primary key,
    customer_id int,
    order_date date,
    status varchar(20),
    foreign key (customer_id) references customer(customer_id)
);

INSERT INTO order_s
(order_id, customer_id, order_date, status)
VALUES
(101, 1, '2025-06-01', 'delivered'),
(102, 2, '2025-06-03', 'shipped'),
(103, 3, '2025-06-05', 'pending'),
(104, 4, '2025-06-08', 'delivered'),
(105, 5, '2025-06-10', 'cancelled'),
(106, 6, '2025-07-02', 'delivered'),
(107, 7, '2025-07-05', 'delivered'),
(108, 8, '2025-07-08', 'shipped'),
(109, 9, '2025-07-12', 'delivered'),
(110, 10, '2025-07-15', 'pending'),
(111, 11, '2025-07-20', 'delivered'),
(112, 12, '2025-07-25', 'delivered'),
(113, 13, '2025-08-01', 'shipped'),
(114, 14, '2025-08-05', 'delivered'),
(115, 15, '2025-08-10', 'delivered'),
(116, 1, '2025-08-15', 'delivered'),
(117, 2, '2025-08-18', 'delivered'),
(118, 3, '2025-08-20', 'cancelled'),
(119, 4, '2025-08-22', 'delivered'),
(120, 5, '2025-08-25', 'pending');
SELECT * FROM order_s;



CREATE table product(
    product_id int primary key,
    product_name varchar(100),
    category varchar(50),
    price decimal(10,2),
    seller_id int
);

INSERT INTO product
(product_id, product_name, category, price, seller_id)
VALUES
(1, 'Laptop', 'Electronics', 55000.00, 1),
(2, 'Smartphone', 'Electronics', 25000.00, 4),
(3, 'Headphones', 'Electronics', 2500.00, 1),
(4, 'Keyboard', 'Electronics', 1500.00, 4),
(5, 'Mouse', 'Electronics', 800.00, 1),
(6, 'TV', 'Electronics', 70000.00, 2),
(7, 'Jeans', 'Clothing', 1800.00, 2),
(8, 'Sneakers', 'Clothing', 3000.00, 2),
(9, 'Backpack', 'Accessories', 1200.00, 5),
(10, 'Watch', 'Accessories', 2500.00, 5),
(11, 'Water Bottle', 'Home', 500.00, 3),
(12, 'Coffee Maker', 'Home', 4500.00, 3),
(13, 'Table Lamp', 'Home', 1200.00, 3),
(14, 'Office Chair', 'Furniture', 7500.00, 3),
(15, 'Study Table', 'Furniture', 6000.00, 3);
SELECT * FROM product;

CREATE table seller(
    seller_id int primary key,
    seller_name varchar(100),
    city varchar(50)
);

INSERT into seller(seller_id, seller_name, city)
values
(1, 'TechWorld', 'Kochi'),
(2, 'FashionHub', 'TVM'),
(3, 'HomeNeeds', 'Palakkad'),
(4, 'GadgetZone', 'Thrissur'),
(5, 'DailyMart', 'Kollam');
SELECT * FROM seller;

CREATE table order_item(
    order_item_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    unit_price decimal(10,2),

    foreign key (order_id) references order_s(order_id),
    foreign key (product_id) references product(product_id)
);


INSERT INTO order_item
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 101, 1, 1, 55000.00),
(2, 101, 5, 2, 800.00),
(3, 102, 2, 1, 25000.00),
(4, 102, 6, 2, 70000.00),
(5, 103, 3, 1, 2500.00),
(6, 104, 6, 2, 70000.00),
(7, 104, 8, 1, 3000.00),
(8, 105, 11, 2, 500.00),
(9, 105, 13, 1, 1200.00),
(10, 106, 7, 1, 1800.00),
(11, 106, 9, 1, 1200.00),
(12, 107, 12, 1, 4500.00),
(13, 107, 11, 2, 500.00),
(14, 108, 2, 1, 25000.00),
(15, 108, 5, 2, 800.00),
(16, 109, 14, 1, 7500.00),
(17, 109, 9, 1, 1200.00),
(18, 110, 6, 3, 70000.00),
(19, 110, 8, 1, 3000.00),
(20, 111, 1, 1, 55000.00),
(21, 111, 7, 1, 1800.00),
(22, 112, 15, 1, 6000.00),
(23, 112, 13, 2, 1200.00),
(24, 113, 10, 1, 2500.00),
(25, 113, 7, 2, 1800.00),
(26, 114, 4, 1, 1500.00),
(27, 114, 5, 2, 800.00),
(28, 115, 2, 1, 25000.00),
(29, 115, 6, 2, 70000.00),
(30, 116, 1, 1, 55000.00),
(31, 116, 5, 1, 800.00),
(32, 117, 3, 2, 2500.00),
(33, 117, 10, 1, 2500.00),
(34, 118, 11, 2, 500.00),
(35, 118, 13, 1, 1200.00),
(36, 119, 14, 1, 7500.00),
(37, 119, 9, 2, 1200.00),
(38, 120, 8, 1, 3000.00);
SELECT * FROM order_item;

CREATE table payment(
    payment_id int primary key,
    order_id int,
    payment_type varchar(30),
    payment_amount decimal(10,2),
    payment_date date,

    foreign key (order_id) references order_s(order_id)
);

INSERT INTO payment
(payment_id, order_id, payment_type, payment_amount, payment_date)
VALUES
(1, 101, 'UPI', 56600.00, '2025-06-01'),
(2, 102, 'Credit Card', 165000.00, '2025-06-03'),
(3, 103, 'Cash on Delivery', 2500.00, '2025-06-05'),
(4, 104, 'UPI', 143000.00, '2025-06-08'),
(5, 105, 'Debit Card', 2200.00, '2025-06-10'),
(6, 106, 'UPI', 3000.00, '2025-07-02'),
(7, 107, 'Credit Card', 5500.00, '2025-07-05'),
(8, 108, 'Debit Card', 26600.00, '2025-07-08'),
(9, 109, 'UPI', 8700.00, '2025-07-12'),
(10, 110, 'Cash on Delivery', 213000.00, '2025-07-15'),
(11, 111, 'Credit Card', 56800.00, '2025-07-20'),
(12, 112, 'UPI', 8400.00, '2025-07-25'),
(13, 113, 'Debit Card', 6100.00, '2025-08-01'),
(14, 114, 'Credit Card', 3100.00, '2025-08-05'),
(15, 115, 'UPI', 165000.00, '2025-08-10'),
(16, 116, 'Credit Card', 55800.00, '2025-08-15'),
(17, 117, 'UPI', 7500.00, '2025-08-18'),
(18, 118, 'Debit Card', 2200.00, '2025-08-20'),
(19, 119, 'UPI', 9900.00, '2025-08-22'),
(20, 120, 'Cash on Delivery', 3000.00, '2025-08-25');
SELECT * FROM payment;


-- 1 List all the customers from the customer table.
SELECT * FROM customer;

-- 2 Find the customers who are from kochi.
SELECT * FROM customer 
WHERE city = 'Kochi';

-- 3 Display all the orders whose status is delivered.
SELECT * FROM order_s
WHERE status = 'delivered' ;

-- 4 Find all orders placed after july 2025.
SELECT * from order_s
WHERE order_date >= '2025-08-01';

-- 5 Find all products whose price is greater than 4,000.
SELECT * FROM product
WHERE price > 4000 ;

-- 6 Display all products belonging to the Electronics category.
SELECT * FROM product
WHERE category = 'Electronics';

-- 7 Display the 5 most expensive products.
SELECT * FROM product 
ORDER BY price desc LIMIT 5;

-- 8 Find customers who signed up after june 1 2025.
SELECT * FROM customer
WHERE signup_date > '2025-06-01';

-- 9 Display the customers name along with their order id.
SELECT c.customer_name , o.order_id
FROM customer c JOIN order_s o
ON c.customer_id = o.customer_id; 

-- 10 Find the total number of order.
SELECT COUNT(*) AS total_orders
FROM order_s;

-- 11 Find the total number of deliverd orders.
SELECT COUNT(*) AS delivered_orders
FROM order_s WHERE status = 'delivered';

-- 12 Find the total quantity of products ordered.
SELECT SUM(quantity) AS total_quantity
FROM order_item;

-- 13 Calculate the total sales / revenue.
SELECT SUM(quantity * unit_price)
AS total_revenue
FROM order_item;

-- 14 Find the total quantity sold for each product.
SELECT p.product_name,SUM(oi.quantity)
AS total_quantity FROM product p
JOIN order_item oi ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- 15 Find total sales for each product category.
SELECT category,SUM(quantity * unit_price)
AS total_sales FROM product 
JOIN order_item USING (product_id)
GROUP BY  category;

-- 16 Find the average price of all products.
SELECT AVG(price) AS average_price 
FROM product;

-- 17 Find the average order value.
SELECT AVG(total) AS average_order
FROM(SELECT order_id,SUM(quantity*unit_price)
AS total FROM order_item
GROUP BY order_id ) AS order_s;

-- 18 Find the number of orders for each status.
SELECT status,COUNT(*) AS total_orders
FROM order_s GROUP BY status;

-- 19 Find the sellers who generated more than 50000 in total revenue.
SELECT s.seller_name,SUM(oi.quantity * oi.unit_price)
AS total_sales FROM seller s JOIN product p
ON s.seller_id = p.seller_id JOIN order_item oi
ON p.product_id = oi.product_id
GROUP BY s.seller_name HAVING SUM(oi.quantity *oi.unit_price)>50000;

-- 20. Find the top 5 customers based on total spending
SELECT c.customer_name,SUM(oi.quantity * oi.unit_price) 
AS total_spending FROM customer c
JOIN order_s o ON c.customer_id = o.customer_id
JOIN order_item oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC LIMIT 5;

-- 21. Find customers who have placed more than one order
SELECT c.customer_name,COUNT(o.order_id) 
AS total_orders FROM customer c
JOIN order_s o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;

-- 22. Find the highest-revenue product in each category.
SELECT product_name, category, revenue
FROM (SELECT product_name,category,revenue,
RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rnk
FROM (SELECT p.product_id,p.product_name,p.category,
SUM(oi.quantity * oi.unit_price) AS revenue
FROM product p JOIN order_item oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category)
AS product_sales) AS ranked_products
WHERE rnk = 1;

-- 23. Find products whose total revenue is greater than average product revenue
SELECT product_name, revenue 
FROM (SELECT p.product_name,
SUM(oi.quantity * oi.unit_price) AS revenue
FROM product p JOIN order_item oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name) AS product_sales
WHERE revenue > (SELECT AVG(revenue)
FROM (SELECT SUM(quantity * unit_price) AS revenue
FROM order_item GROUP BY product_id)
AS avg_sales);

-- 24. Calculate total sales for each month.
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
SUM(oi.quantity * oi.unit_price) AS total_sales
FROM order_s o JOIN order_item oi
ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

-- 25 Create a view named monthly_sales_summary that displays the monthly sales/revenue.
CREATE VIEW monthly_sales_summary AS
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
SUM(oi.quantity * oi.unit_price) AS total_sales
FROM order_s o JOIN order_item oi
ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m');

SELECT * FROM monthly_sales_summary;