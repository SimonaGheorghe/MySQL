# Database Project for Ecommerce 

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice. <br>
Application under test: Ecommerce<br> 
Tools used: MySQL Workbench<br> 

## Database description: 
This database represents an e-commerce system with tables for managing products, categories, customers, orders, and order details. Here's a short description of each table:<br> 
<strong> Products </strong>: Stores information about products offered by the e-commerce platform, including their names, descriptions, prices, and stock quantities.<br> 
<strong>Categories </strong>: Contains categories or classifications for products. Each category has a unique identifier and a name.<br> 
<strong>Customers</strong>: Stores information about customers who make purchases on the platform, including their names and shipping addresses.<br> 
<strong>Orders</strong>: Represents individual orders placed by customers. Each order has a unique identifier, a timestamp for the order date, the total amount of the order, and a reference to the customer who placed the order.<br> 
<strong>Order Details</strong>: Records the details of each product within an order, including the quantity ordered, the price per unit, and references to the corresponding order and product.
These tables together form the backbone of an e-commerce system, allowing the platform to manage products, track orders, and serve customers effectively.<br> 

## 1. Database Schema 
You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them. <br> 
The tables are connected in the following way:<br> 
<strong>Products</strong> is connected with <strong>Order Details </strong>  through a one-to-many relationship which was implemented through <em> product_id </em>as a primary key and <em>product_id</em> as a foreign key. <br> 
<strong>Categories</strong> is connected with <strong>Products </strong>  through a one-to-many relationship which was implemented through <em> category_id </em>as a primary key and <em>category_id</em> as a foreign key. <br> 
<strong>Customers</strong> is connected with <strong> Orders </strong>  through a one-to-many relationship which was implemented through <em> customer_id </em>as a primary key and <em>customer_id</em> as a foreign key. <br> 
<strong>Orders</strong> is connected with <strong> Order Details </strong>  through a one-to-many relationship which was implemented through <em> order_id </em>as a primary key and <em> order_id </em> as a foreign key. <br> 
<strong>Order Details </strong> is connected with <strong> Products </strong>  through a many-to-one relationship which was implemented through <em> product_id </em>as a primary key and <em> product_id </em> as a foreign key. <br>

## 2. Database Queries
<strong><li> DDL (Data Definition Language) </li></strong><br>
In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase.<br><br>
Below you can find all the insert instructions that were created in the scope of this project:<br> 
<strong>Database Creation:</strong>
CREATE DATABASE ecommerce: Creates a new database named "ecommerce".<br>
USE ecommerce;: Specifies that subsequent SQL statements will operate within the "ecommerce" database.<br>

<strong>Table Creation:</strong> <br>
CREATE TABLE products (...): Defines the structure of the "products" table, specifying columns such as product_id, name, description, price, available, customer_id.<br>
CREATE TABLE categories (...): Defines the structure of the "categories" table with columns category_id and name.<br>
CREATE TABLE customers (...): Creates the "customers" table with columns customer_id, first_name, last_name, and shipping_address.<br>
CREATE TABLE orders (...): Establishes the "orders" table with columns order_id, customer_id, order_date, and total_amount.<br>
CREATE TABLE order_details (...): Sets up the "order_details" table with columns order_detail_id, order_id, product_id, quantity, and price_per_unit.<br>
<img width="437" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/2176f7e9-614f-49f4-9ffc-8310ad839378"><img width="440" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/9083d5c8-37bd-495e-9068-01f601e31d65"><img width="581" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/a233b583-4e59-42cf-856b-9e3b6f734831"><br> 

After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:<br>
ALTER TABLE orders MODIFY COLUMN order_date date - Alters the data type of the "order_date" column in the "orders" table from TIMESTAMP to DATE.<br>
<img width="218" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/73b83b5c-a01a-40ec-968d-0246b01aa570"> <br> 
ALTER TABLE ecommerce.products ADD COLUMN available bool -  Adds a new column named "available" to the "products" table.<br>
<img width="328" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/3277f537-0da1-490b-ab7f-392f5e1816ee"> <br> 
ALTER TABLE ecommerce.products ADD COLUMN category_id int - Adds a new column named "category_id" to the "products" table.<br>
<img width="203" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/ee4c1c1c-8d72-4a33-b806-4dfcc3cf6b2f"> <br> 
ALTER TABLE products ADD CONSTRAINT fk_category ...: Creates a foreign key constraint named "fk_category" on the "category_id" column of the "products" table, referencing the "category_id" column of the "categories" table.<br> 
<img width="388" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/acb259cf-dace-4beb-ad75-30b656929e33"> <br> 
ALTER TABLE products ADD COLUMN details - Adds a new column named "details" to the "products" table. <br> 
<img width="247" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/dfee29b4-8325-4fbf-9e70-29a978d05672"> <br> 

