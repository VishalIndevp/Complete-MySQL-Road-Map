-- String Function
-- string is a sequence of characters, such as text or numbers, stored as data. 
-- Strings are used to store things like names, addresses, or any other textual information.
SELECT length("WWE");

SELECT first_name, LENGTH(first_name)
FROM emp_demographics
ORDER BY first_name ;

-- We can use UPPER & LOWER to determine our Strings
SELECT UPPER("WWE");
SELECT LOWER("WWE");

-- In this we are converting our first name into UPPER Case 
SELECT first_name, UPPER(first_name);


-- TRIM is used to cut our spaces or letters
-- Lets see an example -- Here you see before & after side of WWE we have many spaces lets TRIM now
SELECT ("             WWE      ");
 
-- if we simply write trim than TRIM GONA remove all the spaces
SELECT TRIM("             WWE      ");

-- supose i want to trimp my Left side of mine WWE space so we use
SELECT LTRIM("             WWE      ");

-- Exectly we have alternatice RTRIM to remove the right spaces
SELECT RTRIM("             WWE      ");



#Now we have Left. Left is going to allow us to take the amount of strings from the left hand side.
SELECT LEFT('Vishal', 4);

SELECT first_name, LEFT(first_name,4) 
FROM emp_demographics;

#Right is basically the opposite - taking it starting from the right side
SELECT RIGHT('Vishal', 3);

SELECT birth_date, SUBSTRING(birth_date, 1,4) AS BIRTH_YEAR
FROM emp_demographics;

SELECT 
    birth_date, 
    SUBSTRING(birth_date, 1, 4) AS BIRTH_YEAR, 
    SUBSTRING(birth_date, 6, 2) AS BIRTH_MONTH, 
    SUBSTRING(birth_date, 9,2) AS BIRTH_DAY
FROM emp_demographics;

-- Replace is used to replace the item 
SELECT first_name, REPLACE(first_name,"A","W")
FROM emp_demographics;

-- LOCATE is basically used to define in string where is this word
-- Lets have a look
SELECT LOCATE('h',"vishal");

#Now let's look at substring, this one I personally love and use a lot.
#Substring allows you to specify a starting point and how many characters you want in.
SELECT SUBSTRING('Alexander', 2, 3);


-- **** This is very important used very well
-- CONCAT is used to concatenation/combine the values
SELECT first_name,last_name,
CONCAT (first_name,' ' ,last_name) AS Full_Name
FROM emp_demographics;


FROM emp_demographics;