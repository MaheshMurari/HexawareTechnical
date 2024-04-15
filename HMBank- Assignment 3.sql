/*Task-1*/
create table Customers(
customer_id int primary key,
first_name varchar(20),
last_name varchar(20),
DOB date,
email varchar(30),
phone_number varchar(30),
address varchar(50))

create table Accounts(
account_id int primary key,
customer_id int,
account_type varchar(20),
balance int,
foreign key (customer_id) references Customers(customer_id))

create table Transactions(
transaction_id int primary key,
account_id int,
transaction_type varchar(20),
amount int,
transaction_date date,
foreign key (account_id) references Accounts(account_id))

/*Task-2*/
INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) VALUES
(1, 'Ramesh', 'Kumar', '1990-03-15', 'ramesh@hmb.com', '9876543210', 'Delhi'),
(2, 'Suresh', 'Singh', '1985-07-25', 'suresh@hmb.com', '8765432109', 'Mumbai'),
(3, 'Deepak', 'Sharma', '1988-11-10', 'deepak@hmb.com', '7654321098', 'Bangalore'),
(4, 'Preeti', 'Patel', '1992-04-05', 'preeti@hmb.com', '6543210987', 'Kolkata'),
(5, 'Priya', 'Yadav', '1997-09-20', 'priya@hmb.com', '5432109876', 'Delhi'),
(6, 'Amit', 'Gupta', '1995-01-30', 'amit@hmb.com', '4321098765', 'Mumbai'),
(7, 'Neha', 'Verma', '1993-06-12', 'neha@hmb.com', '3210987654', 'Bangalore'),
(8, 'Anjali', 'Dube', '2002-08-18', 'anjali@hmb.com', '2109876543', 'Kolkata'),
(9, 'Rajesh', 'Mishra', '2003-12-22', 'rajesh@hmb.com', '1098765432', 'Delhi'),
(10, 'Sunita', 'Kumari', '2000-05-17', 'sunita@hmb.com', '0987654321', 'Mumbai');

INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(101, 1, 'savings', 50000),
(102, 2, 'current', 100000),
(103, 3, 'savings', 75000),
(104, 4, 'current', 60000),
(105, 5, 'savings', 90000),
(106, 6, 'current', 120000),
(107, 7, 'savings', 55000),
(108, 8, 'current', 95000),
(109, 9, 'savings', 80000),
(110, 10, 'current', 110000);

INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) VALUES
(1001, 101, 'deposit', 10000, '2024-04-01'),
(1002, 102, 'withdrawal', 5000, '2024-04-02'),
(1003, 103, 'deposit', 15000, '2024-04-03'),
(1004, 104, 'withdrawal', 10000, '2024-04-04'),
(1005, 105, 'deposit', 20000, '2024-04-04'),
(1006, 106, 'withdrawal', 8000, '2024-04-04'),
(1007, 107, 'deposit', 12000, '2024-04-07'),
(1008, 108, 'withdrawal', 3000, '2024-04-03'),
(1009, 109, 'deposit', 18000, '2024-04-09'),
(1010, 110, 'withdrawal', 7000, '2024-04-1');


/*Task-2*/
/*1*/
select c.first_name,c.last_name,a.account_type,c.email 
from Customers c 
join Accounts a on c.Customer_id=a.Customer_id

/*2*/
select c.first_name,c.last_name,t.transaction_type,t.amount,t.transaction_date
from Customers c 
join Accounts a on c.Customer_id=a.Customer_id
join Transactions t on a.account_id=t.account_id

/*3*/
update Accounts 
set balance = balance+50000
where account_id=106

select *from Accounts

/*4*/
select concat(first_name,' ',last_name)as full_name from Customers

/*5*/
delete from accounts where balance=0 and account_type='savings'

/*6*/
select* from Customers where address='kolkata'

/*7*/
select balance from Accounts where account_id=103

/*8*/
select * from Accounts where account_type='current' and balance > 1000

/*9*/
select *from Transactions where account_id=103

