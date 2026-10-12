----------------------SQL--------------------------------------------------------------

--- DDL - create, alter, drop, truncate, rename
--- DML - insert, update, merge, delete
--- DRL - select
--- DCL/TCL - commit, rollback, savepoint

--------DDL----------------

---CREATE ----
create table student
(stuid NUMBER,
 FNAME VARCHAR(20),
 LNAME VARCHAR(20),
 CITY VARCHAR(10)
);

---DROP----
drop table student;

---INSERT---
insert into student VALUES (1001,'ANKIT','PATIL', 'PUNE');
insert into student VALUES (1002,'SNEHAL','NAYAGAVE','NANDED');
insert into student VALUES (1003,'komal','patil','mumbai');

---TRUNCATE--- -
---(if multiple duplicate rows will be shown in the table then we use truncate attribute to delete all data from the table)---
--(delete all data from table)
truncate table student;

--ALTER-- (to change the table structure)
ALTER TABLE student
ADD contact_no number;

--to add multiple column--
ALTER TABLE student
ADD (DOB DATE,
    email VARCHAR(20));

---UPDATE--
set contact_no = 9087564312

---DELETE---(delete all data from table)
delete from student;

--ROLLBACK--- (to get deleted data)

--constraints--(Constraints in SQL are rules applied to table columns to ensure data accuracy and integrity.
--They restrict the type of data that can be stored in a column.
-- PRIMARY KEY  (no duplicate values, onlu unique values, no null values)
-- FOREIGN KEY
-- NOT NULL 
-- UNIQUE (no duplicate values)
-- CHECK ( to give limit the value range)
-- DEFAULT

DROP TABLE student;

---primary key constraints--- (combination of not null and unique)
create table student
(stuid NUMBER primary key,
 FNAME VARCHAR(20),
 LNAME VARCHAR(20),
 CITY VARCHAR(10)
);

insert into student VALUES (1001,'ANKIT','PATIL', 'PUNE');
insert into student VALUES (1002,'SNEHAL','NAYAGAVE','NANDED');
insert into student VALUES (1003,'KOMAL','PATIL','MUMBAI');

select * from student;

---unique constraints---
create table emp
(
       empid number unique,
       first_name varchar2(100),
       last_name varchar2(100),
       city      varchar2(50),
       salary    number
 );
 
 insert into emp VALUES (1001,'ANKIT','PATIL', 'PUNE',10000);
insert into emp VALUES (1002,'SNEHAL','NAYAGAVE','NANDED',20000);
insert into emp VALUES (1003,'KOMAL','PATIL','MUMBAI',30000);

ALTER TABLE emp
modify salary not null; --where we use not null we can add actual value in it

 select * from emp;

---check comstraints---
CREATE TABLE Persons (
    ID NUMBER NOT NULL,
    LastName VARCHAR2(255) NOT NULL,
    FirstName VARCHAR2(255),
    Age NUMBER,
    CONSTRAINT chk_age CHECK (Age >= 18)
);

------------foreign key---
--Linking two tables by creating a relationship between them
--Maintaining referential integrity (prevents invalid data)
--❌ Avoiding orphan records in the child table
--✔️ Ensuring data consistency across tables
--Controlling actions on UPDATE or DELETE (CASCADE, SET NULL, RESTRICT)

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

--------------------------------------------------------------------------------------------------------------
SELECT * FROM stud_info;

SELECT * FROM seal;

insert into stud_info values(1001,'snehal','nayagave','pune')

insert into seal values (1001,,56,89,78,45);

select sysdate from dual;
----------------------------------------------------------------

create table employee_details(
employee_id number,
employee_name varchar2(50),
joining_date date
);

INSERT INTO employee_details (employee_id, employee_name, joining_date)
VALUES (1001, 'Sneha Nayagave', TO_DATE('07/12/2025', 'DD/MM/YYYY'));

SELECT * FROM employee_details;

---------------------DATE FORMAT--------------------------
'DD/MM/YYYY'
'YY-MM-DD'
'DD-MON-YYYY'

INSERT INTO employee_details (employee_id, employee_name, joining_date)
VALUES(1002,'ANKITA',sysdate);

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MON/YYYY';

----------------------WHERE---------------------------------------------

SELECT * FROM hr.employees
where department_id = 90;

SELECT employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id = 90;

--ROWID()--ROWID is a pseudo column that uniquely identifies the physical location of a row in a table.

SELECT ROWID,employee_id,first_name,salary,HIRE_DATE FROM hr.employees
where department_id = 60;

-------------------------OPERATORS-------------------------------------

SELECT * FROM hr.employees
where department_id <> 50;  --not eual to <>

----Q. EXTRACT THOSE EMPLOYEE DETAILS HAVING SALARY GREATER THAN 20000
SELECT * FROM hr.employees
where salary > 10000;

SELECT * FROM hr.employees
where department_id in (10,60,80);

select * from hr.employees
where department_id = 50
and salary > 5000;

select * from hr.employees
where department_id = 50
or salary > 5000;

--BETWEEN--
SELECT * FROM hr.employees
WHERE hire_date BETWEEN DATE '2005-02-01' AND DATE '2006-11-30';

