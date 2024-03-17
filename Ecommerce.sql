		## Create a database
CREATE DATABASE ecommerce;

		## Use the database
USE ecommerce;

		## Create table for products
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

		## Create table for categories
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

		## Create table for customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    shipping_address VARCHAR(50) NOT NULL
);

		## Create a table for orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

ALTER TABLE orders
MODIFY COLUMN order_date date;

		##  Create a table for order details (many-to-many relationship between orders and products)
CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_per_unit DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

SELECT * FROM products; 

		## Insert in table products 
INSERT INTO products (name, description, price, stock_quantity) VALUES
('T-Shirt', 'Cotton crew-neck t-shirt', 19.99, 100),
('Jeans', 'Slim-fit stretch denim jeans', 39.99, 50),
('Running Shoes', 'Lightweight breathable running shoes', 79.99, 75),
('Backpack', 'Water-resistant hiking backpack', 49.99, 30),
('Laptop', '15-inch ultrabook with SSD', 999.99, 20),
('Wireless Headphones', 'Bluetooth over-ear headphones', 129.99, 40),
('Smartwatch', 'Fitness tracker with heart rate monitor', 149.99, 25),
('Coffee Maker', 'Programmable drip coffee maker', 59.99, 15),
('Toaster', '4-slice stainless steel toaster', 29.99, 20),
('Portable Charger', 'High-capacity power bank', 39.99, 50);

		## Add a new column in the table products 
ALTER TABLE ecommerce.products
ADD COLUMN available bool; 
	
		## Update the the new column named available with values 
UPDATE products
SET available = TRUE
WHERE product_id = 1;
UPDATE products
SET available = FALSE
WHERE product_id = 2;
UPDATE products
SET available = TRUE
WHERE product_id = 3;
UPDATE products
SET available = TRUE
WHERE product_id = 4;
UPDATE products
SET available = TRUE
WHERE product_id = 5;
UPDATE products
SET available = FALSE
WHERE product_id = 6;
UPDATE products
SET available = FALSE
WHERE product_id = 7;
UPDATE products
SET available = TRUE
WHERE product_id = 8;
UPDATE products
SET available = TRUE
WHERE product_id = 9;

		## Insert in table categories
INSERT INTO categories (name) VALUES
('Clothing'),
('Electronics'),
('Accessories'),
('Kitchen Devices');

SELECT * FROM categories; 
SELECT * FROM products; 

			## Add column named category_id in products table 
ALTER TABLE ecommerce.products
ADD COLUMN category_id int; 

			## Add relationship between products and categories 
ALTER TABLE products
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id) REFERENCES categories(category_id);

			## Update the table products, set category_id for each product
UPDATE products
SET category_id = 1
WHERE product_id = 1;
UPDATE products
SET category_id = 1
WHERE product_id = 2;
UPDATE products
SET category_id = 1
WHERE product_id = 3;
UPDATE products
SET category_id = 3
WHERE product_id = 4;
UPDATE products
SET category_id = 2
WHERE product_id = 5;
UPDATE products
SET category_id = 2
WHERE product_id = 6;
UPDATE products
SET category_id = 2
WHERE product_id = 7;
UPDATE products
SET category_id = 4
WHERE product_id = 8;
UPDATE products
SET category_id = 4
WHERE product_id = 9;
UPDATE products
SET category_id = 2
WHERE product_id = 10;


		## Insert in table customers
INSERT INTO customers (first_name, last_name, shipping_address) VALUES
('John', 'Doe', '123 Main Street, Cityville'),
('Jane', 'Smith', '456 Elm Street, Townsville'),
('Michael', 'Johnson', '789 Oak Avenue, Villagetown'),
('Emily', 'Rose', '101 Pine Road, Hamletville'),
('David', 'Brown', '246 Cedar Lane, Villagecity'),
('Jessica', 'Taylor', '369 Maple Street, Downtown'),
('Matthew', 'Anderson', '555 Birch Boulevard, Suburbia'),
('Samantha', 'Martinez', '777 Walnut Way, Countryside');

SELECT * FROM customers; 

SELECT * FROM orders; 

		## Insert in table orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
(1, '2024-03-05', 50.00),
(3, '2024-02-14', 30.24),
(2, '2024-03-12', 100.00), 
(5, '2024-03-14', 75.00), 
(6, '2024-01-04', 150.99),
(8, '2024-04-01', 175.69);

SELECT * FROM categories;

			## Detele rows from categories table 
DELETE FROM categories 
    WHERE category_id = 5;
DELETE FROM categories 
    WHERE category_id = 6;
DELETE FROM categories 
    WHERE category_id = 7;
DELETE FROM categories 
    WHERE category_id = 8;


		## Delete rows from table orders 
DELETE FROM orders
    WHERE orders.order_id = 1;
DELETE FROM orders
    WHERE orders.order_id = 2;
