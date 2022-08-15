--Scenario Based Assignments 

--1) 
create table books(
id int primary key,
title char(100),
author varchar(30),
isbn bigint unique,
published_date smalldatetime 
)

select * from books

insert into books values(1,'My First SQL book','Mary Parker',981483029127,'2012-02-22 12:08:17'),
						(2,'My Second SQL book','John Mayer',857300923713,'1972-07-03 09:22:45'),
						(3,'My Third SQL book','Cary Flint',523120967812,'2015-10-18 14:05:44')

select * from books where author like ('%er')
------------------------------------------------------------------------

--2) 
create table reviews(
id int primary key ,
book_id int foreign key references books (id),
reviewer_name varchar(40),
content char(100),
rating int,
published_date smalldatetime 
)
select * from reviews 

insert into reviews values (1,1,'John Smith','My First review',4,'2017-12-10 05:50:11'),
							(2,2,'John Smith','My Second review',5,'2017-10-13 15:05:12'),
							(3,2,'Alice Walker','Another review',1,'2017-10-22 23:47:10')

select t1.title , t1.author , t2.reviewer_name from books t1 , reviews t2 where t1.id = t2.book_id
--------------------------------------------------------------------------------------------------------

--3) 
select reviewer_name as 'reviewer reviewed more than one book' from reviews group by reviewer_name having count(distinct book_id) > 1

-------------------------------------------------------------------------------------------------------------

--4) 
create table customer(
Cid int primary key,
Cname varchar(30),
age int,
Caddress varchar(30),
salary int 
)
select * from customer

insert into customer values (1,'Ramesh', 32 , 'Ahmedabad' , 2000),(2,'Khilan', 25 , 'Delhi' , 1500),
							(3,'Kaushik', 23 , 'Kota' , 2000),(4,'Chaitali', 25 , 'Mumbai' , 6500),
							(5,'Hardik', 27 , 'Bhopal' , 8500),(6,'Komal', 22 , 'MP' , 5500),
							(7,'Muffy', 24 , 'Indore' , 10000)

select Cname from customer where Caddress like('%o%')

------------------------------------------------------------------------------------------------------------------

--5) 
create table orders(
OID int primary key,
OrderDate smalldatetime,
Customer_ID int foreign key references customer(Cid),
amount int
)
select * from orders

insert into orders values (102, '2009-10-08 00:00:00', 3 , 3000),(100, '2009-10-08 00:00:00', 3 , 1500),
						  (101, '2009-11-20 00:00:00', 2 , 1560),(103, '2008-05-20 00:00:00', 4 , 2060)

select orderdate , count(Customer_ID) as 'order placed' from orders group by orderdate
------------------------------------------------------------------------------------------------------------------

--6)
create table Employee(
EID int primary key,
Ename varchar(30),
age int , 
EAddress varchar(30),
Salary int
)
select * from Employee

insert into Employee values (1,'Ramesh', 32 , 'Ahmedabad' , 2000),(2,'Khilan', 25 , 'Delhi' , 1500),
							(3,'Kaushik', 23 , 'Kota' , 2000),(4,'Chaitali', 25 , 'Mumbai' , 6500),
							(5,'Hardik', 27 , 'Bhopal' , 8500),(6,'Komal', 22 , 'MP' , null),
							(7,'Muffy', 24 , 'Indore' , null)

select lower(Ename) as 'Null salary' from Employee where salary is null 
---------------------------------------------------------------------------------------------------------------

--7)
 create table studentdetails(
 RegisterNo int primary key,
 Sname varchar(30),
 age int,
 Qualification varchar(30),
 MobileNo bigint,
 mail_id varchar(30),
 location varchar(30),
 Gender char(1)
 )

 select * from studentdetails

 insert into studentdetails values(2 , 'sai',22 ,'B.E',9952836777 , 'Sai@gmail.com' ,'Chennai', 'M'),
								  (3 , 'Kumar',20 ,'BCS',7890125648 , 'Kumar@gmail.com' ,'Madurai', 'M'),
								  (4 , 'Selvi',22 ,'B.Tech',8904567342 , 'Selvi@gmail.com' ,'Selam', 'F'),
								  (5 , 'Nisha',25 ,'M.E',7834672310 , 'Nisha@gmail.com' ,'Theni', 'F'),
								  (6 , 'SaiSaran',21 ,'B.A',7890345678 , 'SaiSaran@gmail.com' ,'Madurai', 'F'),
								  (7 , 'Tom',23 ,'BCA',89012345675 , 'Tom@gmail.com' ,'Pune', 'M')