/*10*/
select account_id,balance*0.9 as interest from accounts where account_type='savings'

/*11*/
select *from accounts where balance < 10000

/*12*/
select *from Customers where address!='bangalore'

/*Task-3*/
/*1*/
select avg(balance) as avg_balance from Accounts;
        
/*2*/
select top 10 * from Accounts
order by balance desc

/*3*/
select sum(amount)as total_deposits from Transactions 
where transaction_type='deposit' and transaction_date = '2024-04-01'

/*4*/
select min(DOB) as old_customer,max(DOB) as newcustomer from Customers

/*5*/
select t.*,a.account_type from Transactions t 
join Accounts a on t.account_id=a.account_id

/*6*/
select c.*,account_type,balance  from Customers c 
join Accounts a on c.Customer_id=a.Customer_id

/*7*/
select t.*,c.first_name,c.last_name,c.email from Transactions t
join Accounts a on t.account_id=a.account_id 
join Customers c on a.customer_id=c.customer_id
where a.account_id=104

/*8*/
select a.customer_id,c.first_name from accounts a
join Customers c on c.customer_id=a.customer_id
group by a.customer_id,c.first_name
having count(*)>1

/*9*/
select
sum(case when transaction_type = 'deposit' then amount else 0 end) -
sum(case when transaction_type = 'withdrawal' then amount else 0 end) as difference
from Transactions

/*10*/
select account_id, avg(balance) as avg_daily_bal
from Accounts
group by account_id;

/*11*/
select account_type, sum(balance) AS tot_bal
from Accounts
group by account_type;

/*12*/
select account_id, count(*) as tran_count
from Transactions
group by account_id
order by tran_count desc;

/*13*/
select c.customer_id,c.first_name,sum(a.balance) as Agg_balance,a.account_type
from Customers c
join Accounts a on a.customer_id=c.customer_id
group by c.customer_id,c.first_name,a.account_type

/*14*/
select account_id, transaction_type, amount, transaction_date, count(*) as count
from Transactions 
group by account_id, transaction_type, amount, transaction_date
having count(*) > 1
order by account_id, transaction_date

/*Task-4*/
/*1*/
select c.customer_id,c.first_name
from customers c
join Accounts a on a.customer_id=c.customer_id
where a.balance=(select max(balance) from Accounts)

/*2*/
select customer_id,avg(tot_bal) as avg_bal
from(select customer_id,sum(balance) as tot_bal
from Accounts
group by customer_id
having COUNT(account_id)>1) as acc_bal
group by customer_id

/*3*/
select a.account_id, a.customer_id, a.balance
from accounts a
where exists (select 1 from transactions t
where t.account_id=a.account_id and 
t.amount>(select avg(amount) from transactions))

/*4*/
select c.customer_id, c.first_name
from customers c
where not exists (select 1 from transactions t
join accounts a on t.account_id=a.account_id
where a.customer_id=c.customer_id)

/*5*/
select sum(balance) as tot_bal
from accounts a
where not exists (select 1 from transactions t
where t.account_id=a.account_id)

/*6*/
select t.transaction_id, t.account_id, t.transaction_type, t.amount, t.transaction_date
from transactions t
join accounts a on t.account_id=a.account_id
where a.balance=(select min(balance) from accounts);

/*7*/
select c.customer_id, c.first_name
from customers c
join accounts a on c.customer_id=a.customer_id
group by c.customer_id,c.first_name
having count(a.account_type) > 1;

/*8*/
select account_type, count(*)*100.0/(select count(*) from accounts) as percentage
from accounts
group by account_type;

/*9*/
Declare @InputCustomer_id int
set @InputCustomer_id=6
select t.transaction_id, t.account_id, t.transaction_type, t.amount, t.transaction_date
from transactions t
where t.account_id in(
select a.account_id from Accounts a
where a.customer_id=@InputCustomer_id)

/*10*/
select account_type, (select sum(balance) from Accounts a1 
where a1.account_type=a.account_type) as tot_bal
from Accounts a
group by account_type