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

select * from Application;

--Q.1.	List all customers with a rating of 100.
select Cname from customer
WHERE Rating = 100;

--Q.2. Find all records in the Customer table with NULL values in the city column.
SELECT * FROM Customer
WHERE City IS NULL;

--3.	Find the largest order taken by each salesperson on each date.
SELECT Snum, TRUNC(Odate) AS Order_Date,
  MAX(Amt) AS Largest_Order FROM Application
GROUP BY Snum,
  TRUNC(Odate)
ORDER BY 
  Snum,
  Order_Date;


--TRUNC(Odate) removes the time part, keeping only the date
--MAX(Amt) finds the largest order amount
--grouped per salesperson per date


--4.	Arrange the Orders table by descending customer number.

SELECT * FROM Application
ORDER BY Cnum DESC;

--5.	Find which salespeople currently have orders in the Orders table.
SELECT DISTINCT Snum
FROM Application;

--6.	List names of all customers matched with the salespeople serving them.

--7.	Find the names and numbers of all salespeople who had more than one customer.

--8.	Count the orders of each of the salespeople and output the results in descending order.
SELECT 
  Snum,
  COUNT(Onum) AS Number_of_Orders
FROM Application
GROUP BY Snum
ORDER BY Number_of_Orders DESC;
 
--9.	List the Customer table if and only if one or more of the customers in the Customer tables are located in San Jose.
SELECT * FROM Customer
WHERE EXISTS (
    SELECT 1
    FROM Customers
    WHERE City = 'San Jose'
);
--The EXISTS subquery checks if there is at least one row with City = 'San Jose'

--10.	Match salespeople to customers according to what city they lived in.









