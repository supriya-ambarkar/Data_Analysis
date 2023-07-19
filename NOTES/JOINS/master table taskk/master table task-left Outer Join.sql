-- creating table AS_COMPLAIN

CREATE OR REPLACE TABLE AS_COMPLAIN
(
 ID	INT ,
 ComplainDate VARCHAR(10),
 CompletionDate	VARCHAR(10),
 CustomerID	INT,
 BrokerID	INT,
 ProductID	INT,
 ComplainPriorityID	INT,
 ComplainTypeID	INT,
 ComplainSourceID	INT,
 ComplainCategoryID	INT,
 ComplainStatusID	INT,
 AdministratorID	STRING,
 ClientSatisfaction	VARCHAR(20),
 ExpectedReimbursement INT
);

select * from AS_COMPLAIN;
select distinct * from AS_COMPLAIN;
---------------------------------------------------------
--creating table AS_CUSTOMER
CREATE OR REPLACE TABLE AS_CUSTOMER
(
CustomerID	INT,
LastName VARCHAR(60),
FirstName VARCHAR(60),
BirthDate VARCHAR(20) ,
Gender VARCHAR(20),
ParticipantType	VARCHAR(20),
RegionID	INT,
MaritalStatus VARCHAR(15));

select * from AS_CUSTOMER;

select distinct * from AS_CUSTOMER;
---------------------------------------------------------

CREATE OR REPLACE TABLE AS_BROKER
(
  BrokerID	INT,
  BrokerCode VARCHAR(70),
  BrokerFullName	VARCHAR(60),
  DistributionNetwork	VARCHAR(60),
  DistributionChannel	VARCHAR(60),
  CommissionScheme VARCHAR(50)

);

select * from AS_BROKER;

select distinct * from AS_BROKER;

---------------------------------------------------------

CREATE OR REPLACE TABLE AS_CATAGORIES
(
ID	INT,
Description_Categories VARCHAR2(200),
Active INT
);

select * from AS_CATAGORIES;
select distinct * from AS_CATAGORIES;

---------------------------------------------------------

CREATE OR REPLACE TABLE AS_PRIORITIES
(
ID	INT,
Description_Priorities VARCHAR(10)
);

select * from AS_PRIORITIES;
select distinct * from AS_PRIORITIES;


---------------------------------------------------------

CREATE OR REPLACE TABLE AS_PRODUCT
(
ProductID	INT,
ProductCategory	VARCHAR(60),
ProductSubCategory	VARCHAR(60),
Product VARCHAR(30)
);

select * from AS_PRODUCT;
select distinct * from AS_PRODUCT;

---------------------------------------------------------
CREATE OR REPLACE TABLE AS_REGION
(
  id INT,
  name	VARCHAR(50) ,
  county	VARCHAR(100),
  state_code	CHAR(5),
  state	VARCHAR (60),
  type	VARCHAR(50),
  latitude	NUMBER(11,4),
  longitude	NUMBER(11,4),
  area_code	INT,
  population	INT,
  Households	INT,
  median_income	INT,
  land_area	INT,
  water_area	INT,
  time_zone VARCHAR(70)
);

select * from AS_REGION;
select distinct * from AS_REGION;

---------------------------------------------------------

CREATE OR REPLACE TABLE AS_SOURCES
(
ID	INT,
Description_Source VARCHAR(20)
);

select * from AS_SOURCES;
select distinct * from AS_SOURCES;

---------------------------------------------------------

CREATE OR REPLACE TABLE AS_STATE_REGION
(
  State_Code VARCHAR(20),	
  State	 VARCHAR(20),
  Region VARCHAR(20)
);

SELECT * FROM AS_STATE_REGION;

SELECT DISTINCT * FROM AS_STATE_REGION;

---------------------------------------------------------

CREATE OR REPLACE TABLE AS_STATUSES
(
  ID	INT,
  Description_Status VARCHAR(40));
  
select * from AS_STATUSES;
SELECT DISTINCT * FROM AS_STATUSES;

---------------------------------------------------------
CREATE OR REPLACE TABLE AS_TYPE
(
  ID INT,
  Description_Type VARCHAR(20)
);

SELECT * FROM AS_TYPE;
SELECT DISTINCT * FROM AS_TYPE;

---------------------------------------------------------

CREATE OR REPLACE TABLE AS_STATUS_HISTORY_DATA
(
    ID INT,
    COMPLAINT_ID INT,
    ComplaintStatusID INT,
    StatusDate VARCHAR(15)
);

SELECT *  FROM AS_STATUS_HISTORY_DATA;

SELECT DISTINCT *  FROM AS_STATUS_HISTORY_DATA;

---------------------------------------------------------

CREATE OR REPLACE TABLE MASTER_TABLE_TASK AS
SELECT COM.ID,COM.ComplainDate,COM.CompletionDate,CUS.LastName,CUS.FirstName,
CUS.Gender,BRO.BrokerFullName,BRO.CommissionScheme,
CAT.Description_Categories,SR.Region,STAT.Description_Status,REG.state,PRO.Product,
PRIO.Description_Priorities,SOUR.Description_Source,TYPE.Description_Type
--COM.*,CUS.*,SH.*,REG.*,SR.*,BR.*,CAT.*,PRI.*,PR.*,SUR.*,ST.*,TY.*

FROM AS_COMPLAIN  COM
LEFT OUTER JOIN AS_CUSTOMER  CUS ON COM.CustomerID= CUS.CustomerID
LEFT OUTER JOIN AS_STATUS_HISTORY_DATA HIST ON COM.ID = HIST.ID
LEFT OUTER JOIN AS_REGION REG ON COM.id = REG.id
LEFT OUTER JOIN AS_STATE_REGION SR ON REG.state_code = SR.state_code
LEFT OUTER JOIN AS_BROKER  BRO ON COM.BrokerID = BRO.BrokerID
LEFT OUTER JOIN AS_CATAGORIES  CAT ON COM. ComplainCategoryID = CAT.ID
LEFT OUTER JOIN AS_PRIORITIES PRIO ON COM.ComplainPriorityID = PRIO.ID
LEFT OUTER JOIN AS_PRODUCT PRO ON COM.ProductID = PRO.ProductID
LEFT OUTER JOIN AS_SOURCES SOUR ON COM.ComplainSourceID = SOUR.ID
LEFT OUTER JOIN AS_STATUSES STAT ON COM.ComplainStatusID = STAT.ID
LEFT OUTER JOIN AS_TYPE TYPE ON COM.ComplainTypeID = TYPE.ID;

SELECT * FROM MASTER_TABLE_TASK;