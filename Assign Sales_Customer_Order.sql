CREATE TABLE salespeople (
snum NUMBER PRIMARY KEY,
Sname VARCHAR(50),
City VARCHAR(50),
Comm NUMBER
);

INSERT INTO salespeople VALUES (1001,'Peel','London',.12);
INSERT INTO salespeople VALUES (1002,'Serres','San Jose',.13);
INSERT INTO salespeople VALUES (1004,'Monika','London',.11);
INSERT INTO salespeople VALUES (1007,'Rifkin','Barcelona',.15);
INSERT INTO salespeople VALUES (1003,'Axelrod','New York',.10);
INSERT INTO salespeople VALUES (1005,'Franc','London',.26);

select * from salespeople;

CREATE TABLE Customer (
Cnum NUMBER PRIMARY KEY,
Cname VARCHAR2(20),
City VARCHAR2(20),
Rating NUMBER,
snum NUMBER,
FOREIGN KEY (Snum) REFERENCES salespeople(Snum)
);

INSERT INTO Customer VALUES (2001,'Hoffman','London',100,1001);
INSERT INTO Customer VALUES (2002,'Giovanni','Rome',200,1003);
INSERT INTO Customer VALUES (2003,'Liu','San Jose',200,1002);
INSERT INTO Customer VALUES (2004,'Grass','Berlin',300,1002);
INSERT INTO Customer VALUES (2006,'Clemens','London',100,1001);
INSERT INTO Customer VALUES (2008,'Cisneros','San Jose',300,1007);
INSERT INTO Customer VALUES (2007,'Pereira','Rome',100,1004);



select * from Customer;

CREATE TABLE Application(
Onum NUMBER PRIMARY KEY,
Amt NUMBER (10,2),
Odate Date,
Cnum NUMBER,
Snum NUMBER,
FOREIGN KEY (Cnum) REFERENCES customer(Cnum),
FOREIGN KEY (Snum) REFERENCES salespeople (Snum)
);

INSERT INTO Application VALUES (3001, 18.69, TO_DATE('03-Oct-1996 12:30','DD-MON-YYYY HH24:MI'), 2008, 1007);
INSERT INTO Application VALUES (3003, 767.19, TO_DATE('03-Oct-1996 13:45','DD-MON-YYYY HH24:MI'), 2001, 1001);
INSERT INTO Application VALUES (3002, 1900.10, TO_DATE('03-Oct-1996 12:05','DD-MON-YYYY HH24:MI'), 2007, 1004);
INSERT INTO Application VALUES (3005, 5160.45, TO_DATE('03-Oct-1996 14:00','DD-MON-YYYY HH24:MI'), 2003, 1002);
INSERT INTO Application VALUES (3006, 1098.16, TO_DATE('03-Oct-1996 13:37','DD-MON-YYYY HH24:MI'), 2008, 1007);
INSERT INTO Application VALUES (3009, 1713.23, TO_DATE('04-Oct-1996 15:21','DD-MON-YYYY HH24:MI'), 2002, 1003);
INSERT INTO Application VALUES (3007, 75.75, TO_DATE('04-Oct-1996 16:02','DD-MON-YYYY HH24:MI'), 2002, 1003);
INSERT INTO Application VALUES (3008, 4723.00, TO_DATE('05-Oct-1996 12:07','DD-MON-YYYY HH24:MI'), 2006, 1001);
INSERT INTO Application VALUES (3010, 1309.95, TO_DATE('06-Oct-1996 13:12','DD-MON-YYYY HH24:MI'), 2004, 1002);
INSERT INTO Application VALUES (3011, 9891.88, TO_DATE('06-Oct-1996 13:09','DD-MON-YYYY HH24:MI'), 2006, 1001);
INSERT INTO Application VALUES (3012, 3455.78, TO_DATE('04-Oct-1996 15:21','DD-MON-YYYY HH24:MI'), 2002, 1003);
INSERT INTO Application VALUES (3013, 1245.98, TO_DATE('04-Oct-1996 16:32','DD-MON-YYYY HH24:MI'), 2002, 1003);
INSERT INTO Application VALUES (3014, 3721.53, TO_DATE('05-Oct-1996 12:45','DD-MON-YYYY HH24:MI'), 2006, 1001);
INSERT INTO Application VALUES (3015, 734.50, TO_DATE('06-Oct-1996 13:16','DD-MON-YYYY HH24:MI'), 2004, 1002);
INSERT INTO Application VALUES (3016, 1729.67, TO_DATE('06-Oct-1996 13:07','DD-MON-YYYY HH24:MI'), 2006, 1001);
INSERT INTO Application VALUES (3017, 1729.67, TO_DATE('06-Oct-1996 13:07','DD-MON-YYYY HH24:MI'), 2009, 1009);

