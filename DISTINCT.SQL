------------Dual-------------------------

SELECT 'welcome to sql' FROM dual;

SELECT SYSDATE FROM DUAL;

SELECT UPPER('oracle sql') FROM dual;

SELECT emp_seq.NEXTVAL FROM dual;

SELECT CASE
         WHEN 10 > 5 THEN 'YES'
         ELSE 'NO'
       END
FROM dual;

SELECT 10+20 FROM DUAL;

----------------Tab------------------

SELECT * FROM tab;

CREATE TABLE books(
       name_book varchar2(50),
       release_date date
);

Insert into books values('harry potter', to_date('04/11/1988' ,'dd-mm-yyyy'));
select * from books;

SELECT table_name
FROM user_tables;

-----------DISTINCT----------------
--DISTINCT is used in a SELECT statement to eliminate duplicate rows from the result set.
--It ensures that the output contains only unique values.

CREATE TABLE customers(
       cust_name varchar2(50),
       customer_id number,
       product varchar2(20)
       
);
Insert into customers values('dhana', 1001, 'Bottle');
Insert into customers values('Prem', 1002, 'Bottle');
Insert into customers values('Deepa', 1003, 'Bottle');
Insert into customers values('Rahul', 1004, 'Bottle');
Insert into customers values('Hinata', 1005, 'Bottle');
Insert into customers values('Naruto', 1006, 'Bottle');
Insert into customers values('Boruto', 1007, 'Bottle');
Insert into customers values('dhana', 1001, 'Bottle');
Insert into customers values('raj', Null, 'Bottle');    --null is also the unique value and it is not removed

SELECT * FROM customers;

SELECT distinct customer_id from customers
order by customer_id;

--DISTINCT eliminates duplicate rows from the result set and is commonly used in reporting 
--to fetch unique business entities.

CREATE TABLE employee_records (
    emp_id        NUMBER,
    emp_name      VARCHAR2(30),
    department    VARCHAR2(20),
    job_role      VARCHAR2(30),
    salary        NUMBER(10,2),
    location      VARCHAR2(20)
);

INSERT INTO employee_records values(1, 'Karan', 'IT', 'Developer', 50000, 'thailand');
INSERT INTO employee_records values(2, 'prem', 'marketing', 'Developer', 50000, 'pune');
INSERT INTO employee_records values(3, 'jyoti', 'HR', 'sales', 60000, 'bangole');
INSERT INTO employee_records values(4, 'payal', 'IT', 'Developer', 50000, 'karachi');
INSERT INTO employee_records values(5, 'iyarn', 'marketing', 'Developer', 80000, 'madras');
INSERT INTO employee_records values(1, 'Karan', 'IT', 'Developer', 50000, 'pune');
INSERT INTO employee_records values(5, 'iyarn', 'IT', 'Developer', 90000, 'mumbai');
INSERT INTO employee_records values(4, 'payal', 'HR', 'production', 40000, 'thailand');
INSERT INTO employee_records values(9, 'prem', 'Foreign', 'Developer', 50000, 'kerla');
INSERT INTO employee_records values(8, 'raj', 'IT', 'Developer', 50000, 'chennai');
INSERT INTO employee_records values(8, 'raj', 'IT', 'Developer', 50000, 'chennai');
INSERT INTO employee_records values(8, 'raj', 'IT', 'Developer', 50000, null);
INSERT INTO employee_records values(8, 'raj', 'IT', 'Developer', 50000, null);

drop table employee_records;

select * from employee_records;

--1) Display the unique departments in the company.
SELECT DISTINCT department from employee_records;

--2)Display the unique job roles available.
SELECT DISTINCT job_role from employee_records;

--3)Display the unique locations where employees work.
SELECT DISTINCT location from employee_records;

--4)Display unique combinations of department and job_role.
SELECT DISTINCT department,job_role from employee_records;

--5)Display the list of departments that have employees earning more than 50,000.
SELECT DISTINCT salary from employee_records
where salary>=50000;

--6)Display unique job roles for employees working in the HR department.
SELECT DISTINCT job_role from employee_records
where department='HR';

--7)Display unique employee locations, excluding NULL values.
SELECT DISTINCT location from employee_records
where location is not null;

--8)A report is showing duplicate departments because of multiple employees.
--Write a query to ensure only unique department names appear in the output.
SELECT DISTINCT department from employee_records;