<strong><li> DML (Data Manipulation Language) </li></strong><br>
In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase. <br>
Below you can find all the insert instructions that were created in the scope of this project:<br> 
INSERT INTO products (...) VALUES (...): Inserts data into the "products" table. <br> 
<img width="425" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/6833c27f-9720-46cc-8768-9b4f23b23ff4"><br>
INSERT INTO categories (...) VALUES (...): Inserts data into the "categories" table. <br>
<img width="262" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/63af056d-5740-4a80-9137-15d22d90c544"><br>
INSERT INTO customers (...) VALUES (...): Inserts data into the "customers" table. <br>
<img width="433" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/99df4391-36bd-41de-adf3-0f58b674f93e"> <br>
INSERT INTO orders (...) VALUES (...): Inserts data into the "orders" table. <br>
<img width="392" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/a9661fbb-7818-4dfe-b279-427dacaaeb9e"> <br>
INSERT INTO order_details (...) VALUES (...): Inserts data into the "order_details" table. <br>
<img width="528" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/1c4b5202-a2cf-4110-b589-8a0e264ac586"> <br>
After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:<br>
<img width="455" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/68c32f5d-c787-4263-83ad-3f9e260e5ca7"><br> 
<img width="404" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/a6669fc3-93d7-4da7-9505-fc66b9816f53"> <br> 

<strong><li> DQL (Data Query Language) </li></strong><br>
After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean:<br> 
<img width="515" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/19c219e2-2bcb-4f1c-8647-505568acbf2a"> <br> 
<img width="365" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/c6feaf4f-90f8-47e4-85fb-07982e32d33e"> <br> 
<img width="377" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/45d4e9cf-704d-4c0b-9457-f7ef5f6beae7"> <br> 

In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations: <br> 
<img width="493" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/62fd2ff7-a3b1-4746-bd6b-0844a0f689bd"> <br> 
<img width="580" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/f9f19033-2bf1-4e9e-acfa-c20b05c0ea46"> <br> 
<img width="612" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/94aafcfa-0606-4b15-83e1-1e35e2e8648e"> <br> 
<img width="499" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/205db8ae-b52e-4645-821a-31788cc7ca16"> <Br> 
<img width="572" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/581ea671-c402-4dd2-b3bf-8f1f246be7d5"> <br> 
<img width="647" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/326b830a-154a-4019-a693-9631a938f33d"> <br> 
<img width="707" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/2e07d1bc-8d94-4870-83d7-b535fa60c732"> <br> 
<img width="560" alt="image" src="https://github.com/SimonaGheorghe/MySQL/assets/163425980/b5bbf4ff-41f0-49e3-aebf-3600dacdcf4d"> <br> 

<strong><li> Conclusions </li></strong><br>
The database schema represents a simplified e-commerce system with tables for managing products, categories, customers, orders, and order details. Here's a conclusion summarizing its key components and functionalities:<br>
Products Table: Contains information about the products offered by the e-commerce platform, including product name, description, price, and stock quantity. Each product can be associated with a specific category through the category_id foreign key.<br>
Categories Table: Stores product categories, allowing products to be organized into distinct groups. Categories are referenced by the category_id foreign key in the products table, enabling categorization and easier navigation of the product catalog.<br>
Customers Table: Manages customer data, including their first and last names, as well as shipping addresses. Each customer is assigned a unique customer_id, which serves as the primary key for identifying and tracking customers.<br>
Orders Table: Tracks orders placed by customers, recording details such as order ID, customer ID, order date, and total order amount. The customer_id foreign key establishes a relationship between orders and customers, enabling order tracking and management.<br>
Order Details Table: Facilitates the storage of order-specific details, including the products ordered, quantities, and prices per unit. This table implements a many-to-many relationship between orders and products, allowing multiple products to be associated with a single order and vice versa.
<br>
The database supports various operations essential for e-commerce functionality, such as:
<li>Adding, updating, and deleting products, categories, and customers.<br></li>
<li>Placing and managing orders, including order creation, modification, and cancellation.<br></li>
<li>Tracking inventory levels and availability of products.<br></li>
<li>Analyzing sales data and customer behavior.<br></li>

Overall, the database provides a foundation for building and managing an e-commerce platform, enabling efficient product management, order processing, and customer relationship management. Additional features and functionalities can be incorporated as needed to meet specific business requirements and enhance the user experience.

## Leason Learned: <br> 
<li>Proper data modeling is essential for organizing and structuring data effectively. Tables should be designed to accurately represent real-world entities and their relationships, such as products, categories, customers, orders, and order details. </li>
<li>Understanding SQL query syntax and utilizing aggregate functions, joins, and filtering conditions enables effective data retrieval and reporting. Querying the database allows for extracting meaningful insights and generating useful reports for decision-making.</li>
<li>Regular maintenance tasks, such as data insertion, updates, and deletion, should be performed carefully to avoid unintended consequences. Additionally, data backup and recovery procedures should be established to safeguard against data loss.</li>





















