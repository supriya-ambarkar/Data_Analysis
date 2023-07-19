--17 DEC 2022

CREATE OR REPLACE TABLE AGENTS
   (	
     AGENT_CODE CHAR(6) NOT NULL PRIMARY KEY, 
	 AGENT_NAME CHAR(40) , 
	 WORKING_AREA CHAR(35), 
	 COMMISSION NUMBER(10,2) DEFAULT 0.05, 
	 PHONE_NO CHAR(15), 
	 COUNTRY VARCHAR2(25) 
	 );

INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore',0.15,'077-25814763', '');
INSERT INTO AGENTS(AGENT_CODE,AGENT_NAME,WORKING_AREA) 
VALUES ('A110', 'Anand', 'Germany');


INSERT INTO AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
INSERT INTO AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
INSERT INTO AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
INSERT INTO AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');

SELECT * FROM AGENTS;

--SET THE COUNTRY TO 'IN' WHEREEVER COUNTRY IS NULL OR BLANK
UPDATE AGENTS 
SET COUNTRY = 'IN' WHERE COUNTRY IS NULL OR COUNTRY = '';

--Example:
--SELECT SUBSTRING('TEXT',START,END);
--SYNTAX:

SELECT SUBSTRING('AMBARKAR SUPRIYA',1,9) AS NAME;

SELECT SUBSTRING('AMBARKAR SUPRIYA',1,41) AS NAME;

SELECT SUBSTR('AMBARKAR SUPRIYA',1,9) AS NAME;
SELECT SUBSTR('AMBARKAR SUPRIYA',0,9) AS NAME;

SELECT SUBSTRING('AMBARKAR SUPRIYA',-10,8) AS NAME; --START FROM INDEX -10  AND GIVE NEXT 8 CHARACTERS FROM THAT

SELECT SUBSTRING('AMBARKAR SUPRIYA',-11,-9) AS NAME; -- NO OUTPUUT

SELECT AGENT_CODE,SUBSTRING(AGENT_CODE,2,4) AS SUB_CODE from AGENTS;

-- TO RETURN LENGTH OF STRING
SELECT LEN('SIPPI') AS MY_NAME_LENGTH;

-- TO TRIM SPACE WE USE THE FUNCTION AS TRIM()

SELECT TRIM('      SIPPI        MN   ');

SELECT CONCAT(SUBSTRING('ANAND KUMAR JHA',1,1),SUBSTRING('ANAND KUMAR JHA',7,1),SUBSTRING('ANAND KUMAR JHA',13,1)) AS INTIAL;
-- OR 

SELECT SUBSTRING('ANAND KUMAR JHA',1,1) || SUBSTRING('ANAND KUMAR JHA',13,1);

-- TO CONCATINATE THE RECORDS:

SELECT AGENT_CODE || ' ' || AGENT_NAME || ' '|| PHONE_NO as AGENT_DETAILS
FROM AGENTS;

--CREATING NJ CONSUMER COMPLAINTS TABLE


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
-----

SELECT * FROM NJ_CONSUMER_COMPLAINTS;

SELECT STATE_NAME || '-'|| ZIP_CODE  AS STATE_DETAILS
FROM NJ_CONSUMER_COMPLAINTS;

CREATE OR REPLACE VIEW NJ_CONSUMER_COMPLAINTS_VIEW AS
SELECT DATE_RECEIVED,PRODUCT_NAME,SUB_PRODUCT,ISSUE,COMPANY,
SUBMITTED_VIA,DATE_SENT_TO_COMPANY,TIMELY_RESPONSE,CONSUMER_DISPUTED,COMPLAINT_ID,
STATE_NAME || '-'|| ZIP_CODE AS STATE_DETAILS
FROM NJ_CONSUMER_COMPLAINTS;

SELECT * FROM NJ_CONSUMER_COMPLAINTS_VIEW;

CREATE OR REPLACE VIEW NJ_CONSUMER_COMPLAINTS_VIEW AS
SELECT *,STATE_NAME || '-'|| ZIP_CODE AS STATE_DETAILS
FROM NJ_CONSUMER_COMPLAINTS
WHERE SUB_ISSUE IS NOT NULL OR CONSUMER_COMPLAINT_NARRATIVE IS NOT NULL OR COMPANY_PUBLIC_RESPONSE IS NOT NULL OR SUB_PRODUCT IS NOT NULL
OR COMPANY_PUBLIC_RESPONSE IS NOT NULL OR CONSUMER_COMPLAINT_NARRATIVE IS NOT NULL;


SELECT * FROM NJ_CONSUMER_COMPLAINTS_VIEW;



--CAST
SELECT CAST('11.2345' AS DECIMAL(6,1));

SELECT '1.6785' :: DECIMAL(4,3);

SELECT TRY_CAST('2021-1-11' AS TIMESTAMP);