select * from Application;

--Q.1.	List all customers with a rating of 100.
select Cname from customer
WHERE Rating = 100;

--Q.2. Find all records in the Customer table with NULL values in the city column.

SELECT * FROM Customer
Where city IS NULL;

--3.	Find the largest order taken by each salesperson on each date.
SELECT
    snum,
    TRUNC(odate) AS order_date,
    MAX(amt) AS largest_order
FROM Application
GROUP BY snum, TRUNC(odate)
ORDER BY snum, order_date;


--4.	Arrange the Orders table by descending customer number.

SELECT * FROM Application
ORDER BY Cnum DESC;

--5.	Find which salespeople currently have orders in the Orders table.

SELECT DISTINCT Snum
FROM Application;

--6.	List names of all customers matched with the salespeople serving them.

SELECT 
  c.Cname AS Customer_Name,
  s.Sname AS Salesperson_Name
FROM Customer c
JOIN Salespeople s
ON c.Snum = s.Snum;

--7.	Find the names and numbers of all salespeople who had more than one customer.
SELECT
    s.snum,
    s.sname
FROM salespeople s
JOIN Customer c
ON s.snum = c.snum
GROUP BY s.snum, s.sname
HAVING COUNT(c.cnum) > 1;

--8.	Count the orders of each of the salespeople and output the results in descending order.
SELECT 
  Snum,
  COUNT(Onum) AS Order_Count
FROM Application
GROUP BY Snum
ORDER BY Order_Count DESC;

--9.  List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
SELECT * FROM Customer
WHERE EXISTS (
    SELECT 1
    FROM Customer
    WHERE City = 'San Jose'
);

--10. Match salespeople to customers according to what city they lived in.
SELECT
    s.snum,
    s.sname,
    s.city AS salesperson_city,
    c.cnum,
    c.cname,
    c.city AS customer_city
FROM salespeople s
JOIN Customer c
ON s.city = c.city
ORDER BY s.city;

--11. Find the largest order taken by each salesperson.
SELECT
    s.snum,
    s.sname,
    MAX(a.amt) AS largest_order
FROM salespeople s
JOIN Application a
ON s.snum = a.snum
GROUP BY s.snum, S.sname
ORDER BY s.snum;

--12. Find customers in San Jose who has a rating above 200.
SELECT
    cnum,
    cname,
    city,
    rating
FROM Customer
WHERE city = 'San Jose'
  AND rating > 200;
     
--13. List the names and commissions of all salespeople in London.
SELECT
    sname,
    comm
FROM salespeople
WHERE city = 'London';

--14. List all the orders of salesperson Monika from the Orders table.
SELECT
    a.onum,
    a.amt,
    a.odate,
    a.cnum
FROM Application a
JOIN salespeople s
ON a.snum = s.snum
WHERE s.sname = 'Monika';

--15. Find all customers with orders on October 3.
SELECT DISTINCT
    c.cnum,
    c.cname,
    c.city
FROM Customer c
JOIN Application a
ON c.cnum = a.cnum
WHERE TRUNC(a.odate) = DATE '1996-10-03';

--16. Give the sums of the amounts from the orders table, grouped by date, 
SELECT
    TRUNC(odate) AS order_date,
    SUM(amt) AS total_amount
FROM Application
GROUP BY TRUNC(odate)
ORDER BY order_date;

--17. Eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.
SELECT
    TRUNC(odate) AS order_date,
    SUM(amt) AS total_amount,
    MAX(amt) AS max_amount
FROM Application
GROUP BY TRUNC(odate)
HAVING SUM(amt) >= MAX(amt) + 2000
ORDER BY order_date;