DELETE FROM orders
	WHERE orders.order_id = 4;
DELETE FROM orders
    WHERE orders.order_id = 5;

			## Insert in table orders 
INSERT INTO orders (customer_id, order_date, total_amount) VALUES 
(3, '2024-03-05', 19.99),
(4, '2024-02-14', 999.99),
(5, '2024-03-12', 490.99), 
(6, '2024-03-14', 12.89), 
(7, '2024-01-04', 890.90),
(1, '2024-04-01', 129.99);

SELECT * FROM order_details; 
SELECT * FROM orders; 
SELECT * FROM products; 


		## Insert in table order_details 
INSERT INTO order_details (order_id, product_id, quantity, price_per_unit) VALUES 
(3, 1, 5, 19.99),
(6, 3, 2, 79.99), 
(7, 1, 1, 19.99), 
(8, 4, 1, 999.99),
(9, 5, 10, 49.99);

			## Select the products that have price graten than 50.00
SELECT product_id, name, price
FROM products
WHERE price > 50.00;

			## Select customers which have no orders 
SELECT customers.*
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL;

			## Select the customer which has the order with the highest price 
SELECT customers.customer_id, customers.first_name, customers.last_name, MAX(orders.total_amount) AS biggest_order
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.first_name, customers.last_name
ORDER BY biggest_order DESC
LIMIT 1;

			## Select Name & Price from products grouped by price (ascending)
SELECT name, price
FROM products
GROUP BY price,name
ORDER BY price ASC;

SELECT * FROM orders; 

			## Select the orders which have the total_amount between 10.00 and 100.00
SELECT order_id, order_date, total_amount FROM orders
WHERE total_amount BETWEEN 10.00 AND 100.00;

			## Select the orders which have the order date from 2024-04-01 to 2024-04-30
SELECT * FROM orders
WHERE order_date >= '2024-04-01' AND order_date <= '2024-04-30';

			## Select the orders which have the order date less than 2024-04-01 and total_amount bigger than 50.00
SELECT * FROM orders
WHERE order_date < '2024-04-01' AND total_amount > 50.00;

SELECT * FROM products; 
ALTER TABLE products
ADD COLUMN details varchar(50);

ALTER TABLE products
DROP COLUMN details;

ALTER TABLE products
ADD COLUMN details TEXT;

UPDATE products SET available = True WHERE product_id = 10;
UPDATE products SET details = 'Stock blocked in warehouse' WHERE product_id = 2;
UPDATE products SET details = 'Stock blocked in warehouse' WHERE product_id = 6;
UPDATE products SET details = 'Stock blocked in warehouse' WHERE product_id = 7;

			## Total number of the products available 
SELECT COUNT(*) FROM products
WHERE available = True;

			## Select total number of the orders that have total_amount bigger than 50.00
SELECT COUNT(*) FROM orders WHERE total_amount > 50.00;

			## Calculate the total of total_amount 
SELECT SUM(total_amount) AS total_order_amount FROM orders;

			## Select the customer and the total amount of the order 
SELECT customers.first_name, customers.last_name, orders.total_amount
FROM customers INNER JOIN orders 
ON customers.customer_id = customers.customer_id;

			## Select the customer name and the price for the product from order_details 
SELECT c.first_name, c.last_name, od.price_per_unit
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id;

			## Select the orders that have been placed but the stock is blocked 
SELECT products.name
FROM products INNER JOIN order_details  
ON products.product_id = order_details.product_id
WHERE available = 0;

			## Calculate the total price
SELECT order_detail_id, quantity * price_per_unit AS total_price
FROM order_details;

			## Count the number of orders placed by a customer 
SELECT o.customer_id, COUNT(*) AS num_orders
FROM orders o
GROUP BY o.customer_id;

			## Select column with right/left join 
SELECT o.order_id, p.name AS product_name, od.quantity, od.price_per_unit, (od.quantity * od.price_per_unit) AS total_price
FROM order_details od
RIGHT JOIN orders o ON o.order_id = od.order_id
LEFT JOIN products p ON od.product_id = p.product_id;

			## Calculate the sum of the total price (quantity multiplied by price_per_unit) from the order_details table, 
            ## joined with the orders and products tables using right and left joins respectively.
SELECT SUM(od.quantity * od.price_per_unit) AS total_price
FROM order_details od
RIGHT JOIN orders o ON o.order_id = od.order_id
LEFT JOIN products p ON od.product_id = p.product_id;

			## Count the number of rows  in the result set obtained after performing the right join between the orders and order_details tables 
            ## followed by a left join with the products table.
SELECT COUNT(*) AS total_rows
FROM order_details od
RIGHT JOIN orders o ON o.order_id = od.order_id
LEFT JOIN products p ON od.product_id = p.product_id;

		## Count the number of customers 
SELECT COUNT(*) AS customer_count
FROM customers;

SHOW CREATE TABLE categories;

