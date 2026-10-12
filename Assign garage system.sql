create table custom(
       CID NUMBER PRIMARY KEY,
       CNAME VARCHAR (50),
       CADD VARCHAR (20),
       C_CONTACT NUMBER,
       C_CREDIRDAYS NUMBER,
       CJ_DATE DATE,
       SEX VARCHAR(10)
 );
 
 SELECT * FROM CUSTOM;
  INSERT INTO CUSTOM VALUES (1001,'CYONA BLAKE','NEW YORK',1235684,20,TO_DATE ('20-JAN-11','DD-MON-YY' ),'FEMALE');
  INSERT INTO CUSTOM VALUES (1002,'JOHN SMITH','NEW JERSI',1341684,20,TO_DATE('21-FEB-11','DD-MON-YY'),'MALE');
  INSERT INTO CUSTOM VALUES (1003,'JORDAN WOOD','PRAG',1805184,20,TO_DATE('22-MAR-11','DD-MON-YY'),'MALE');
  INSERT INTO CUSTOM VALUES (1004,'CHRISTNA','MANHATTON',1125684,31,TO_DATE('23-APR-13','DD-MON-YY'),'FEMALE');
  INSERT INTO CUSTOM VALUES (1005,'TOM HILL','LONDON',1239284,10,TO_DATE('25-JUN-15','DD-MON-YY'),'MALE');
 INSERT INTO CUSTOM VALUES (1006,'KAMILA JOSEF','PARIS',124568,9,TO_DATE('28-JUL-11','DD-MON-YY'),'FEMALE');
 INSERT INTO CUSTOM VALUES (1007,'ANDRU SYMON','TAXES',125654,15,TO_DATE('01-APR-16','DD-MON-YY'),'MALE');
 INSERT INTO CUSTOM VALUES (1008,'SANJU SAMSUNG','NEW YORK',12346341,4,TO_DATE('20-JAN-16','DD-MON-YY'),'MALE');
 
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 CREATE TABLE vendors (
    vid         NUMBER PRIMARY KEY,
    vname       VARCHAR2(50),
    vadd        VARCHAR2(50),
    vcontact    NUMBER,
    vcreditdays NUMBER,
    vj_date     DATE
);

SELECT * FROM VENDORS;

INSERT INTO vendors VALUES (2001, 'KIRAN PATIL',  'PUNE',       20535535, 20, TO_DATE('20-Jan-2010','DD-Mon-YYYY'));
INSERT INTO vendors VALUES (2002, 'PRAKASH JAIN', 'MUMBAI',     2063564,  10, TO_DATE('05-Nov-2011','DD-Mon-YYYY'));
INSERT INTO vendors VALUES (2003, 'SWAPNIL THETE','NASHIK',     25355352, 15, TO_DATE('18-Mar-2010','DD-Mon-YYYY'));
INSERT INTO vendors VALUES (2004, 'AMOL SHENDE',  'SATARA',     23674776, 18, TO_DATE('07-Apr-2015','DD-Mon-YYYY'));
INSERT INTO vendors VALUES (2005, 'KARAN SINTRE', 'BULDHANA',   256756,   30, TO_DATE('22-Apr-2009','DD-Mon-YYYY'));
INSERT INTO vendors VALUES (2006, 'RAM KULKARNI', 'OSMANABAD',  20367454, 21, TO_DATE('09-Jul-2010','DD-Mon-YYYY'));

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE employee_table (
    eid        NUMBER PRIMARY KEY,
    ename      VARCHAR2(50),
    ejob       VARCHAR2(30),
    eadd       VARCHAR2(40),
    econtact   NUMBER,
    esal       NUMBER,
    edoj       DATE,
    edol       DATE
);

select * from employee_table;