select Gender , Count(Gender) as 'total male & female' from studentdetails group by Gender
------------------------------------------------------------------------------------------------------------------

--8)
create table coursedetails(
Cid varchar(20) primary key,
Cname varchar(30),
start_date date,
end_date date,
fees int
)
drop table coursedetails
select * from coursedetails

insert into coursedetails values ('DN003','DotNet','2018-02-01','2018-02-28',15000),('DV004','Date visualization','2018-03-01','2018-04-15',15000),
								 ('JA002','Advanced Java','2018-01-02','2018-01-20',10000),('JC001','CoreJava','2018-01-02','2018-01-12',15000)

create table CourseRegistration(
RegistrationNo int ,
C_ID varchar(20) foreign key references coursedetails(Cid),
Batch varchar(10)
)
select * from CourseRegistration

insert into CourseRegistration values(2,'DN003', 'FN'),(3,'DV004', 'AN'),(4,'JA002', 'FN'),(2,'JA002', 'AN'),(5,'JC001', 'FN')

select count(RegistrationNo) from  CourseRegistration

select t1.Cname , count(t2.RegistrationNo) as 'Total registration' 
from coursedetails t1 left join CourseRegistration t2 on t1.Cid = t2.C_ID
where Start_date between '2018-01-02' and '2018-02-28'  group by t1.Cname --order by t2.C_ID desc

------------------------------------------------------------------------------------------------------------------------------------------------

--9)
create table Customers
(
CustID int primary key,
FirstName varchar(30),
LastName varchar(30),
)
drop table Customers
select * from Customers 
insert into Customers values (1,'George','Washington'), (2,'John','Adams'), (3,'Thomas','Jefferson'), (4,'James','Madison'), (5,'James','Monroe')

create table order2(
order_id int primary key,
order_date date,
amount float,
customer_id int foreign key references Customers(CustID),
)
drop table order2
select * from order2
insert into order2 values (1,'1776-04-04',234.56,1), (2,'1760-03-14',78.50,3),(3,'1784-05-23',124.00,2),
					       (4,'1790-09-03',65.50,3),(5,'1795-07-21',25.50,4),(6,'1787-11-27',14.40,5)

select t1.FirstName , t1.LastName from Customers t1 join order2 t2 on t1.CustID = t2.customer_id 
group by t1.FirstName , t1.LastName having count(t2.customer_id) = 2
-------------------------------------------------------------------------------------------------------------------------------------------

--10)

select * from studentdetails

select Reverse(Sname) as RevserseName,UPPER(location) as Locatiion from studentdetails
--------------------------------------------------------------------------------------------------------------------------------------------

--11)
create table orderr(
ID int primary key,
OrderDate date,
OrderNumber int,
CustomerID int,
totalamount int,
)
create table orderitem(
ID int primary key,
OrderID int ,
ProductID int,
UnitPrice int ,
Quantity int
)
create table Product(
ID int primary key,
ProductName varchar(30),
SupplierID int,
Package varchar(30),
isDiscontinued varchar(5)
)

create view Orderview as select ProductName ,Quantity,Ordernumber from
orderr O, orderitem I , Product P where O.ID = I.ID and O.ID = P.ID
select *from Orderview


----------------------------------------------------------------------------------------------------------------------------------------------

--12) 
select * from studentdetails
select * from CourseRegistration
select * from coursedetails

select T1.Cname from studentdetails T2 join CourseRegistration T3 on T2.RegisterNo=T3.RegistrationNo 
join coursedetails T1 on T1.Cid = T3.C_ID where T2.Sname = 'Nisha'

---------------------------------------------------------------------------------------------------------------------------------------------