--18. Select all orders that had amounts that were greater than at least one of the orders from October 6.
SELECT * FROM Application
WHERE amt > ANY (
    SELECT amt
    FROM Application
    WHERE TRUNC(odate) = DATE '1996-10-06'
)
ORDER BY odate;

--19. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.
SELECT s.snum, s.sname, s.city, s.comm
FROM salespeople s
WHERE s.snum IN (
    SELECT c.snum
    FROM Customer c
    WHERE c.rating = 300
);

--20. Find all pairs of customers having the same rating.
SELECT 
    c1.cnum AS customer1_num,
    c1.cname AS customer1_name,
    c2.cnum AS customer2_num,
    c2.cname AS customer2_name,
    c1.rating
FROM Customer c1
JOIN Customer c2
ON c1.rating = c2.rating
AND c1.cnum < c2.cnum
ORDER BY c1.rating, c1.cnum, c2.cnum;

--21. Find all customers with CNUM, 1000 above the SNUM of Serres.
SELECT cnum, cname, city, rating, snum
FROM Customer
WHERE cnum = (
    SELECT s.snum + 1000
    FROM salespeople s
    WHERE s.sname = 'Serres'
);
     
--22. Give the salespeople’s commissions as percentage instead of decimal numbers.
select
      s.snum,
      s.sname,
      city,
      comm * 100 as comission_percentage
 from salespeople s;      

--23. Find the largest order taken by each salesperson on each date, eliminating those MAX orders, which are less than $3000.00 in value.
SELECT snum,
       odate,
       MAX(amt) AS max_order_amount
FROM orders
GROUP BY snum, odate
HAVING MAX(amt) >= 3000;

--24. List the largest orders on October 3, for each salesperson.
SELECT
    s.snum,
    s.sname,
    MAX(a.amt) AS largest_order
FROM salespeople s
JOIN Application a
ON s.snum = a.snum
WHERE TRUNC(a.odate) = DATE '1996-10-03'
GROUP BY s.snum, s.sname
ORDER BY s.snum;

--25. Find all customers located in cities where Serres (SNUM 1002) has customers.
SELECT cnum, cname, city, rating, snum
FROM Customer
WHERE city IN (
    SELECT city
    FROM Customer
    WHERE snum = 1002
);

--26. Select all customers with a rating above 200.00.
select cnum, cname,  city, rating, snum
from customer
where rating > 200;


--27. Count the number of salespeople currently listing orders in the Orders table.
SELECT COUNT(DISTINCT snum) AS total_salespeople
FROM Application;

SELECT COUNT(*) AS total_salespeople
FROM (
    SELECT s.snum
    FROM salespeople s
    JOIN Application a
    ON s.snum = a.snum
    GROUP BY s.snum
);

--28. Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name and the salesperson‘s rate of commission.



--29. Find salespeople who have multiple customers.
SELECT
    s.snum,
    s.sname,
    COUNT(c.cnum) AS customer_count
FROM salespeople s
JOIN Customer c
ON s.snum = c.snum
GROUP BY s.snum, s.sname;

--30. Find salespeople with customers located in their city.
SELECT 
    s.snum,
    s.sname,
    s.city
FROM salespeople s
JOIN Customer c
ON s.snum = c.snum
AND s.city = c.city;

--31. Find all salespeople whose name starts with ‘ P  ’ and the fourth character is ‘  I   '   ’.
  SELECT 
  snum, 
  sname, 
  city
FROM salespeople
WHERE sname LIKE 'P__I%';

--32. Write a query that uses a sub query to obtain all orders for the customer named ‘Cisneros’. Assume you do not know his customer number.
SELECT *
FROM Application
WHERE cnum = (
    SELECT cnum
    FROM Customer
    WHERE cname = 'Cisneros'
);

--33. Find the largest orders for ‘Serres’   and ‘Rifkin 
SELECT
    s.sname,
    MAX(a.amt) AS largest_order
FROM salespeople s
JOIN Application a
ON s.snum = a.snum
WHERE s.sname IN ('Serres', 'Rifkin')
GROUP BY s.sname;

---34. Extract the Salespeople table in the following order: SNUM, SNAME, COMMISSION, CITY.
select
       snum,
       sname,
       comm as commission,
       city
