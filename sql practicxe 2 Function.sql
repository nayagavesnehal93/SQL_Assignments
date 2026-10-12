-----FUNCTIONS-----
--Functions helps us to manipulate data more effeciently

--string function
--Data function
--Numeric Function
--Aggregate Function
--Analytical Function

-----------------------STRING FUNCTION--------------------------

--ASCII () :- Return a ASCII code for character

SELECT ASCII('s') FROM DUAL;

SELECT first_name,ASCII(first_name) from hr.employees;

SELECT CHR(65) FROM DUAL; -- we provide ascii value to char it define character

--CONCAT():- CONCATNATE FUNCTION IS USED TO COMBINE 2 STRING ('||')
select concat('A','BC') FROM DUAL;

SELECT first_name,last_name,concat(first_name,last_name) from hr.employees;

--INITCAP():-convert the first character of each word in the string it will convert into UPPERCASE

SELECT INITCAP('abc') from DUAL;

SELECT * FROM hr.employees;

select employee_id,first_name,email,initcap(email)
from hr.employees;

---UPPER()---
select employee_id,upper(first_name) as first_name,last_name
from hr.employees;

--lower()--
select employee_id,first_name,lower(first_name),last_name
from hr.employees;

--length()--
select length('abc') from dual;

select employee_id,first_name,length(first_name),last_name
from hr.employees;

--INSTR() :- Search for a substring and return the location of the sub string in a gives string
-- POSITION OF SUBSTRING (character)
-- SYNTAX :- INSTR(string1(shodhav lagte ), string2(shodhaychy), Starting position(Number), occurance
SELECT INSTR('This is a playlist','is',1,2) from dual;

SELECT INSTR('This is a playlist','is',1,3) from dual;

SELECT INSTR('This is a playlist','is',-1)
from dual;

--SUBSTR() :- extract substring from string
-- BY USING POSITION WE CAN FIND SUBSTRING
SELECT SUBSTR ('oracle substring', 1,6) from dual;

--LPAD() :- used for security purpose
--adds characters to the left side of a string.
SELECT LPAD('ABC',5, '*') from dual;

SELECT employee_id, first_name, lpad(first_name,10,'*') from hr.employees;

--RPAD() :- 
--adds characters to the right side of a string.
SELECT employee_id,first_name,rpad(first_name,10,'*') from hr.employees;

--LTRIM() left side space will removed
--RTRIM()  Right side space will removed
-- TRIM() both side spaces will remove
select ltrim('ABC') from dual;

-- REPLACE():- character to character replace
select replace ('This is a test','is','IS') from dual;

--TRANSLATE - whole string at a time replace
--Each character in from_string is replaced by the corresponding character in to_string
SELECT TRANSLATE('abc123', 'abc', 'xyz') FROM dual;

SELECT TRANSLATE('oracle','python''database','AI',',',':') from dual;

--function within the function--
SELECT 'A-B-C-D',SUBSTR('A-B-C-D', 1, INSTR('A-B-C-D', '-', 1, 2) - 1)
       || '/'
       || SUBSTR('A-B-C-D', INSTR('A-B-C-D', '-', 1, 2) + 1) AS result
FROM DUAL;

--------------------NUMERICAL FUNCTIONS------------

--ABS() -- convert sign - to +

select ABS(-10) FROM dual;

select ABS(-90) from dual;

--CEIL()-- USED FOR ROUNDING NUMBERS 
--smallest integer greater than or equal to the given number.

SELECT CEIL(10.2) FROM dual;   -- 11
SELECT CEIL(5.0)  FROM dual;   -- 5
SELECT CEIL(-4.7) FROM dual;   -- -4

--FLOOR()--  USED FOR ROUNDING NUMBERS
--largest integer less than or equal to the given number. 

SELECT FLOOR(10.9) FROM dual;  -- 10
SELECT FLOOR(5.0)  FROM dual;  -- 5
SELECT FLOOR(-4.7) FROM dual;  -- -5

-- ROUND()--

SELECT ROUND (12.45) , ROUND (12.55), ROUND (12.50), ROUND (12.49)FROM DUAL;

SELECT ROUND(15.6789,2) FROM DUAL;  --15.68

--TRUNC()
SELECT TRUNC (15.6789,2) FROM DUAL;  --15.67

--MOD() :-  REMINDER
SELECT MOD(18,2) FROM DUAL;

--POWER()- :- 

SELECT POWER (13,4) FROM DUAL;

SELECT POWER (2,3) FROM DUAL;

--SQRT-- SQUARE ROOT   ********
SELECT SQRT(20) FROM DUAL; 

SELECT TRUNC (SQRT(4.472135954999580,2)) FROM DUAL; 


-- EVEN NO--

SELECT employee_id  FROM hr.employees
where MOD(employee_id,2) = 0


--ODD NO--
SELECT employee_id  FROM hr.employees
where MOD(employee_id,2) <> 0

SELECT BITAND (6,3) AS RESULT FROM DUAL; 

--MOD--
Select Mod (6,3) AS result from dual;

---------DATE FUNCTION -------------

--ADD_MONTHS--
select sysdate from dual;

select SYSDATE,ADD_MONTHS(SYSDATE,1) FROM DUAL;

select employee_id, first_name,salary, hire_date,add_months(hire_date,1)
FROM HR.employees;

--CURRENT DATE ---  
select SYSDATE, CURRENT_DATE FROM DUAl ;


------------------AGGREGATE FUNCTION-------------

--avg()
--count()
--MAX()
--min()
--SUM()

---------------------AVG()----------------

select * from hr.employees;

select avg(salary) from hr.employees;

select min(salary) from hr.employees;

select max(salary) from hr.employees;

select sum(salary) from hr.employees;

--difference between count(*)(all the data in the table is visible) anf count of column name (only rows visible which has data))

select count(*) from hr.employees;

select count(commission_pct) from hr.employees;

SELECT COUNT(department_id) from hr.employees;

select * from hr.employees
where department_id is null;

select sum (10+20+30) from dual;

SELECT * FROM HR.EMPLOYEES
WHERE department_id = 100;

--FIND DEPARTMENT WISE COUNT

SELECT COUNT(*) FROM HR. EMPLOYEES
GROUP BY department_id;
