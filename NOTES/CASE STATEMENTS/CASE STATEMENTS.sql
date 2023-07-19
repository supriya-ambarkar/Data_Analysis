-- 4 DEC 2022

CREATE or replace table NJ_CONSUMER_COMPLAINTS
(    DATE_RECEIVED VARCHAR(1000),
     PRODUCT_NAME VARCHAR2(1000),
     SUB_PRODUCT VARCHAR2(1000),
     ISSUE VARCHAR2(1000),
     SUB_ISSUE VARCHAR2(10000),
     CONSUMER_COMPLAINT_NARRATIVE VARCHAR(10000),
     Company_Public_Response VARCHAR(10000),
     Company VARCHAR(100),
     State_Name CHAR(4),
     Zip_Code VARCHAR(100),
     Tags VARCHAR(40),
     Consumer_Consent_Provided CHAR(25),
     Submitted_via VARCHAR(100),
     Date_Sent_to_Company VARCHAR(100),
     Company_Response_to_Consumer VARCHAR(10000),
     Timely_Response CHAR(4),
     CONSUMER_DISPUTED CHAR(4),
     COMPLAINT_ID NUMBER(12,0) NOT NULL PRIMARY KEY
);

SELECT * FROM NJ_CONSUMER_COMPLAINTS;

DESCRIBE TABLE NJ_CONSUMER_COMPLAINTS;

SELECT DATE_RECEIVED, PRODUCT_NAME ,SUB_PRODUCT,ISSUE,
        CASE WHEN SUBMITTED_VIA IN ('Referral','Postal Mail','Email') THEN 'Outbound'
             WHEN SUBMITTED_VIA IN ('Phone','Web') THEN 'Inbound'
             ELSE 'Electronics'
         END AS Submission_Type,
         
         COMPANY,STATE_NAME,ZIP_CODE
         
FROM NJ_CONSUMER_COMPLAINTS;

SELECT *,
               CASE 
	                WHEN LOWER(PRODUCT_NAME) LIKE '%loan' THEN 'Loan'
	                WHEN UPPER(PRODUCT_NAME) IN('BANK ACCOUNT OR SERVICE','MORTGAGE','DEBT CLLECTION','CREDIT CARD','CREDIT REPORTING','MONEY TRANSFERS') THEN 'Service'
	ELSE 'Other'
END AS FINANCE_TYPE
FROM NJ_CONSUMER_COMPLAINTS;


--ALL MODIFIED CODE FOR CASE STATEMNETS:

--CREATING A NEW VIEW AND DISPLAYING

CREATE OR REPLACE VIEW  NJ_COMPANY_RESPONSE_TO_CONSUMER AS
SELECT DATE_RECEIVED,PRODUCT_NAME,SUB_PRODUCT,ISSUE,COMPANY,STATE_NAME,ZIP_CODE,SUBMITTED_VIA,

         CASE WHEN SUBMITTED_VIA IN ('Referral','Postal Mail','Email') THEN 'Outbound'
              WHEN SUBMITTED_VIA IN ('Phone','Web') THEN 'Inbound'
             ELSE 'Electronics'
         END AS Submission_Type,
         
         case 
               when SUB_PRODUCT = 'I do not know' or SUB_PRODUCT is NULL THEN 'NA'
               when lower (SUB_PRODUCT) LIKE '%loan' THEN 'LOAN'
               when lower (SUB_PRODUCT) LIKE  '%card' THEN 'CARD'
               when lower (SUB_PRODUCT) LIKE '%mortgage' THEN 'MORTGAGE'
               ELSE SUB_PRODUCT
         END AS SUB_PRODUCT_TYPE,
         
         CASE 
             WHEN COMPANY_RESPONSE_TO_CONSUMER = 'Closed with explanation' THEN 'Explained'
             WHEN COMPANY_RESPONSE_TO_CONSUMER = 'Closed with monetary relief' THEN 'Monetary releif provided'
             WHEN COMPANY_RESPONSE_TO_CONSUMER LIKE '%Closed%' THEN 'Closed'
             ELSE COMPANY_RESPONSE_TO_CONSUMER
        END AS COMPANY_RESPONSE_CONSUMER_TYPE
        
FROM NJ_CONSUMER_COMPLAINTS;

SELECT * FROM NJ_COMPANY_RESPONSE_TO_CONSUMER;

---------------------------------------------------------------------------------