from salespeople;

--35. Select all customers whose names fall in between ‘A’ and ‘G  ’ alphabetical range.
SELECT 
  snum, 
  sname, 
  city
FROM salespeople
WHERE sname LIKE 'a_____g%';

--36. Select all the possible combinations of customers that you can assign.
SELECT c1.cname,
                  c2.cname
FROM Customer c1,
              Customer c2;

--37. Select all orders that are greater than the average for October 4.
SELECT * FROM Application
WHERE amt >
      (SELECT AVG(amt)
       FROM Application
       WHERE TRUNC(odate)=DATE '1996-10-04');

--38. Write a select command using a correlated sub query that selects the names and numbers of all customers with ratings equal to the maximum for their city.
SELECT cnum, cname, rating, city
FROM Customer c1
WHERE rating =
      (SELECT MAX(rating)
       FROM Customer c2
       WHERE c2.city = c1.city);

--39. Write a query that totals the orders for each day and places the results in descending order.
SELECT TRUNC(odate), 
                       SUM(amt)
FROM Application
GROUP BY TRUNC(odate)
ORDER BY SUM(amt) DESC;

--40. Write a select command that produces the rating followed by the name of each customer in San Jose.
SELECT rating, 
              cname
FROM Customer
WHERE city='San Jose';

--41. Find all orders with amounts smaller than any amount for a customer in San Jose.
SELECT * FROM Application
WHERE amt < ANY (
    SELECT amt
    FROM Application a
    JOIN Customer c ON a.cnum=c.cnum
    WHERE c.city='San Jose'
);

--42. Find all orders with above average amounts for their customers.
SELECT * FROM Application a
WHERE amt >
      (SELECT AVG(amt)
       FROM Application
       WHERE cnum=a.cnum);

--43. Write a query that selects the highest rating in each city.
SELECT city, 
MAX(rating)
FROM Customer
GROUP BY city;

---44. Write a query that calculates the amount of the salesperson’s commission on order by a customer with a rating above 100.00.
SELECT a.onum, a.amt*s.comm AS commission
FROM Application a
JOIN Customer c ON a.cnum=c.cnum
JOIN salespeople s ON a.snum=s.snum
WHERE c.rating > 100;

--45. Count the customers with rating above San Jose’s average.
SELECT COUNT(*)
FROM Customer
WHERE rating >
      (SELECT AVG(rating)
       FROM Customer
       WHERE city='San Jose');

--46. Write a query that produces all pairs of salespeople with themselves as well as duplicate rows with the order reversed.
SELECT s1.sname, s2.sname
FROM salespeople s1, salespeople s2;

--47. Find all salespeople that are located in either Barcelona or London.
SELECT * FROM salespeople
WHERE city IN ('Barcelona','London');

--48. Find all salespeople with only one customer.
SELECT s.snum, s.sname
FROM salespeople s
JOIN Customer c ON s.snum=c.snum
GROUP BY s.snum, s.sname
HAVING COUNT(*)=1;

--49. Write a query that joins the Customer table to itself to find all pairs of customers served by a single salesperson.
SELECT c1.cname, c2.cname
FROM Customer c1
JOIN Customer c2
ON c1.snum=c2.snum
AND c1.cnum<c2.cnum;

--50. Write a query that will give you all orders for more than $1000.00.
SELECT *
FROM Application
WHERE amt>1000;

--51. Write a query that lists each order number followed by the name of the customer who made that order.
SELECT a.onum, c.cname
FROM Application a
JOIN Customer c ON a.cnum=c.cnum;

--52. Write 2 queries that select all salespeople (by name and number) who have customers in their cities who they do not service, one using a join and one a correlated subquery. Which solution is more elegant?
SELECT DISTINCT s.snum, s.sname
FROM salespeople s
JOIN Customer c ON s.city=c.city
WHERE s.snum<>c.snum;

--53. Write a query that selects all customers whose ratings are equal than ANY (in the SQL sense) of Serres.
SELECT *
FROM Customer
WHERE rating = ANY (
    SELECT rating
    FROM Customer
    WHERE snum=1002
);

