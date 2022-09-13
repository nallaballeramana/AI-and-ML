
--create database
create database practice

use practice

--create table 
-- create table table_name(col1 datatype....coln datatype)

create table customer(
customer_id int,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
address varchar(50),
city varchar(20),
state varchar(20),
zip varchar(20)
)


--view data in table
select * from customer

--insert into table
insert into customer
values
(10,'JEMMI','SWQ','JEM@GMAIL.COM','2ND FLOOR','LEH','MYSORE','33222'),
(20,'JEMMI','AVANTHIKA','JEMMI@GMAIL.COM','2ND FLOOR','LEH','KASHMIR','22222'),
(30,'JESSICA','VANYA','VANYA@GMAIL.COM','3RD FLOOR','ALLEPPY','KERALA','33333'),
(40,'JERUSHA','JERU','JERU@GMAIL.COM','4TH FLOOR','OOTY','BANGLORE','44444'),
(50,'GRACE','ZIPPORA','GRACE@GMAIL.COM','5TH FLOOR','SAN JOSE','LA','55555');


--select specific cols
select first_name,last_name from customer

--filter data
select * from customer
where first_name like 'G%'
and city ='san jose'

--create order table
CREATE TABLE ORDERS(ORDER_ID INT,ORDER_DATE INT,AMOUNT INT, CUSTOMER_ID INT);


--insert into orders table
INSERT INTO ORDERS VALUES(100,2020-10-01,9000,20),
						(110,2020-10-01,9000,1),
						(111,2020-10-02,8000,2),
						(112,2020-10-03,7000,3),
						(113,2020-10-04,6000,4),
						(114,2020-10-05,5000,5);

select * from orders;
--- inner join
select * from customer  c
inner join orders o
on c.customer_id = o.CUSTOMER_ID

--right join
select * from customer  c
right join orders o
on c.customer_id = o.CUSTOMER_ID;

--left join
select * from customer  c
left join orders o
on c.customer_id = o.CUSTOMER_ID;

--update table
update ORDERS
set amount = 100
where CUSTOMER_ID=3

select * from ORDERS

---sel min,max and avg of amount from orders table
select min(amount) from ORDERS;

select max(amount) from ORDERS;

select avg(amount) from orders;

select min(amount) as minimum,
       max(amount) as maximum,
	   avg(amount) as average
from orders;

--- create user defined function

-- create function fun_name(@parameter datatype)
--returns datatype as
--begin
--operation
--end

create function multiply_10(@num int)
returns int as
begin
	set @num = @num*10
	return @num
end

--call function
--select dbo.function_name(paramenters) from table

select *, dbo.multiply_10(amount) from orders;

-- case statement

select 100 as val,
case
when 100<200 then '100 is less than 200'
when 100 = 200 then '100 is equal to 200'
else '100 is greater than 200'
end

--arrange in ascending/descending order
--by default order by will give data in ascending order

select * from orders
order by amount desc

CREATE TABLE EMPLOYEE_DETAILS1 (EMP_ID INT, EMP_NAME VARCHAR(50),EMP_SALARY INT);

INSERT INTO EMPLOYEE_DETAILS1 VALUES(1,'FERNA',5000),
								(2,'APPLE',6000),
								(3,'DANNY',7000),
								(4,'JOHN',8000);

--
select * from EMPLOYEE_DETAILS1

--

CREATE TABLE EMPLOYEE_DETAILS2 (EMP_ID INT, EMP_NAME VARCHAR(50),EMP_SALARY INT);

--


INSERT INTO EMPLOYEE_DETAILS2 VALUES(5,'AKASH',50000),
								(6,'VISHWA',60000),
								(7,'CHANDAN',70000),
								(8,'VIKAS',80000);

--
select * from EMPLOYEE_DETAILS2;
--

-- union operator
select * from EMPLOYEE_DETAILS1
union
select * from EMPLOYEE_DETAILS2

--intersect

select * from EMPLOYEE_DETAILS1
intersect
select * from EMPLOYEE_DETAILS2

-- except operator
select * from EMPLOYEE_DETAILS1
except
select * from EMPLOYEE_DETAILS2

insert into EMPLOYEE_DETAILS2 values(4,'JOHN',8000);