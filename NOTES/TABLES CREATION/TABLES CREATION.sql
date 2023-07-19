--20 NOV 2022

create table employee(EMP_ID INTEGER,EMP_NAME VARCHAR(20),SALARY INT);
INSERT INTO employee VALUES(101,'SUPRIYA',20000);
INSERT INTO employee VALUES(102,'SHABARISH',3000);
SELECT * FROM EMPLOYEE;
DESCRIBE table employee;

SELECT * FROM "SAMPLE_DATABASE"."PUBLIC"."EMPLOYEE";"SAMPLE_DATABASE"."PUBLIC";

--------------------------------------------------------------------------


CREATE or replace table NJ_CONSUMER_COMPLAINTS
(    DATE_RECEIVED STRING,
     PRODUCT_NAME VARCHAR2(50),
     SUB_PRODUCT VARCHAR2(100),
     ISSUE VARCHAR2(100),
     SUB_ISSUE VARCHAR2(100),
     CONSUMER_COMPLAINT_NARRATIVE string,
     Company_Public_Response STRING,
     Company VARCHAR(100),
     State_Name CHAR(4),
     Zip_Code string,
     Tags VARCHAR(40),
     Consumer_Consent_Provided CHAR(25),
     Submitted_via STRING,
     Date_Sent_to_Company STRING,
     Company_Response_to_Consumer VARCHAR(40),
     Timely_Response CHAR(4),
     CONSUMER_DISPUTED CHAR(4),
     COMPLAINT_ID NUMBER(12,0) NOT NULL PRIMARY KEY
);

SELECT * FROM NJ_CONSUMER_COMPLAINTS;

DESCRIBE TABLE NJ_CONSUMER_COMPLAINTS;

---------------------------------------------------------------------

CREATE OR REPLACE TABLE COUNTRIES (COUNTRYID INTEGER, 
                                   COUNTRYNAME VARCHAR(20), 
                                   COUNTRYNAME_LOCAL VARCHAR(20),
                                   COUNTRYFLAGURL VARCHAR(100));
                                   
SELECT * FROM  COUNTRIES;

---------------------------------------------------------------------------

CREATE or REPLACE TABLE NY_PROPERTY_SALES(
 ID INTEGER, 
 AREA VARCHAR(100), 
 NEIGHBORHOOD VARCHAR(100),
 BuildingClassCategory VARCHAR (100),
 ADDRESS VARCHAR (100),
 ZIPCode INTEGER, 
 LandSquareFeet VARCHAR(50),
 GrossSquareFeet VARCHAR(50), 
 YearBuilt INTEGER, 
 SalesDate VARCHAR(20), 
 SalesPrice VARCHAR(50));
 
 DESCRIBE TABLE NY_PROPERTY_SALES;
 SELECT * FROM NY_PROPERTY_SALES;
 

----------------------------------------------------------------------------------



CREATE OR REPLACE TABLE KEYSALESDATA
(CLIENTID INTEGER,
CLIENTNAME VARCHAR (100),
ADDRESS1 STRING, 
ADDRESS2 STRING,
TOWN STRING, 
COUNTY STRING,
POSTCODE STRING,
POSTCODE2 VARCHAR (100),
OUTERPOSTODE VARCHAR (100), 
COUNTRYID INTEGER,
CLIENTTYPE VARCHAR (100), 
CLIENTSIZE VARCHAR (100),
CLIENTSINCE VARCHAR (100), 
ISCREDITWORTHY INTEGER,
ISDEALER INTEGER);

SELECT * FROM KEYSALESDATA;
                   
DESCRIBE TABLE KEYSALESDATA;

---------------------------------------------------

CREATE OR REPLACE TABLE STORE_CITIES
(STORE_ID VARCHAR (100),
STORETYPE_ID VARCHAR (100), 
STORE_SIZE VARCHAR (100),
CITY_ID VARCHAR (100), 
state_state_abr_city VARCHAR (100), 
lat_Long VARCHAR(100));

SELECT * FROM STORE_CITIES;

------------------------------------------------------

