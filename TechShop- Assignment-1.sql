/*Task-1*/
create table customers(
customerID varchar(5) primary key,
FirstName varchar(30),
LastName varchar(20),
Email varchar(30),
phone varchar(10),
address varchar(30));

create table Products(
productID int primary key,
productName varchar(30),
Description varchar(30),
price int)

alter table orders alter column totalamount int; 
Create table Orders(orderID int primary key,
customerID varchar(5),
OrderDate date,
TotalAmount int,
Foreign key (customerID) references customers(customerID));

alter table Orders add status varchar(10) 

Create table Orderdetails(
OrderdetailID varchar(5) primary key,
orderID int Foreign key references orders(orderID),
productID int Foreign key references products(productID),
Quantity int);

create table inventory(
inventoryID varchar(5) primary key,
productID int Foreign key references products(productID),
quantityInStock int,
LastStockUpdate date);

INSERT INTO customers VALUES
('C0001', 'Jon', 'Snow', 'jon@got.com', 1234567890, 'Castle Black'),
('C0002', 'Daenerys', 'Targaryen', 'daenerys@got.com', 9876543210, 'Dragonstone'),
('C0003', 'Tyrion', 'Lannister', 'tyrion@got.com', 5551234567, 'Casterly Rock'),
('C0004', 'Arya', 'Stark', 'arya@got.com', 3339876543, 'Winterfell'),
('C0005', 'Sansa', 'Stark', 'sansa@got.com', 7776543210, 'Winterfell'),
('C0006', 'Cersei', 'Lannister', 'cersei@got.com', 8881234567, 'King Landing'),
('C0007', 'Jaime', 'Lannister', 'jaime@got.com', 2224567890, 'Casterly Rock'),
('C0008', 'Bran', 'Stark', 'bran@got.com', 4442345678, 'Winterfell'),
('C0009', 'Jorah', 'Mormont', 'jorah@got.com', 6667890123, 'Bear Island'),
('C0010', 'Samwell', 'Tarly', 'samwell@got.com', 9993456789, 'Horn Hill')

INSERT INTO Products VALUES
(1, 'AC', 'electronic', '45000',1),
(2, 'Laptop', 'electronic', '70000',2),
(3, 'Mobile', 'electronic', '30000',3),
(4, 'Smartwatch', 'electronic', '3000',4),
(5, 'Mobile', 'electronic', '4000',5),
(6, 'Bike', 'vehicle', '123000',6),
(7, 'table', 'furniture', '3000',7),
(8, 'car', 'vehicle', '2000000',8),
(9, 'sofa', 'furniture', '30000',9),
(10, 'chair', 'furniture', '1400',10);
delete from orders
delete from 
INSERT INTO Orders VALUES
(1, 'C0001', '2023-04-05', '500000','shipped'),
(2, 'C0002', '2023-12-06', '600000','inhouse'),
(3, 'C0003', '2024-04-07', '450000','shipped'),
(4, 'C0004', '2022-08-08', '500000','pending'),
(5, 'C0005', '2024-04-09', '700000','pending'),
(6, 'C0006', '2022-04-10', '650000','shipped'),
(7, 'C0007', '2022-04-11', '400000','pending'),
(8, 'C0008', '2021-11-12', '800000','shipped'),
(9, 'C0009', '2024-02-13', '750000','inhouse'),
(10, 'C0010', '2024-04-1', '900000','pending');

INSERT INTO Orderdetails VALUES
('OD01', 1, 1, 2),
('OD02', 2, 2, 1),
('OD03', 3, 3, 3),
('OD04', 4, 4, 1),
('OD05', 5, 5, 2),
('OD06', 6, 6, 2),
('OD07', 7, 7, 1),
('OD08', 8, 8, 3),
('OD09', 9, 9, 2),
('OD10', 10, 10, 4);

INSERT INTO inventory VALUES
('I0001', 1, 100, '2023-04-05'),
('I0002', 2, 50, '2022-03-06'),
('I0003', 3, 75, '2023-12-07'),
('I0004', 4, 25, '2024-04-08'),
('I0005', 5, 80, '2024-04-09'),
('I0006', 6, 60, '2024-04-10'),
('I0007', 7, 30, '2023-04-11'),
('I0008', 8, 90, '2023-11-12'),
('I0009', 9, 40, '2024-01-13'),
('I0010', 10, 20, '2024-01-14');
create table category(
categoryID int primary key,
categoryName varchar(30))

insert into category values
(1,'electronic'),
(2,  'vehicle'),
(3,  'furniture'),

ALTER TABLE Products
ADD CategoryID INT;
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Category
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);

Select * from Customers;
Select * from Products;
Select * from Orders;
Select * from Orderdetails;
select * from Inventory;


/*Task-2*/
/*1*/Select FirstName,LastName,email  from Customers

/*2*/select Orders.orderID,Orders.OrderDate,customers.FirstName,Customers.LastName 
from Orders
join customers on Orders.customerID=customers.customerID

/*3*/INSERT INTO Customers
VALUES ('C0011', 'Eddard', 'Stark', 'nedstark@got.com', '1234567890', 'Winterfell');
 
/*4*/Update Products SET price=price * 1.1 where Description LIKE 'electronic';

