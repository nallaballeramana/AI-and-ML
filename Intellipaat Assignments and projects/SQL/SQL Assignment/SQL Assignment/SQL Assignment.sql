create database Assignment;

use Assignment;

create table Employee(
Employee_id int not null primary key,
First_name varchar(20) not null,
Last_name varchar(20) not null,
Salary int not null,
Joining_date date not null,
Department varchar(20) not null

);

insert into Employee values
(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
(2,'Veena','Varma',80000,'2011-06-15 9:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR'),
(4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin'),
(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
(8,'Chandrika','Chauhan',900000,'2011-04-15 9:00:00','Admin');

select * from Employee;

create table Employee_Bonus (
Employee_ref_id int not null foreign key references Employee(Employee_id),
Bonus_Amount int,
Bonus_Date date
);

insert into Employee_Bonus values
(1,5000,'2020-02-16 0:00:00'),
(2,3000,'2011-06-16 0:00:00'),
(3,4000,'2020-02-16 0:00:00'),
(1,4500,'2020-02-16 0:00:00'),
(2,3500,'2011-06-16 0:00:00')
;

select * from Employee_Bonus;

create table Employee_Title
(
Employee_ref_id int not null foreign key references Employee(Employee_id),
Employee_title varchar(20) not null,
Affective_date date
);

insert into Employee_Title values
(1,'Manager', '2016-02-20 0:00:00'),
(2,'Executive', '2016-06-11 0:00:00'),
(8,'Executive', '2016-06-11 0:00:00'),
(5,'Managr', '2016-06-11 0:00:00'),
(4,'Asst. Manager', '2016-06-11 0:00:00'),
(7,'Executive', '2016-06-11 0:00:00'),
(6,'Lead', '2016-06-11 0:00:00'),
(3,'Lead', '2016-06-11 0:00:00')
;

select * from Employee_Title;

---1 Display the �FIRST_NAME� from Employee table using the alias name as Employee_name.

select First_name as Employee_name from Employee;

---2 Display �LAST_NAME� from Employee table in upper case.

select upper(Last_name) from Employee;

---3 Display unique values of DEPARTMENT from EMPLOYEE table.

select distinct Department from Employee;

---4 Display the first three characters of LAST_NAME from EMPLOYEE table.
select SUBSTRING(Last_name,1,3)
from Employee;

---5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

select distinct Department,len(Department) from Employee;

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.a space char should separate them.