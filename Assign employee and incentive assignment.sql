--1.Write create table syntax for employee table and Incentive table

CREATE TABLE Employee (
  Emp_id NUMBER PRIMARY KEY,
  First_name VARCHAR2(50),
  Last_name VARCHAR2(50),
  Salary NUMBER,
  Joining_date DATE,
  Department VARCHAR2(40)
);

--2.Writesyntax forinsert data into table of employee table and Incentive table

INSERT INTO employee VALUES (1,'John','Abraham',1000000, TO_DATE('01-JAN-2013','DD-MON-YYYY'),'Banking');
INSERT INTO employee VALUES (2,'Michael','Clarke',800000, TO_DATE('01-JAN-2013','DD-MON-YYYY'),'Insurance');
INSERT INTO employee VALUES (3,'Roy','Thomas',700000, TO_DATE('01-FEB-2013','DD-MON-YYYY'),'Banking');
INSERT INTO employee VALUES (4,'Tom','Jose',600000, TO_DATE('01-FEB-2013','DD-MON-YYYY'),'Insurance');
INSERT INTO employee VALUES (5,'Jerry','Pinto',650000, TO_DATE('01-FEB-2013','DD-MON-YYYY'),'Insurance');
INSERT INTO employee VALUES (6,'Philip','Mathew',750000, TO_DATE('01-JAN-2013','DD-MON-YYYY'),'Services');

--3. Get all employee details from the employee table
select * from Employee;

CREATE TABLE Incentives (
  Employee_ref_id NUMBER,
  Incentive_date DATE,
  Incentive_amount NUMBER
);

INSERT INTO Incentives VALUES (1, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 5000);
INSERT INTO Incentives VALUES (2, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 3000);
INSERT INTO Incentives VALUES (3, TO_DATE('01-FEB-2013','DD-MON-YYYY'), 4000);
INSERT INTO Incentives VALUES (1, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 4500);
INSERT INTO Incentives VALUES (2, TO_DATE('01-JAN-2013','DD-MON-YYYY'), 3500);


select * from incentives;

--4.Get First_Name,Last_Name from employee table

SELECT First_name, Last_name
FROM Employee;

--5.Get First_Name from employee table using alias name “Employee Name”

SELECT First_name AS "Employee Name"
FROM Employee;

--6.Get First_Name from employee table in upper case

SELECT First_name, upper(First_name) as First_name
From Employee;

--7.Select first 3 characters of FIRST_NAME from EMPLOYEE

SELECT SUBSTR(First_name, 1, 3) AS First3Characters
FROM Employee;

--8.	Get position of 'o' in name 'John' from employee table

SELECT INSTR(First_name, 'o') AS Position_of_o
FROM Employee
WHERE First_name = 'John';

--9. Get FIRST_NAME from employee table after removing white spaces from right side.

SELECT RTRIM(First_name) AS Trimmed_Name
FROM Employee;

--10.Get First_Name from employee table after replacing 'o' with '$'
SELECT REPLACE(First_name, 'o', '$') AS Modified_Name
FROM Employee;

--11.Get First_Name and Last_Name as single column from employee table separated by a '_'
SELECT First_name || '_' || Last_name AS Full_Name
FROM Employee;
--OR--
SELECT First_name,Last_name, CONCAT (First_name, Last_name) from Employee;

--12.Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table
SELECT 
    First_name,
    EXTRACT(YEAR FROM Joining_date) AS Joining_Year,
    EXTRACT(MONTH FROM Joining_date) AS Joining_Month,
    EXTRACT(DAY FROM Joining_date) AS Joining_Day
FROM Employee;

--13.	Get all employee details from the employee table order by First_Name Ascending
SELECT *FROM Employee
ORDER BY First_name ASC;

--14.	Get all employee details from the employee table order by First_Name Ascending and Salary Descending?

SELECT *FROM Employee
ORDER BY First_name ASC, Salary DESC;

--15.Get employee details from employee table whose employee name is “John”

SELECT * FROM Employee
WHERE First_name ='John';

--16.Get employee details from employee table whose employee name are “John ” and “Roy ”

SELECT * FROM Employee
WHERE First_name IN ('John', 'Roy');

--17.Get employee details from employee table whose employee name are not “John” and “Roy ”.

SELECT * FROM Employee
WHERE First_name NOT IN ('John', 'Roy');

--18.	Get employee details from employee table whose first name starts with 'J'.

SELECT * FROM Employee
WHERE First_name LIKE 'J%';

--19.	Get employee details from employee table whose first name contains 'o'.

SELECT * FROM Employee
WHERE First_name LIKE '%0%';

--20.	Get employee details from employee table whose first name ends with 'n'.

SELECT * FROM Employee
WHERE First_name LIKE 'n%';

--21.	Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.

SELECT * FROM Employee
WHERE First_name LIKE '____n';

--22.	Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.

SELECT * FROM Employee
WHERE First_name LIKE 'J____';

--23.	Get employee details from employee table who’s Salary greater than 600000.

SELECT * FROM Employee
WHERE Salary > 600000;

--24.	Get employee details from employee table whose joining year is “2013 ”.

