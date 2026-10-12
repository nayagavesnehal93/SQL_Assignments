--charater functions--
SELECT UPPER('oracle sql') FROM dual;

SELECT LOWER('ORACLE SQL') FROM dual;


SELECT INITCAP('oracle sql training') FROM dual;
SELECT employee_id,first_name,last_name,email,initcap(email)
from hr.employees;

SELECT LENGTH('ORACLE') FROM dual;

SELECT SUBSTR('ORACLE SQL', 1, 6) FROM dual;
SELECT SUBSTR('Oracle substring',-8,8) from dual;


SELECT INSTR('ORACLE SQL', ' ') FROM dual;
SELECT INSTR('This is a playlist','is',-1)
from dual;


SELECT TRIM('  ORACLE  ') FROM dual;

SELECT LTRIM('000123', '0') FROM dual;
SELECT RTRIM('SQL###', '#') FROM dual;

SELECT REPLACE('HR-Department', '-', ' ') FROM dual;

SELECT CONCAT('Oracle', ' SQL') FROM dual;

SELECT LPAD('123', 5, '0') FROM dual;
SELECT RPAD('SQL', 6, '*') FROM dual;

SELECT ASCII('A') FROM dual;
SELECT ASCII(first_name) AS "ASCII for first name" from hr.employees;
SELECT CHR(65) FROM dual;
SELECT CHR('123')from dual;

SELECT TRANSLATE('oracle,python,database,AI',',',':') from dual;
SELECT translate('This is a test','i','I') from dual;
SELECT INSTR('I AM LEARNING PL/SQL DEVELOPER','E',8,3)FROM DUAL;
SELECT INSTR('BANANA BANANA','ANA',-1,2)AS "ana" FROM DUAL;


SELECT employee_id  FROM hr.employees
where MOD(employee_id,2) = 0

SELECT SYSDATE, ADD_MONTHS(SYSDATE,1) FROM DUAL;
