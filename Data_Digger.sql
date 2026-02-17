CREATE DATABASE DataDigger;
use DataDigger;
 
# ----------- Customers ------------
 
CREATE TABLE Customer (
	c_id int primary key,
    name varchar(50),
    Email varchar(50),
    Address varchar(50)
);

# insert at least 5 sample customers into the Customers table.

insert into Customer (c_id,name,Email,Address) values
(101,'Alice','Alice34@gmail.com','London'),
(102,'Het','Het4@gmail.com','surat'),
(103,'Meet','meet74@gmail.com','canada'),
(104,'Ajay','Ajay8@gmail.com','Ahmedabad'),
(105,'Shivam','Shivam674@gmail.com','New York');

# update a Customers address

update Customers set address = 'Uk' where c_id = 101;

# delete a customer using their CustomerID

delete from Customers where c_id  = 103;

# Display all customers whose name is 'het'

select * from Customer where name = 'het';

# Retrieve all customer details

select * from Customer; 


# Order table

# ----------- Orders ------------

CREATE TABLE Orderss (
	order_id int primary key,
    c_id int,
    order_date date ,
    total_amount decimal (10,2),
    foreign key (c_id) references Customers(c_id)
);


# insert at least 5 sample orders into the Orders table.

insert into Orderss (order_id,c_id,order_date,total_amount) values
(1,101,'2025-01-3',900.50),
(2,102,'2025-02-8',86000),
(3,101,'2025-03-27',90000),
(4,101,'2025-03-17',890000),
(5,102,'2025-05-13',90000);

select * from Orderss;

# Retrieve all orders made by a specific customers

select * from Orders
where C_id = 101;


# update an  orders total amount

update Orders set total_amount = 56000.50
where order_id = 1;

# delete an  order using its OrderID

delete from Orders where  order_id = 2;

# Retrieve orders placed in the last 30 days

select * from Orders where order_date >= curdate() - interval 30 day;

# Retrieve the highest,lowest, and average order amount using aggregate functions

select
	max(total_amount) as Highest_amount,
    min(total_amount) as Lowest_amount,
    avg(total_amount) as Average_amount
from Orders;    


# product table

# ----------- products ------------

CREATE TABLE Product (
	P_id int primary key,
    name varchar(50),
    price decimal (10,2),
    stock int
);    

# insert at least 5 sample products into the products table.

insert into Product (P_id,name,price,stock) values
(101,'Laptop',80000,10),
(102,'Phone',84000,17),
(103,'Smartwatch',3400,3),
(104,'HeadPhone',5600,2),
(105,'AC',67000,45);

select * from Product;

# retrieve all products sorted by price in descending order

select * from Products
order by  price  Desc;

# update the price of a specific product.

update Products set price = 2000 where p_id = 102;

# delete a product if its out of stock

delete from Products where stock = 2;

# retrieve products whose price is between 500 and 2000.

select * from Products
where price between 500 and 2000;

# retrieve the most expensive and cheapest product using max() and min().

select
	max(price) as Most_expensive_price,
    min(price) as Most_expensive_price
from Products;    

# orderdetails table

# ----------- orderdetails ------------

CREATE TABLE Order_details3 (
    od_id INT PRIMARY KEY,
    order_id INT,
    P_id INT,
    quantity INT,
    sub_total INT
);



insert into Order_details3 (od_id, order_id, P_id, quantity, sub_total) values
(1,1,101,1,9000),
(2,1,101,1,4000),
(3,1,102,1,6000),
(4,2,102,1,5600),
(5,3,103,3,34000);

select * from Order_details3;

# Retrieve All Order Details for a Specific Order

SELECT * FROM Order_details3
WHERE order_id = 2;

# Calculate Total Revenue Using SUM()

SELECT SUM(sub_total) AS Total_Revenue
FROM Order_details3;

# Retrieve Top 3 Most Ordered Products

SELECT P_id, SUM(quantity) AS Total_Quantity
FROM Order_details3
GROUP BY P_id
ORDER BY Total_Quantity DESC
LIMIT 3;

# Count How Many Times a Specific Product Sold

SELECT P_id, COUNT(*) AS Times_Sold
FROM Order_details3
WHERE P_id = 2;