--54. Write2 queries that will produce all orders taken on October3 or October 4.
SELECT *
FROM Application
WHERE TRUNC(odate) IN (DATE '1996-10-03', DATE '1996-10-04');

--55. Write a query that produces all pairs of orders by a given customer. Name that customer and eliminate duplicates.
SELECT a1.onum, a2.onum
FROM Application a1, Application a2
WHERE a1.cnum=a2.cnum
AND a1.onum<a2.onum
AND a1.cnum=(SELECT cnum FROM Customer WHERE cname='Giovanni');

--56. Find only those customers whose ratings are higher than every customer in Rome.
SELECT * FROM Customer
WHERE rating > ALL (
    SELECT rating FROM Customer WHERE city='Rome'
);

--57. Write a query on the customers table whose output will exclude all customers with a rating < = 100.00, unless they are located in Rome.
SELECT * FROM Customer
WHERE rating<=100 OR city='Rome';

--58. Find all rows from the Customer table for which the salesperson number is 1001.
SELECT * FROM Customer
WHERE snum=1001;

--59. Find the total amount in Orders for each salesperson for which this total is greater than the amount of the largest order in the table.
SELECT snum, SUM(amt)
FROM Application
GROUP BY snum
HAVING SUM(amt) >
       (SELECT MAX(amt) FROM Application);

--60. Write a query that selects all orders that have Zeroes or NULL in the Amount field.
SELECT *
FROM Application
WHERE amt=0 OR amt IS NULL;

--61. Produce all combinations of salespeople and customer names such that the former precedes the latter alphabetically, and the latter has a rating of less than 200.
SELECT s.sname, c.cname
FROM salespeople s, customer c
WHERE s.sname < c.cname
AND c.rating < 200;

--62. List all salespeople’s names and the commission they have earned.
SELECT s.sname, SUM(o.amt * s.comm) AS commission
FROM salespeople s
JOIN orders o ON s.snum=o.snum
GROUP BY s.sname;

--63. Write a query that produces the names and cities of all customers with the same rating as Hoffman. Write the query using Hoffman’s CNUM rather than his rating, so that it would still be usable if his rating changed.
SELECT cname, city
FROM customer
WHERE rating = (
    SELECT rating
    FROM customer
    WHERE cname='Hoffman'
);

--64. Find all salespeople for whom there are customers that follow them in alphabetical order.
SELECT DISTINCT s.sname
FROM salespeople s
JOIN customer c ON s.snum=c.snum
WHERE c.cname > s.sname;

--65. Write a query that produces the names and ratings of all customers of all who have above average orders.
SELECT DISTINCT c.cname, c.rating
FROM Customer c
JOIN Application a
  ON c.cnum = a.cnum
WHERE a.amt > (SELECT AVG(amt) FROM Application);

--66. Find the sum of all purchases from the Orders table.
SELECT SUM(amt) AS total_purchases
FROM Application;

--67. Write a select command that produces the order number, amount, and date for all rows in the Order table.
SELECT onum, amt, odate
FROM application;

--68. Count the number of not null rating fields in the Customer table including duplicates.
SELECT COUNT(rating)
FROM customer;

--69. Write a query that gives the names of both the salesperson and the customer for each order after the order number.
SELECT o.onum, s.sname, c.cname
FROM orders o
JOIN salespeople s 
ON o.snum=s.snum
JOIN customer c 
ON o.cnum=c.cnum;

--70. List the commissions of all salespeople servicing customers in London.
SELECT DISTINCT s.comm
FROM salespeople s
JOIN customer c ON s.snum=c.snum
WHERE c.city='London';

--71. Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
SELECT * FROM salespeople s
WHERE s.city <> ALL (
    SELECT city FROM customer WHERE snum=s.snum
);

--72. Write a query using the EXISTS operator that selects all salespeople with customers located in their cities who are not assigned to them.
SELECT * FROM salespeople s
WHERE EXISTS (
  SELECT 1 FROM customer c
  WHERE c.city=s.city 
  AND c.snum<>s.snum
);

--73. Write a query that selects all customers serviced by Peel or Motika.
SELECT * FROM customer
WHERE snum IN (
    SELECT snum FROM salespeople
    WHERE sname IN ('Peel','Motika')
);