INSERT INTO employee_table VALUES (3001,'STEVEN KING','PAINTER','NEW YORK',10367454,1200,TO_DATE('09-Jul-2010','DD-Mon-YYYY'),NULL);
INSERT INTO employee_table VALUES (3002,'DAVID AUSTIN','FITTER','MAN HATON',10367434,1100,TO_DATE('19-Aug-2010','DD-Mon-YYYY'),NULL);
INSERT INTO employee_table VALUES (3003,'BRUCE ERNST','MECHANIC','NEW JERCY',10367264,2200,TO_DATE('08-Sep-2010','DD-Mon-YYYY'),NULL);
INSERT INTO employee_table VALUES (3004,'LUIS POPP','MECHANIC','NEW JERCY',10367264,1700,TO_DATE('19-Oct-2009','DD-Mon-YYYY'),TO_DATE('06-Sep-2010','DD-Mon-YYYY'));
INSERT INTO employee_table VALUES (3005,'SHERI GOMES','FITTER','PARIS',10327264,1000,TO_DATE('19-Oct-2009','DD-Mon-YYYY'),TO_DATE('01-Aug-2010','DD-Mon-YYYY'));
INSERT INTO employee_table VALUES (3000,'JAMES PHILLIP','FITTER','PARIS',10322264,NULL,TO_DATE('01-Jan-2008','DD-Mon-YYYY'),NULL);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE sparepart (
    spid    NUMBER PRIMARY KEY,
    spname  VARCHAR2(100),
    sprate  NUMBER,
    spunit  VARCHAR2(20)
);

select * from sparepart;

INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4001,'TWO WHEELER TUBE',250,'NOS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4002,'TWO WHEELER ENGINE OIL',400,'LTRS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4003,'FOUR WHEELER ENGINE OIL',5000,'LTRS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4004,'TWO WHEELER CARBORATOR',680,'NOS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4005,'TWO WHEELER CLUTCH WIRE',129,'MTRS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4006,'TWO WHEELER TAIL LIGHT',100,'NOS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4007,'TWO WHEELER INDICATORS',150,'NOS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4008,'FOUR WHEELER GASKIT',1340,'NOS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4009,'WHITE COLOUR',340,'LTRS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4010,'BLACK COLOUR',240,'LTRS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4011,'TWO WHEELER SIDE MIRROR',250,'NOS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4012,'FOUR WHEELER SIDE MIRROR',450,'NOS');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4013,'TWO WHEELER SHOCKUP',1320,'PAIR');
INSERT INTO sparepart (spid, spname, sprate, spunit) VALUES (4014,'FOUR WHEELER BUMPER',6000,'NOS');
INSERT INTO sparepart(spid,spname,sprate,spunit) VALUES (4015,'FOUR WHEELER FRONT GLASS',7000,'PCS');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE purchase (
    pid       NUMBER PRIMARY KEY,
    vid       NUMBER,
    spid      NUMBER,
    pqTy      NUMBER,
    sprate    NUMBER,
    spgst     NUMBER,
    pdate     DATE,
    trancost  NUMBER,
    total     NUMBER,
    rcv_eid   NUMBER
);

SELECT * FROM PURCHASE;

INSERT INTO purchase VALUES (5001,2001,4001,10,250,350,TO_DATE('01-Jan-2011','DD-Mon-YYYY'),1300,4150,3001);
INSERT INTO purchase VALUES (5002,2002,4002,4,400,288,TO_DATE('02-Mar-2011','DD-Mon-YYYY'),100,1988,3001);
INSERT INTO purchase VALUES (5003,2003,4004,8,680,761.6,TO_DATE('12-Jun-2011','DD-Mon-YYYY'),50,6251.6,3003);
INSERT INTO purchase VALUES (5004,2004,4005,10,129,154.8,TO_DATE('22-Aug-2011','DD-Mon-YYYY'),125,1569.8,3004);
INSERT INTO purchase VALUES (5005,2005,4006,20,100,300,TO_DATE('07-Sep-2011','DD-Mon-YYYY'),20,2320,3003);
INSERT INTO purchase VALUES (5006,2006,4007,30,150,630,TO_DATE('12-Oct-2011','DD-Mon-YYYY'),60,5190,3002);
INSERT INTO purchase VALUES (5007,2001,4003,20,5000,14000,TO_DATE('07-Sep-2011','DD-Mon-YYYY'),1000,115000,3005);
INSERT INTO purchase VALUES (5008,2006,4005,1,129,15.48,TO_DATE('12-Oct-2011','DD-Mon-YYYY'),50,194.48,3005);
INSERT INTO purchase VALUES (5009,2006,4005,1,129,15.48,TO_DATE('15-Oct-2011','DD-Mon-YYYY'),50,194.48,3005);
INSERT INTO purchase VALUES (5010,2006,4009,5,340,233,TO_DATE('20-Oct-2011','DD-Mon-YYYY'),0,2938,3003);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE service (
    sid       NUMBER PRIMARY KEY,
    cid       NUMBER,
    eid       NUMBER,
    spid      NUMBER,
    typ_veh   VARCHAR2(30),
    veh_no    VARCHAR2(20),
    typ_ser   VARCHAR2(40),
    ser_date  DATE,
    qty       NUMBER,
    sp_rate   NUMBER,
    sp_amt    NUMBER,
    sp_gst    NUMBER,
    ser_amt   NUMBER,
    comm      NUMBER,
    total     NUMBER
);

