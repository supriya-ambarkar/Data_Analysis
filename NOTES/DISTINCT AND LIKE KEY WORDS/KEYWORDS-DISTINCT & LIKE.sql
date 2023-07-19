--03-12-2022

--TO SELECT THE UNIQUE ELEMENTS FROM TABLE WE USE DISTINCT KEYWORD


SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS;

SELECT DISTINCT PRODUCT_NAME FROM NJ_CONSUMER_COMPLAINTS;

SELECT DISTINCT ISSUE FROM NJ_CONSUMER_COMPLAINTS;


--LIKE KEYWORD:"SAMPLE_DATABASE"."PUBLIC"

SELECT DISTINCT * FROM NJ_CONSUMER_COMPLAINTS 
WHERE SUB_PRODUCT LIKE 'Checking%';

SELECT DISTINCT SUB_PRODUCT FROM NJ_CONSUMER_COMPLAINTS 
WHERE SUB_PRODUCT LIKE 'Check%';

create or replace table like_ex(subject varchar(20));
insert into like_ex values
    ('John  Dddoe'),
    ('Joe   Doe'),
    ('John_down'),
    ('Joe down'),
    ('Elaine'),
    (''),    -- empty string
    (null);

SELECT * FROM like_ex;
select subject from like_ex where subject like '%Jo%oe%' ;
--order by subject;

