/*

TYPES OF JOINS:
---------------

1. Inner joins  --**
    - Natural joins --**
2. Left(Outer) join  -- **
3. right(outer) join -- hardly used
4. (full) outer join --**
5. left(outer) join excluding inner join --**
6. right(outer) join excluding inner join --**
7. (full) outer join excluding inner join --**
8. cross join --**
9. Equi join
10. Self join --**

Inner - join :: produces only a set of records that match in both Table A and Table B

select x.pk,x.value,y.value
from tableA as x
INNER JOIN tableB as y
ON x.pk = y.pk  -- ON is the condition;; pk has column name


If the column name is not repeated then you no need to use alias name;
ifyou have same column names in different tables u must use aliasing.
*/

CREATE OR REPLACE TABLE COWS_ONE(
        CNUMBER_1 INT,
        CBREED VARCHAR(20));

INSERT INTO COWS_ONE VALUES(1,'Holstein'),
                            (2,'Guernsey'),
                            (3,'Angus');

SELECT * FROM COWS_ONE;


CREATE OR REPLACE TABLE COWS_TWO(
        CNUMBER_2 INT,
        CBREED VARCHAR(20));
INSERT INTO  COWS_TWO VALUES(2,'Jersy'),
                            (3,'Brown Swiss'),
                            (4,'Aryshire');

SELECT * FROM COWS_TWO;

-- INNER JOIN OR JOIN

SELECT X.CNUMBER_1,X.CBREED,Y.CBREED
FROM COWS_ONE AS X 
INNER JOIN COWS_TWO AS Y
ON X.CNUMBER_1 = Y.CNUMBER_2;

-- OR 

SELECT X.*,Y.CBREED
FROM COWS_ONE AS X 
INNER JOIN COWS_TWO AS Y
ON X.CNUMBER_1 = Y.CNUMBER_2;


CREATE OR REPLACE TABLE AS_OWNER
(
   OwnerID INTEGER NOT NULL PRIMARY KEY ,
   Name VARCHAR2(20),
   Surname STRING,
   StreetAddress VARCHAR2(50),
   City STRING,
   State CHAR(4),
   StateFull STRING,
   ZipCode INTEGER
);

CREATE OR REPLACE TABLE AS_PETS
(
    PetID VARCHAR(10) NOT NULL PRIMARY KEY,
    Name VARCHAR(20),
    Kind STRING,
    Gender CHAR(7),
    Age INTEGER,
    OwnerID INTEGER NOT NULL REFERENCES AS_OWNER 
);

-- HERE OWNERID IS AN FOREIGN KEY


--FOREGIN KEY IS ALSO AN PRIMARY KEY BT LINKS THE ANOTHER TABLE  CALLED REFERENTIAL INTEGRITY.
-- COLUMN NAME DATATYPE REFERENCES TABLE_NAME

select * from AS_OWNER;

select * from AS_PETS;

--Create a Master TAble --means all the columns from both tables should come by removing duplicate values

CREATE OR REPLACE TABLE AS_OWNER_PETS AS
SELECT o.OwnerID,o.Name as Owner_name,p.PetID,p.Name as pet_name,Kind,Gender,Age,Surname,City,State,ZipCode
FROM AS_OWNER AS o
JOIN AS_PETS AS p
ON o.OwnerID = p.OwnerID;

SELECT * FROM AS_OWNER_PETS;


/*
2. LEFT OUTER JOIN::

The table which has maximum records will considered as left side table.

*/

CREATE OR REPLACE TABLE AS_OWNER_PETS AS
SELECT o.OwnerID,o.Name as Owner_name,p.PetID,p.Name as pet_name,Kind,Gender,Age,Surname,City,State,ZipCode
FROM AS_OWNER AS o
LEFT OUTER JOIN AS_PETS AS p
ON o.OwnerID = p.OwnerID;


--CREATE OR REPLACE TABLE COWS_ONE_TWO
SELECT CNUMBER_1,O.CBREED AS ONE_CBREED,T.CBREED AS TWO_CBREED,CNUMBER_2
FROM COWS_ONE AS O
LEFT OUTER JOIN COWS_TWO AS T
ON O.CNUMBER_1 = T.CNUMBER_2;