--trim -- MOSTLY USED FOR STRINGS,NOT FOR NUMBERS AS IT GETS AMBIGUITY..

select trim('**afnmdk-ejhfj0900=','**=-') as trimed_string;

select ltrim('**afnmdkejhfj0900=','**=-') as trimed_string;

select rtrim('**afnmdkejhfj0900=','**=-') as trimed_string;


--reverse:
select reverse('suppy');



--18 DEC 2022

--SPLIT

SELECT SPLIT('128.789.18.73','.');
--IF NO SPLIT SEPEARTOR IS GIVEN IT RETURNS AS IT IS.. SAME AS ORIGINAL STRING

SELECT SPLIT('|A||','|');

create or replace table persons(
  name varchar(10),
  children varchar(50)
);

select * from persons;

insert into persons 
values('Mark','Marky,Mark jr,Maria'),('John','Johny,jane');


select name, c.value::string as childern 
from persons,
    lateral flatten(input=>split(children,',')) c;
    
--lateral flatten do-- result of split to generate multiple records from single string.
-- it takes variant, object, or array

select split_part('childe.n','.',2); --split_part is the function which returns null if no split string is mentioned.
--here 2 is index value . After splitting the second value is returned.
select split_part('childe.n',' ',2);
-- if no split value is given it returns null.
--Index value always starts from 0. But in snowflake it is considered as 0 or 1,it is treated as same. 

Select split_part('11.22.33','.',1) as first_part,
       split_part('11.22.33','.',2) as second_part,
       split_part('11.22.33','.',3) as third_part;
       
--LOWER & UPPER: Converts all the data into upper or lower
select lower('India is my country') as lower_string;
select upper('India is my country') as upper_string;

select upper(concat(substring('suppy like lolipop',1,2),
                   substring('suppy like lolipop',7,2),
                   substring('suppy like lolipop',12,2)));
                   
                   
--INITCAP :: Returns the input string with first letter of each word in upper case and subsequent letters in lower case

select initcap('supriya is A girl','i') as Intial_Caps;  -- here 'i' is delimiter

--REPLACE: used for replacement

select replace('     supriya       ',' ','*'); -- to remove spaces we have 4 methods trim,ltrim,rtrim and replace

select replace('abcd','bc'); -- no replacement value is given so we get null ans bc is replaced with null

create or replace table replace_example(
  subject varchar(10), 
  pattern varchar(10), 
  replacement varchar(10));
insert into replace_example 
values('snowman', 'snow', 'fire'), 
('sad face', 'sad', 'happy');

select * from replace_example;
select subject, pattern, replacement, 
replace(subject, pattern, replacement) as new 
from replace_example;

--starts with: returns true if exp 1 starts with expr 2

select * from NJ_CONSUMER_COMPLAINTS 
WHERE STARTSWITH(PRODUCT_NAME,'Bank');

--ends with
select * from NJ_CONSUMER_COMPLAINTS 
WHERE ENDSWITH(PRODUCT_NAME,'Loan');

-- SAME AS LIKE
select * from NJ_CONSUMER_COMPLAINTS 
WHERE PRODUCT_NAME like 'Bank%';

--CONTAINS: Same as like or starts with
select * from NJ_CONSUMER_COMPLAINTS 
WHERE  contains(PRODUCT_NAME ,'Bank');

--right
-- syntax is ->   right(<expr>,<len_Expr>)

--same as left,substring,substr same as trim
select right('ABCSD',2);
SELECT LEFT('ABCSD',2);


--COLLATE FUNCTION -- mot mostly used::

create table collation1 (v varchar collate 'sp');
insert into collation1 (v) values ('ñ');

select v,
       collation(v),
       collate(v, 'sp-upper'),
       collation(collate(v, 'sp-upper'))
    from collation1;


--NVL:: TO replace null with 0 we use this nvl function
--if my first expr is null then it is replaced with expr 2 = use like if-else statement
select nvl('rice', 'bard') as col1, nvl(null, 'ghee') as col2;


--COALESCE: Returns the first non-NULL expression among its arguments, 
--or NULL if all its arguments are NULL.

select column1, column2, column3, 
coalesce(column1, column2, column3) as extracted_values
from (values
  ('1',    'anand',    '3'   ),
  (null, '2',    '3'   ),
  (null, null, '3'   ),
  (null, null, null),
  ('1',    null, '3'   ),
  ('1',    null, null),
  ('1',    '2',    null)
) v;
-- real usecase of coalesce is firstname,middlename and lastname its used


--====================================
/* IMP FOR INTERVIEW:: 

Difference between nvl ans coalesce is 
-nvl takes only 2 arguments whereas coalesce takes n no.of arguments
-nvl takes replacment 2nd argument when first argument is null , coalesce takes the first not null value.