--74. Count the number of salespeople registering orders for each day. 
--(If a salesperson has more than one order on a given day, he or she should be counted only once.).

SELECT TRUNC(odate) AS order_date,
       COUNT(DISTINCT snum) AS salesperson_count
FROM Application
GROUP BY TRUNC(odate)
ORDER BY order_date;

--75. Find all orders attributed to salespeople in London.
SELECT * FROM orders
WHERE snum IN (
    SELECT snum FROM salespeople WHERE city='London'
);

---76. Find all orders by customers not located in the same cities as their salespeople.
SELECT * FROM orders o
JOIN customer c
 ON o.cnum=c.cnum
JOIN salespeople s 
ON o.snum=s.snum
WHERE c.city <> s.city;

--77. Find all salespeople who have customers with more than one current order.
SELECT DISTINCT s.sname
FROM salespeople s
JOIN application a 
ON s.snum=a.snum
GROUP BY s.snum, s.sname
HAVING COUNT(a.onum) > 1;

--78. Write a query that extracts from the Customer table every customer assigned to a salesperson who currently has
-- at least one other customer (besides the customer being selected) with orders in the Orders table.
SELECT * FROM customer c
WHERE c.snum IN (
    SELECT snum FROM application
    GROUP BY snum
    HAVING COUNT(DISTINCT cnum) > 1
);

--79. Write a query that selects all customers whose name begins with ‘C ’.
SELECT * FROM customer
WHERE cname LIKE 'C%';

--80. Write a query on the Customers table that will find the highest rating in each city. 
--Put the output in this form:  for the city (city) the highest rating is : (rating).
SELECT 'For the city '||city|| ' the highest rating is : '||MAX(rating)
FROM customer
GROUP BY city;

--81. Write a query that will produce the Snum values of all salespeople with orders currently in the Orders table without any repeats.
SELECT DISTINCT snum
FROM application;

--82. Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customers’ names and numbers.
SELECT rating, cname, cnum
FROM customer
ORDER BY rating DESC;

--83. Find the average commission for salespeople in London.
SELECT AVG(comm)
FROM salespeople
WHERE city='London';

--84. Find all orders credited to the same salesperson that services Hoffman.
SELECT *
FROM orders
WHERE snum = (
    SELECT snum FROM customer WHERE cname='Hoffman'
);

--85. Find all salespeople whose commission is in between 0.10 and 0.12 both inclusive.
SELECT * FROM salespeople
WHERE comm BETWEEN 0.10 AND 0.12;

--86. Write a query that will give you the names and cities of all salespeople in London with commission above 0.10
SELECT sname, city
FROM salespeople
WHERE city = 'London'
  AND comm > 0.10;

--87. What will be the output from the following query? 
SELECT * FROM ORDERS WHERE (AMT < 1000 OR NOT (ODATE = 10/03/1996 AND CNUM > 2003));
--The query filters out only high-value orders placed on October 3 by customers with 
--customer numbers above 2003, and returns all other orders.

--88. Write a query that selects each customer’s smallest order.
SELECT c.cnum,
       c.cname,
       MIN(a.amt) AS smallest_order
FROM Customer c
JOIN Application a
  ON c.cnum = a.cnum
GROUP BY c.cnum, c.cname;

--89. Write a query that selects the first customer in alphabetical order whose name begins with ‘G  ’.
SELECT *FROM (
    SELECT * FROM Customer
    WHERE cname LIKE 'G%'
    ORDER BY cname
)
WHERE ROWNUM = 1;

--90. Write a query that counts the number of different not NULL city values in the Customers table.
SELECT COUNT(DISTINCT city)
FROM customer;

--91. Find the average amount from the Orders table.
SELECT AVG(amt) AS average_amount
FROM Application;

--92. What would be the output from the following query?
SELECT*FROM ORDERS WHERE NOT  (Odate =10/03/1996 OR Snum>1006) AND amt. >=1500);
--The output will contain all orders with an amount of at least 1500 that were not placed on October 3, 
--1996 and were taken by salespeople whose salesperson number is less than or equal to 1006.

--93. Find all customers who are not located in San Jose & whose rating is above 200.
SELECT * FROM customer
WHERE city<>'San Jose' AND rating>200;

