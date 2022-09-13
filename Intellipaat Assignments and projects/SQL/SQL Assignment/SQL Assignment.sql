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

---1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.

select First_name as Employee_name from Employee;

---2 Display “LAST_NAME” from Employee table in upper case.

select upper(Last_name) from Employee;

---3 Display unique values of DEPARTMENT from EMPLOYEE table.

select distinct Department from Employee;

---4 Display the first three characters of LAST_NAME from EMPLOYEE table.
select SUBSTRING(Last_name,1,3)
from Employee;

---5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

select distinct Department,len(Department) from Employee;

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.a space char should separate them.

select First_name + ' ' + Last_name as Full_Name
from Employee;

--- 7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.

select * from Employee
order by First_name asc;

---8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Employee
order by First_name asc , Department desc;

---9 Display details for EMPLOYEE with the first name as “VEENA” and  “KARAN” from EMPLOYEE table.
select * from Employee
where First_name in ('Veena' ,'Karan');

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
select * from Employee where Department = 'Admin';

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.

select * from Employee
where First_name like '%v%';

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.

select * from Employee where Salary between 100000 and 500000;

--13 Display details of the employees who have joined in Feb-2020.

select * from Employee where Joining_date like '2020-02-%';

--14 Display employee names with salaries >= 50000 and <= 100000.

select First_name,Last_name from Employee
where Salary>= 50000
and Salary <= 100000
;

--16 DISPLAY details of the EMPLOYEES who are also Managers

select * from Employee emp
inner join Employee_Title tit
on emp.Employee_id = tit.Employee_ref_id
where tit.Employee_title = 'Manager';

--17 DISPLAY duplicate records having matching data in some fields of a  table.

select Employee_id,First_name,Last_name,Salary,Joining_date,Department,count(*) as count from Employee
group by Employee_id,First_name,Last_name,Salary,Joining_date,Department;

select Employee_title,count(*) as count from Employee_title
group by Employee_title;

--18 Display only odd rows from a table. 

select * from 
(
select ROW_NUMBER() OVER(order by First_name) as row_num, * from Employee) a
where (a.row_num%2) = 1;

--19 Clone a new table from EMPLOYEE table

select * into Employee_clone from Employee ;

select * from Employee_clone;

--20 DISPLAY the TOP 2 highest salary from a table.

select top 2 * from Employee
order by Salary desc

--21. DISPLAY the list of employees with the same salary.

select emp1.First_name, emp1.Last_name, emp1.Salary from Employee emp1
inner join Employee emp2
on emp1.Salary = emp2.Salary
and emp1.First_name <> emp2.First_name;


--22 Display the second highest salary from a table.

select top 1 Salary from 
(select top 2 Salary from Employee order by Salary desc) a
order by Salary ;


--23 Display the first 50% records from a table.

select top 50 percent * from Employee;

--24. Display the departments that have less than 4 people in it.

select Department from
(select Department,count(*) as dep_count from Employee
group by Department ) a
where a.dep_count < 4


--25. Display all departments along with the number of people in there.

select Department,count(*) as emp_count from Employee
group by Department

--26 Display the name of employees having the highest salary in each department.


select emp.First_name, emp.Last_name, Salary, emp.Department from Employee emp
inner join
(select Department, max(Salary) as max_salary
from Employee
group by  Department )A
on emp.Department = A.Department
where emp.Salary = A.max_salary

--27 Display the names of employees who earn the highest salary.

select First_name,Last_name,Salary from Employee
where Salary = (Select max(Salary) as Salary from Employee)

--28 Diplay the average salaries for each department

select Department, AVG(Salary) as average_salary from Employee
group by Department

--29 display the name of the employee who has got maximum bonus

select First_name, Last_name , Bonus_Amount from Employee EMP
inner join Employee_Bonus EB
on EMP.Employee_id = EB.Employee_ref_id
where EB.Bonus_Amount = (select max(Bonus_Amount) from Employee_Bonus)

--30 Display the first name and title of all the employees

select First_name, Employee_title from Employee emp
inner join Employee_Title tit
on emp.Employee_id = tit.Employee_ref_id





