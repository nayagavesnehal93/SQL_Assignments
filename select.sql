SELECT * FROM hr.employees;

SELECT COUNT(*) FROM hr.employees;

SELECT first_name, last_name, job_id 
FROM hr.employees;

SELECT * 
FROM hr.employees 
WHERE department_id = 50;

SELECT * 
FROM hr.employees 
WHERE hire_date > TO_DATE('01-JAN-2005', 'DD-MON-YYYY');

SELECT COUNT(*) AS total_employees
FROM hr.employees;

SELECT MAX(salary) AS highest_salary
FROM hr.employees;

SELECT * 
FROM hr.employees 
WHERE first_name LIKE 'A%';

SELECT * 
FROM hr.employees 
ORDER BY salary DESC;

SELECT department_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id;