--94. Give a simpler way to write this query:
SELECT Snum, Sname, city, Comm FROM salespeople WHERE (Comm>0.12 and Comm <0.14);

SELECT snum, sname, city, comm
FROM salespeople
WHERE comm BETWEEN 0.12 AND 0.14;

--95. Evaluate the following query:
SELECT * FROM orders WHERE NOT ((Odate = 10/03/1996 AND Snum>1002) OR amt>2000);
--The query returns all orders whose amount is not greater than 2000 and which are not placed on 10-Mar-1996 
--by salespeople having numbers greater than 1002.

--96. Which salespeople attend to customers not in the city they have been assigned to?
SELECT DISTINCT s.snum, s.sname
FROM salespeople s
JOIN customer c
ON s.snum = c.snum
WHERE s.city <> c.city;

--97. Which salespeople get commission greater than 0.11 and serving customers rated less than 250?
SELECT DISTINCT s.sname
FROM salespeople s
JOIN customer c
 ON s.snum=c.snum
WHERE s.comm>0.11 AND c.rating<250;

--98. Which salespeople have been assigned to the same city but get different commission percentages?
SELECT s1.snum, s1.sname, s1.city, s1.commission
FROM salespeople s1
JOIN salespeople s2
ON s1.city = s2.city
AND s1.commission <> s2.commission
AND s1.snum <> s2.snum;

--99. Which salesperson has earned the most by way of commission?

--100.  Does the customer who has placed the maximum number of orders have the maximum rating?
SELECT c.cname, c.rating
FROM customer c
WHERE c.cnum = (
    SELECT cnum
    FROM application
    GROUP BY cnum
    HAVING COUNT(*) = (
        SELECT MAX(COUNT(*))
        FROM application
        GROUP BY cnum
    )
)
AND c.rating = (SELECT MAX(rating) FROM customer);

--101.  Has the customer who has spent the largest amount of money been given the highest rating?
SELECT c.cname, c.rating
FROM customer c
WHERE c.cnum = (
    SELECT cnum
    FROM application
    GROUP BY cnum
    HAVING SUM(amt) = (
        SELECT MAX(SUM(amt))
        FROM application 
        GROUP BY cnum
    )
)
AND c.rating = (SELECT MAX(rating) FROM customer);

--102.  List all customers in descending order of customer rating.
SELECT * FROM customer
ORDER BY rating DESC;

--103.  On which days has Hoffman placed orders?
SELECT DISTINCT odate
FROM application
WHERE cnum = (
    SELECT cnum FROM customer WHERE cname='Hoffman'
);

--104.  Do all salespeople have different commissions?
SELECT commission
FROM salespeople
GROUP BY comm
HAVING COUNT(*) > 1;

--105.  Which salespeople have no orders between 10/03/1996 and 10/05/1996?
SELECT * FROM salespeople
WHERE snum NOT IN (
    SELECT snum FROM application
    WHERE odate BETWEEN DATE '1996-10-03' AND DATE '1996-10-05'
);

--106.  How many salespersons have succeeded in getting orders?
SELECT COUNT(DISTINCT snum)
FROM application;

--107.  How many customers have placed orders?
SELECT COUNT(DISTINCT cnum)
FROM appliation;

--108.  On which date has each salesperson booked an order of maximum value?
SELECT snum, MAX(amt), MAX(odate)
FROM application
GROUP BY snum;

--109.  Who is the most successful salesperson?
SELECT s.snum, s.sname, SUM(a.amt) AS total_amount
FROM salespeople s
JOIN application a 
ON s.snum = a.snum
GROUP BY s.snum, s.sname
HAVING SUM(a.amt) = (
    SELECT MAX(total_amt)
    FROM (
        SELECT SUM(amt) AS total_amt
        FROM application
        GROUP BY snum ));

--110.  Who is the worst customer with respect to the company?
SELECT s.snum, s.sname, SUM(a.amt) AS total_sales
FROM salespeople s
JOIN application a 
ON s.snum = a.snum
GROUP BY s.snum, s.sname
HAVING SUM(a.amt) = (
    SELECT Min(total_amt)
    FROM (
        SELECT SUM(amt) AS total_amt
        FROM application
        GROUP BY snum));