/*5*/DECLARE @InputOrderID INT; 
SET @InputOrderID = 1;
delete from Orders where OrderId= @InputOrderID
delete from OrderDetails where OrderId= @InputOrderID

/*6*/INSERT into Orders VALUES
('11','C0001','2024-04-08','400.00')

/*7*/declare @InputEmail varchar(30), @InputCustomerID int
set @InputEmail = 'jon@got.com'
set @InputCustomerID=101
update Customers set Email=@InputEmail where CustomerID=@InputCustomerID
select * from Customers

/*8*/update Orders set TotalAmount =(
Select SUM(od.quantity * p.price)
from Orderdetails od
join Products p ON od.productID=p.productID
where od.orderID=Orders.orderID)

/*9*/declare @InputCustomerID1 int
set @InputCustomerID1=101
delete from Orders where CustomerId= @InputCustomerID1
delete from OrderDetails where CustomerId= @InputCustomerID1

/*10*/insert into Products values(11,'Mouse','electronic',1000)

/*11*/
alter table orders add status varchar(10) 
DECLARE @InputOrderID1 INT; 
SET @InputOrderID1 = 1;
update orders set status='Shipped' where OrderId= @InputOrderID1
select * from orders

/*12*/select customerID , count(*) as totalorders
from orders
group by customerID

/*Task-3*/
/*1*/
select o.OrderID,o.OrderDate,c.Firstname,c.LastName
from Orders o
INNER JOIN Customers c on o.CustomerID=c.CustomerID

/*2*/
select p.productname,sum(od.quantity*p.price) as totalrevenue
from orderdetails od
join products p on od.productid = p.productid
group by p.productid, p.productname

/*3*/
select c.firstname,c.phone 
from Customers c
join orders o on o.customerid=c.CustomerID
group by c.FirstName, c.Phone

/*4*/
select top 1 p.productname,sum(od.quantity) as totalquantity
from orderdetails od
join products p on od.productid = p.productid
group by p.productname
order by totalquantity desc

/*5*/
select p.productname,c.categoryName  from Products p
join category c on c.categoryID=p.CategoryID


/*6*/
select c.firstname,avg(o.totalamount) as averageordervalue
from customers c
join orders o on c.customerid = o.customerid
group by c.firstname

/*7*/
select top 1 o.orderid,c.firstname,c.lastname,o.totalamount
from orders o
join customers c on o.customerid = c.customerid
order by o.totalamount desc

/*8*/
select p.productname,count(od.productid) from Products p
join OrderDetails od on od.ProductID=p.ProductID
group by p.productname

/*9*/
declare @InputProname varchar(20)
set @InputProname='Mobile'
select c.firstname from Customers c
join orders o on o.customerID=c.CustomerID
join OrderDetails od on od.OrderID=o.orderID
join Products p on p.ProductID=od.ProductID
where ProductName=@InputProname

/*10*/
declare @InputStartdate date, @InputEnddate date
set @InputStartdate='2024-04-01'
set @InputEnddate='2024-04-05'
select sum(o.totalamount) as totalrevenue
from orders o
where o.orderdate between @InputStartdate and @InputEnddate

/*Task-4*/

/*1*/
select * from customers
where customerid not in(
select customerid from orders);

/*2*/
select count(productid) as available_products
from inventory
where quantityinstock > 0;

/*3*/
select sum(totalamount) as total_amount from orders;

/*4*/
DECLARE @Inputcategoryname VARCHAR(10);
SET @Inputcategoryname = 'electronics';
DECLARE @CategoryId INT;

SELECT @CategoryId = c.categoryid
FROM category c 
WHERE c.categoryname = @Inputcategoryname;

SELECT AVG(od.quantity) AS averagequantity 
FROM orderdetails od
INNER JOIN products p ON od.productid = p.productid
WHERE p.categoryid = @CategoryId;

/*5*/
DECLARE @InputcustomerID1 VARCHAR(10);
SET @InputcustomerID1 = '104';

SELECT SUM(o.TotalAmount) AS TotalAmount
FROM Orders o
WHERE CONVERT(INT, o.CustomerID) = @InputcustomerID1;

/*6*/
select top 1 c.FirstName,o.totalOrders from Customers c
join (select CustomerID,count(OrderID) as totalOrders from Orders group by CustomerID) o
on o.customerid=c.CustomerID
order by totalOrders desc

/*7*/
select top 1 categoryname, totalquantity
from(select c.categoryname,sum(od.quantity) as totalquantity
from orderdetails od
join products p on od.productid = p.productid
join category c on p.categoryid = c.categoryid
group by c.categoryname) as categorytotals
order by totalquantity desc;

/*8*/
select top 1 c.firstname, maximum.totalspent
from customers c
join(select CustomerID, sum(totalamount) as totalspent from orders
group by customerid)maximum on c.customerid = maximum.customerid
order by maximum.totalspent desc

/*9*/
select c.firstname, all_orders.avg_order
from customers c
join(select customerid, sum(totalamount)/count(orderid) as avg_order
from orders
group by customerid) all_orders on c.customerid = all_orders.customerid;

/*10*/
select c.FirstName,o.totalOrders from Customers c
join (select CustomerID,count(OrderID) as totalOrders from Orders group by CustomerID) o
on o.customerid=c.CustomerID
