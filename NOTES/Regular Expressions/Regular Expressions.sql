--jan 7 2023
/*
--REGULAR EXPRESSION:
1. Like operator:
		% (multiple characters)
		_ (single character)
		
2. Single Pattern Matching:
-- what if you need to find all words where every second character is a vowel?
Here like operator is not possible.
So, REGULAR EXPRESSION comes handyy

REGULAR EXPRESSION:
	-> It is method of describing both simple and complex patterns for searching and manipulating.
	-> It uses META characters for pattern matching(, . * /  @ any alphanumeric characters is META characters)
	-> Its oracle implementation
	-- Write the table of meta characters
*/
	
--JAN 7 & 8 2023(lab session)

/* 
REGEXP_COUNT: Returns the no.of times that a pattern occurs in a string
see the table of paraameter in documentation.

Parameters::

c - Enables case-sensitive matching.

i - Enables case-insensitive matching.
*/

select regexp_count('supppupup','up') as up_count 
from dual;  -- dual is dummy table

select regexp_count('It was the best of times, it was the worst of times', 'it',1,'i') as "result" 
from dual;

select regexp_count('abcbcbsjhfislkjfk','abc');
select regexp_count('abcabhudkjdjhbabc','[abc]'); -- calculates as list, it takes individual count, and output is 9
select regexp_count('abcabhudkjdjhbabc','[abc]{3}'); -- it takes the pair as 3 as abc and counts so output is 2
select regexp_count('abcdabcdabcdabcd','[abcd]{4}'); -- takes the pair of 4 

create or replace table overlap (id number, text string);
insert into overlap values (1,',abc,.def,ghi,jkl,');
insert into overlap values (2,',abc,,def,,ghi,,jkl,');

select * from overlap;

select id, regexp_count(text,'[[:punct:]][[:alnum:]]+[[:punct:]]', 1, 'i') from overlap;


/* 

REGEXP_REPLACE: Search and replace text using regular expression pattern


Returns the subject with the specified pattern (or all occurrences of the pattern) either removed or replaced by a replacement string. 
If no matches are found, returns the original subject.
*/

select regexp_replace('supriyaambarkar2002@gmail.com','@.*\\.(com)') as user_name;-- to get username from mail id


select regexp_replace('supriyaambarkar2002@gmail.com','@.*') as user_name;

select regexp_replace('supriyaambarkar2002@gmail.com',);

select regexp_replace('Customers - (NY)','\\(|\\)','') as customers; -- removes brackets

select trim(regexp_replace(string, '[a-z/-/A-Z/.]', '')) as date_value
from(select 'My dob is 08-09-2002' as string) a;

/* 
REGEXP_LIKE:

Returns true if the subject matches the specified pattern. Both inputs must be text expressions.
*/

create or replace table cities(city varchar(20));
insert into cities values
    ('Sacramento'),
    ('San Francisco'),
    ('San Jose'),
    (null);
    
select * from cities where regexp_like(city, 'san.*'); -- here san is not there as they r hvaing case sensitive.

select * from cities where regexp_like(city, 'san.*', 'i'); -- i represents case insensitive


/*
REGEXP_INSTR:

Returns the position of the specified occurrence of the regular expression pattern in the string subject. If no match is found, returns 0.
*/
CREATE TABLE demo1 (id INT, string1 VARCHAR);
INSERT INTO demo1 (id, string1) VALUES 
(1, 'nevermore1, nevermore2, nevermore3.');

select id, string1,
      --regexp_substr(string1, 'nevermore\\d') AS "SUBSTRING", 
      regexp_instr( string1, 'nevermore\\d') AS "POSITION"
    from demo1
    order by id;
    
    