--111.  Are all customers not having placed orders greater than 200 totally been serviced by salesperson Peel or Serres?
SELECT CASE
    WHEN NOT EXISTS (
        SELECT 1
        FROM customer c
        WHERE c.snum NOT IN (
            SELECT snum
            FROM salespeople
            WHERE sname IN ('Peel', 'Serres')  )
        AND c.cnum IN (
            SELECT cnum
            FROM application
            GROUP BY cnum
            HAVING MAX(amt) <= 200   ))
    THEN 'YES'
    ELSE 'NO'
END AS result
FROM dual;

--112.  Which customers have the same rating?
SELECT c1.cnum, c1.cname, c1.rating
FROM customer c1
JOIN customer c2
ON c1.rating = c2.rating
AND c1.cnum <> c2.cnum
ORDER BY c1.rating;

--113.  Find all orders greater than the average for October 4th.
SELECT * FROM application
WHERE amt >
 (SELECT AVG(amt) FROM application
  WHERE odate=DATE '1996-10-04');

--114.  Which customers have above average orders?
SELECT distinct  c.cnum, c.cname
FROM customer c
JOIN application a
ON c.cnum = a.cnum
WHERE a.amt > (
    SELECT AVG(amt)
    FROM application
);

--115.  List all customers with ratings above San Jose’s average.
SELECT snum
FROM customer
GROUP BY snum
HAVING COUNT(*)>1;

--116.  Select the total amount in orders for each salesperson for which the total is greater than the amount of the largest order in the table.
SELECT snum, SUM(amt) AS total_amount
FROM application
GROUP BY snum
HAVING SUM(amt) > (
    SELECT MAX(amt)
    FROM application
);

--117.  Give names and numbers of all salesperson that have more than one customer.
SELECT snum
FROM customer
GROUP BY snum
HAVING COUNT(*)>1;

--118.  Select all salesperson by name and numbers who have customers in their city whom they don’ s the service.
SELECT DISTINCT s.sname
FROM salespeople s
JOIN customer c 
ON s.city=c.city
WHERE s.snum<>c.snum;

--119.  Which customers’ rating should be lowered?
SELECT c.cname, c.rating
FROM customer c
WHERE c.rating >
      (SELECT AVG(rating) FROM customer)
AND c.cnum IN (
      SELECT cnum
      FROM application
      GROUP BY cnum
      HAVING SUM(amt) <
             (SELECT AVG(amt) FROM application)
);

--120.  Is there a case for assigning a salesperson to Berlin?
SELECT *FROM customer
WHERE city = 'Berlin';
AND city NOT IN (SELECT city FROM salespeople);

--121.  Is there any evidence linking the performance of a salesperson to commission that he or she is being paid?
SELECT s.sname, s.comm, SUM(a.amt) AS total_sales
FROM salespeople s
JOIN application a 
ON s.snum = a.snum
GROUP BY s.sname, s.comm
ORDER BY total_sales DESC;

--122.  Does the total amount in orders by customer in Rome and London 
--exceeds the commission paid to salesperson in London and New York by more than 5 times?
SELECT 'YES' AS result
FROM application a
JOIN customer c ON a.cnum = c.cnum
JOIN salespeople s ON a.snum = s.snum
GROUP BY 1
HAVING
    SUM(CASE 
          WHEN c.city IN ('Rome','London') THEN a.amt 
          ELSE 0 
        END)
    >
    5 *
    SUM(CASE 
          WHEN s.city IN ('London','New York') THEN a.amt * s.comm 
          ELSE 0 
        END);
        
--123.  Which is the date, order number, amt and city for each salesperson (byname) for   the maximum order he has obtained?
SELECT s.sname, a.onum, a.amt, a.odate, s.city
FROM salespeople s
JOIN application a ON s.snum = a.snum
WHERE a.amt = (
    SELECT MAX(amt)
    FROM application
    WHERE snum = s.snum
);

--124.  Which salesperson(s) should be fired?
SELECT s.sname
FROM salespeople s
WHERE s.snum NOT IN (SELECT snum FROM application);

--125.  What is the total income for the company? 
SELECT SUM(amt) AS total_income
FROM application;
