10 DEC 2022


Constraints:
-------------

-> UNIQUE,PRIMARY AND FOREIGN KEYS, AND NOT NULL COLUMNS

PRIMARY KEY -> Uniquely identifies the data and cannot be NULL

-you cannot have duplicate values
-but snowflake doesnot follow primary key i.e it allows duplicates also..
 in SQL it throws an  error

SUPPORTED CONSTRAINED TYPES :
---------------------------

-> UNIQUE
-> PRIMARY KEY
-> FOREIGN KEY
-> NOT NULL
------------------------------------------------

- A table can have multiple unique keys and only single primary key.
 

Table constraints::
---------------------

-> when u copy new table from already existing table, you will get all constraints(restrictions) on new table which are already existed in old table.

-----------------------------------------------------------------

-- CASE 1 : if you want to create a table structure like previously created table go with "like" command:

create or replace table new_table like old_table;


--CASE 2 : if you want to create a table structure like previously created along with data::

create or replace table new_tablename as 
select * from old_table;

--CASE 3 : if u want table structure and need only few  data :

CREATING CONSTRAINTS INLINE:
------------------------------

Alter:: to change structure of datta we use alter command:
 alter table <table_name> add column <column_name> <column_type>
 
 
 
-drop primary key from table in snowflake:

alter table table_name
drop primary key;


-- to see code what is used 

select get_ddl('table', 'table_name');

update: used to update the table:
-------

update table_name
set age = 35 where name is NULL;

