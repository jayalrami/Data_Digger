📊 DataDigger – SQL Database Project 📌 Project Overview

DataDigger is a simple SQL-based database system that manages:

Customers

Orders

Products

Order Details

This project demonstrates basic SQL operations including:

Database & Table Creation

Insert, Update, Delete

Select Queries

Aggregate Functions

Sorting & Filtering

Foreign Key Relationships

🗄️ Database Creation CREATE DATABASE DataDigger; USE DataDigger;

👥 Customer Table Create Table CREATE TABLE Customer ( c_id INT PRIMARY KEY, name VARCHAR(50), Email VARCHAR(50), Address VARCHAR(50) );

Insert Sample Data INSERT INTO Customer (c_id, name, Email, Address) VALUES (101,'Alice','Alice34@gmail.com','London'), (102,'Het','Het4@gmail.com','Surat'), (103,'Meet','meet74@gmail.com','Canada'), (104,'Ajay','Ajay8@gmail.com','Ahmedabad'), (105,'Shivam','Shivam674@gmail.com','New York');

Update Customer Address UPDATE Customer SET Address = 'UK' WHERE c_id = 101;

Delete a Customer DELETE FROM Customer WHERE c_id = 103;

Select Queries -- Display customer named 'Het' SELECT * FROM Customer WHERE name = 'Het';

-- Retrieve all customers SELECT * FROM Customer;

📦 Orders Table Create Table CREATE TABLE Orders ( order_id INT PRIMARY KEY, c_id INT, order_date DATE, total_amount DECIMAL(10,2), FOREIGN KEY (c_id) REFERENCES Customer(c_id) );

Insert Sample Orders INSERT INTO Orders (order_id, c_id, order_date, total_amount) VALUES (1,101,'2025-01-03',900.50), (2,102,'2025-02-08',86000), (3,101,'2025-03-27',90000), (4,101,'2025-03-17',890000), (5,102,'2025-05-13',90000);

Queries -- Orders by specific customer SELECT * FROM Orders WHERE c_id = 101;

-- Update order amount UPDATE Orders SET total_amount = 56000.50 WHERE order_id = 1;

-- Delete an order DELETE FROM Orders WHERE order_id = 2;

-- Orders in last 30 days SELECT * FROM Orders WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

-- Highest, Lowest & Average Order Amount SELECT MAX(total_amount) AS Highest_amount, MIN(total_amount) AS Lowest_amount, AVG(total_amount) AS Average_amount FROM Orders;

🛍️ Product Table Create Table CREATE TABLE Product ( P_id INT PRIMARY KEY, name VARCHAR(50), price DECIMAL(10,2), stock INT );

Insert Sample Products INSERT INTO Product (P_id, name, price, stock) VALUES (101,'Laptop',80000,10), (102,'Phone',84000,17), (103,'Smartwatch',3400,3), (104,'HeadPhone',5600,2), (105,'AC',67000,45);

Queries -- Products sorted by price (Descending) SELECT * FROM Product ORDER BY price DESC;

-- Update product price UPDATE Product SET price = 2000 WHERE P_id = 102;

-- Delete product if out of stock DELETE FROM Product WHERE stock = 0;

-- Products between 500 and 2000 SELECT * FROM Product WHERE price BETWEEN 500 AND 2000;

-- Most expensive & cheapest product SELECT MAX(price) AS Most_expensive_price, MIN(price) AS Cheapest_price FROM Product;

🧾 Order Details Table Create Table CREATE TABLE Order_details ( od_id INT PRIMARY KEY, order_id INT, P_id INT, quantity INT, sub_total INT, FOREIGN KEY (order_id) REFERENCES Orders(order_id), FOREIGN KEY (P_id) REFERENCES Product(P_id) );

Insert Sample Data INSERT INTO Order_details (od_id, order_id, P_id, quantity, sub_total) VALUES (1,1,101,1,9000), (2,1,101,1,4000), (3,1,102,1,6000), (4,2,102,1,5600), (5,3,103,3,34000);

Queries -- Order details for specific order SELECT * FROM Order_details WHERE order_id = 2;

-- Total Revenue SELECT SUM(sub_total) AS Total_Revenue FROM Order_details;

-- Top 3 Most Ordered Products SELECT P_id, SUM(quantity) AS Total_Quantity FROM Order_details GROUP BY P_id ORDER BY Total_Quantity DESC LIMIT 3;

-- Count how many times product sold SELECT P_id, COUNT(*) AS Times_Sold FROM Order_details WHERE P_id = 102;

📈 Features Covered

✅ Primary Keys ✅ Foreign Keys ✅ CRUD Operations ✅ Aggregate Functions ✅ Sorting & Filtering ✅ Date Functions ✅ Group By & Limit