SELECT * FROM SERVICE;

INSERT INTO service VALUES (6001,1001,3001,4001,'TWO WHEELER','MH15CA3228','TUBE DAMAGED',TO_DATE('02-Jan-2011','DD-Mon-YYYY'),1,250,250,35,50,0,335);
INSERT INTO service VALUES (6002,1002,3001,4002,'TWO WHEELER','MH-16U5713','FULL SERVICING',TO_DATE('04-Mar-2011','DD-Mon-YYYY'),1,400,400,52,300,50,752);
INSERT INTO service VALUES (6003,1003,3004,4005,'TWO WHEELER','MH12PQ1313','CLUTCH WIRE',TO_DATE('22-Aug-2011','DD-Mon-YYYY'),1,129,129,0,10,0,139);
INSERT INTO service VALUES (6004,1002,3001,4002,'TWO WHEELER','MH-16U5713','FULL SERVICING', TO_DATE('05-May-2011','DD-Mon-YYYY'),1,400,400,52,300,50,752);
INSERT INTO service VALUES (6005,1004,3001,4009,'TWO WHEELER','MH-14PA335','COLOR',TO_DATE('21-Oct-2011','DD-Mon-YYYY'),2.5,340,850,119,500,150,1469);
INSERT INTO service VALUES (6006,1005,3001,4009,'TWO WHEELER','MH-12WE334','COLOR',TO_DATE('01-Dec-2011','DD-Mon-YYYY'),2.5,340,850,119,500,150,1469);
INSERT INTO service VALUES (6007,1007,3001,4001,'FOUR WHEELER','MH17BB1345','TUBE DAMAGED',TO_DATE('02-Jan-2012','DD-Mon-YYYY'),1,250,250,35,150,0,435);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q.1 List all the customers serviced.
SELECT DISTINCT c.CID, c.CNAME, c.CADD, c.C_CONTACT, c.SEX
FROM CUSTOM c
JOIN SERVICE s
ON c.CID = s.CID;

--Q.2 Customers who are not serviced.-
SELECT c.CID, c.CNAME, c.CADD, c.C_CONTACT, c.SEX
FROM CUSTOM c
LEFT JOIN SERVICE s 
ON c.CID = s.CID
WHERE s.CID IS NULL;

--Q.3 Employees who have not received the commission.
SELECT e.eid, e.ename, e.ejob, e.eadd, e.econtact, e.esal
FROM employee_table e
LEFT JOIN service s 
ON e.eid = s.eid 
AND s.comm > 0
WHERE s.eid IS NULL;

--Q.4 Name the employee who have maximum Commission.
SELECT e.eid, e.ename, e.ejob, s.comm
FROM employee_table e
JOIN service s 
ON e.eid = s.eid
WHERE s.comm = (
    SELECT MAX(comm) FROM service
);

--Q.5 Show employee name and minimum commission amount received by an employee.-
      SELECT e.ename, MIN(s.comm) AS min_commission
FROM employee_table e
JOIN service s ON e.eid = s.eid
GROUP BY e.ename;

--Q.6 Display the Middle record from any table.
SELECT * FROM (
  SELECT c.*, ROW_NUMBER() OVER (ORDER BY cid) rn
  FROM custom c
)
WHERE rn = CEIL((SELECT COUNT(*) FROM custom)/2);

--Q.7 Display last 4 records of any table.
SELECT *FROM (
  SELECT c.*, ROW_NUMBER() OVER (ORDER BY cid DESC) rn
  FROM custom c
)
WHERE rn <= 4;

--Q.8 Count the number of records without count function from any table.
SELECT MAX(ROWNUM) AS total_records
FROM custom;

--Q.9 Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).
DELETE FROM service
WHERE ROWID NOT IN (
  SELECT MIN(ROWID)
  FROM service
  GROUP BY cid
);
ROLLBACK;

--Q.10 Show the name of Customer who have paid maximum amount 
SELECT c.cname
FROM custom c
JOIN service s ON c.cid = s.cid
WHERE s.total = (SELECT MAX(total) FROM service);
 
--Q.11 Display Employees who are not currently working.
SELECT * FROM employee_table
WHERE edol IS NOT NULL;

--Q.12 How many customers serviced their two wheelers.
SELECT COUNT(DISTINCT cid)
FROM service
WHERE typ_veh = 'TWO WHEELER';

--Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.
SELECT DISTINCT sp.spname, sp.spunit
FROM sparepart sp
JOIN service s ON sp.spid = s.spid;

--Q.14 Customers who have Colored their vehicles.
SELECT DISTINCT c.cname
FROM custom c JOIN service s ON c.cid = s.cid
WHERE s.typ_ser = 'COLOR';

--Q.15 Find the annual income of each employee inclusive of Commission
SELECT 
    emp_id,
    emp_name,
    (salary * 12) + NVL(comm, 0) AS annual_income
FROM employee_table;

--Q.16 Vendor Names who provides the engine oil.-
SELECT DISTINCT v.vname
FROM vendors v
JOIN purchase p ON v.vid = p.vid
JOIN sparepart sp ON p.spid = sp.spid
WHERE sp.spname LIKE '%ENGINE OIL%';

--Q.17 Total Cost to purchase the Color and name the color purchased.
SELECT 
    sp.spname AS color_name,
    SUM(p.pqty * p.prate) AS total_cost
FROM purchase p
JOIN sparepart sp
ON p.spid = sp.spid
WHERE sp.sptype = 'COLOR'
GROUP BY sp.spname;

--Q.18 Purchased Items which are not used in "Ser_det".
SELECT DISTINCT sp.spid, sp.spname
FROM purchase p
JOIN sparepart sp
ON p.spid = sp.spid
WHERE sp.spid NOT IN (
    SELECT sd.spid
    FROM ser_det sd
);

--Q.19 Spare Parts Not Purchased but existing in Sparepart
SELECT spname
FROM sparepart
WHERE spid NOT IN (SELECT spid FROM purchase);

 
--Q.21 Specify the names of customers who have serviced their vehicles more than one time.
SELECT c.cname
FROM custom c JOIN service s ON c.cid = s.cid
GROUP BY c.cname
HAVING COUNT(*) > 1;

--Q.22 List the Items purchased from vendors locationwise.
SELECT v.vadd, sp.spname
FROM purchase p
JOIN vendors v ON p.vid = v.vid
JOIN sparepart sp ON p.spid = sp.spid;

--Q.23 Display count of two wheeler and four wheeler from ser_details
SELECT typ_veh, COUNT(*) count
FROM service
GROUP BY typ_veh;

--Q24 Display name of customers who paid highest SPGST and for which item 
SELECT c.cname,
       s.spname,
       se.sp_gst
FROM service se
JOIN custom c   ON se.cid = c.cid
JOIN sparepart s ON se.spid = s.spid
WHERE se.sp_gst = (SELECT MAX(sp_gst) FROM service);

--Q25 Display vendors name who have charged highest SPGST rate  for which item
SELECT v.vname,
       s.spname,
       p.spgst
FROM purchase p
JOIN vendors v   ON p.vid = v.vid
JOIN sparepart s ON p.spid = s.spid
WHERE p.spgst = (SELECT MAX(spgst) FROM purchase);

--Q26   list name of item and employee name who have received item 
SELECT DISTINCT s.spname,
       e.ename
FROM purchase p
JOIN sparepart s      ON p.spid = s.spid
JOIN employee_table e ON p.rcv_eid = e.eid;

 --Q27 Display the Name and Vehicle Number of Customer who serviced his vehicle, 
 --And Name the Item used for Service, And specify the purchase date of that Item with his vendor 
 --and Item Unit and Location, And employee Name who serviced the vehicle. for Vehicle NUMBER "MH-14PA335".'

SELECT c.cname,
       se.veh_no,
       sp.spname,
       p.pdate,
       v.vname,
       sp.spunit,
       v.vadd,
       e.ename
FROM service se
JOIN custom c         ON se.cid = c.cid
JOIN sparepart sp     ON se.spid = sp.spid
JOIN purchase p       ON se.spid = p.spid
JOIN vendors v        ON p.vid = v.vid
JOIN employee_table e ON se.eid = e.eid
WHERE se.veh_no = 'MH-14PA335';

--Q28 who belong this vehicle  MH-14PA335" Display the customer name 
SELECT c.cname
FROM custom c 
JOIN service s 
ON c.cid = s.cid
WHERE s.veh_no = 'MH-14PA335';

--Q29 Display the name of customer who belongs to New York and when he /she service their  vehicle on which date    
SELECT c.cname, s.ser_date
FROM custom c 
JOIN service s 
ON c.cid = s.cid
WHERE c.cadd = 'NEW YORK';