SELECT * FROM Employee
WHERE EXTRACT(YEAR FROM Joining_date) = 2013;

--25.	Get employee details from employee table whose joining month is “January”.

SELECT * FROM Employee
WHERE EXTRACT(month FROM Joining_date) = 1;

--26.	Get employee details from employee table who joined before January 1st 2013.

SELECT *FROM Employee
WHERE Joining_date < TO_DATE('01-JAN-2013', 'DD-MON-YYYY');

--27.	Get employee details from employee table who joined after January 31st

SELECT * FROM Employee
WHERE Joining_date > TO_DATE('31-JAN-2013', 'DD-MON-YYYY');

--28.Get Joining Date and Time from employee table

SELECT TO_CHAR(joining_date, 'DD-MON-YYYY HH24:MI:SS') AS joining_date_time
FROM employee;

--29.Get Joining Date, Time including milliseconds from employee table

SELECT emp_id,
       first_name,
       CAST(joining_date AS TIMESTAMP) AS joining_date_time
FROM employee;

--30.	Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.

SELECT e.emp_id,
       e.first_name,
       i.incentive_date -  e.joining_date AS date_difference
FROM employee e
JOIN incentives i
ON e.emp_id = i.EMPLOYEE_REF_ID;

--31.	Get department, total salary with respect to a department from employee table.

Select department, SUM(salary) AS Total_salary
FROM employee
GROUP BY Department;

--32.	Get department, total salary with respect to a department from employee table order by total salary descending.
Select department, SUM(salary) AS Total_salary
FROM employee
GROUP BY Department
ORDER BY Total_salary DESC;

--33.	Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.
select  COUNT(emp_id), department,
       SUM (salary) AS TOTAL_SALARY
FROM Employee
GROUP BY department
ORDER BY Total_Salary DESC;

--34.	Get department wise average salary from employee table order by salary ascending?
SELECT AVG(salary) from employee
ORDER BY salary DESC;

--35. Get department wise maximum salary from employee table order by salary ascending?
SELECT Department,
       MAX(salary) AS MAXIMUM_SALARY
 FROM Employee
 GROUP BY Department 
 ORDER BY MAXIMUM_SALARY;
 
--36. Get department wise minimum salary from employee table order by salary ascending?
SELECT Department,
       MIN(salary) AS MINIMUM_SALARY
 FROM Employee
 GROUP BY Department 
 ORDER BY MINIMUM_SALARY;
 
--37.  Select no of employees joined with respect to year and month from employee table.
SELECT TO_CHAR(joining_date, 'YYYY') AS join_year,
       TO_CHAR(joining_date, 'MM')   AS join_month,
       COUNT(*) AS no_of_employees
FROM employee
GROUP BY TO_CHAR(joining_date, 'YYYY'),
         TO_CHAR(joining_date, 'MM')
ORDER BY join_year, join_month;


--38. Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
SELECT department,
       SUM(salary) AS TOTAL_SALARY  FROM Employee
 GROUP BY department
  HAVING SUM(SALARY ) > 800000
 ORDER BY TOTAL_SALARY ;
 
--39. Select employee details from employee table if data in incentive table?
SELECT DISTINCT e.*
FROM employee e
JOIN incentives i
ON e.emp_id = i.employee_ref_id;

--40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table
SELECT first_name,
       salary,
       CASE
         WHEN first_name = 'John' THEN salary * 0.20
         WHEN first_name = 'Roy'  THEN salary * 0.10
         ELSE salary * 0.15
       END AS calculated_salary
FROM employee;


--41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as    'Services Dept' from employee table.
SELECT first_name,
       department,
       CASE
         WHEN department = 'Banking'   THEN 'Bank Dept'
         WHEN department = 'Insurance' THEN 'Insurance Dept'
         WHEN department = 'Services'  THEN 'Services Dept'
       END AS department_name
FROM employee;

--42. Delete employee data from employee table who got incentives in incentive table
DELETE FROM employee
WHERE emp_id IN (
  SELECT employee_ref_id
  FROM incentives
);

--43. Select first_name, incentive amount from employee and incentives table for those employees who have incentives.
SELECT E.FIRST_NAME,
I.INCENTIVE_AMOUNT
FROM EMPLOYEE E
JOIN incentives i
ON e.emp_id = i.employee_ref_id
WHERE e.emp_id = i.employee_ref_id;

--44. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT e.first_name,
       i.incentive_amount
FROM employee e
JOIN incentives i
ON e.emp_id = i.employee_ref_id
WHERE i.incentive_amount > 3000;

--45. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
SELECT e.first_name,
       i.incentive_amount
FROM employee e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id;

--46. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.
SELECT e.first_name,
       COALESCE(i.incentive_amount, 0) AS incentive_amount
FROM employee e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id;

--47. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
SELECT DISTINCT e.first_name
FROM employee e
LEFT JOIN incentives i
ON e.emp_id = i.employee_ref_id
WHERE i.incentive_amount IS NOT NULL;

 
--48. Select max incentive with respect to employee from employee and incentives table using sub query.
SELECT employee_ref_id,
       MAX(incentive_amount) AS max_incentive
FROM incentives
GROUP BY employee_ref_id;