--Q 30 from whom we have purchased items having maximum cost?

--Q31 Display the names of employees who are not working as Mechanic and that employee done services   .

--Q.32 Display the various jobs along with total number of employees in each job. The output should contain only those jobs with more than two employees.
SELECT ejob, COUNT(*) total
FROM employee_table
GROUP BY ejob
HAVING COUNT(*) > 2;

--Q33 Display the details of employees who done service  and give them rank according to their no. of services .

--Q 34 Display those employees who are working as Painter and fitter and who provide service and total count of service done by fitter and painter  
SELECT ejob, COUNT(s.sid)
FROM employee_table e JOIN service s ON e.eid = s.eid
WHERE ejob IN ('PAINTER','FITTER')
GROUP BY ejob;

--Q35 Display employee salary and as per highest  salary provide Grade to employee 
SELECT ename, esal,
CASE
 WHEN esal >= 2000 THEN 'A'
 WHEN esal >= 1500 THEN 'B'
 WHEN esal >= 1000 THEN 'C'
 ELSE 'D'
END grade
FROM employee_table;

--Q36  display the 4th record of emp table without using group by and rowid
SELECT *
FROM (
  SELECT e.*, ROW_NUMBER() OVER (ORDER BY eid) rn
  FROM employee_table e
)
WHERE rn = 4;

--Q37 Provide a commission 100 to employees who are not earning any commission.
UPDATE service
SET comm = 100
WHERE comm = 0;

--Q38 write a query that totals no. of services  for each day and place the results in descending order
SELECT ser_date, COUNT(*) total
FROM service
GROUP BY ser_date
ORDER BY total DESC;

--Q39 Display the service details of those customer who belong from same city 

--Q40 write a query join customers table to itself to find all pairs of customers service by a single employee

--Q41 List each service number follow by name of the customer who made  that service
SELECT s.sid, c.cname
FROM service s JOIN custom c ON s.cid = c.cid;

--Q42 Write a query to get details of employee and provide rating on basis of  maximum services provide by employee  .Note (rating should be like A,B,C,D)
SELECT ename,
CASE
 WHEN cnt >= 5 THEN 'A'
 WHEN cnt >= 3 THEN 'B'
 WHEN cnt >= 2 THEN 'C'
 ELSE 'D'
END rating
FROM (
  SELECT e.ename, COUNT(s.sid) cnt
  FROM employee_table e JOIN service s ON e.eid = s.eid
  GROUP BY e.ename
);

--Q43 Write a query to get maximum service amount of each customer with their customer details ?

--Q44 Get the details of customers with his total no of services ?
SELECT c.cname, COUNT(s.sid)
FROM custom c JOIN service s ON c.cid = s.cid
GROUP BY c.cname;

--Q45 From which location sparpart purchased  with highest cost ?

--Q46 Get the details of employee with their service details who has salary is null

--Q47 find the sum of purchase location wise 

--Q48 write a query sum of purchase amount in word location wise ?

--Q49 Has the customer who has spent the largest amount money has been give highest rating

--Q50 select the total amount in service for each customer for which the total is greater than the amount of the largest service amount in the table

--Q51  List the customer name and sparepart name used for their vehicle and  vehicle type
SELECT c.cname, sp.spname, s.typ_veh
FROM service s
JOIN custom c ON s.cid = c.cid
JOIN sparepart sp ON s.spid = sp.spid;

--Q52 Write a query to get spname ,ename,cname quantity ,rate ,service amount for record exist in service table 

--Q53 specify the vehicles owners who’s tube damaged.
SELECT DISTINCT c.cname
FROM service s JOIN custom c ON s.cid = c.cid
WHERE s.typ_ser LIKE '%TUBE%';

--Q.54 Specify the details who have taken full service.
SELECT * FROM service
WHERE typ_ser = 'FULL SERVICING';

--Q.55 Select the employees who have not worked yet and left the job.
SELECT * FROM employee_table
WHERE edol IS NOT NULL
AND eid NOT IN (SELECT eid FROM service);

--Q.56  Select employee who have worked first ever.
SELECT *
FROM employee_table
WHERE edoj = (SELECT MIN(edoj) FROM employee_table);

--Q.57 Display all records falling in odd date

--Q.58 Display all records falling in even date
SELECT * FROM service
WHERE MOD(TO_NUMBER(TO_CHAR(ser_date,'DD')),2)=0;

--Q.59 Display the vendors whose material is not yet used.

--Q.60 Difference between purchase date and used date of spare part.

 


