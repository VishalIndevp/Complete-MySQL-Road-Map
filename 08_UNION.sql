#UNIONS


#A union is how you can combine rows together- not columns like we have been doing with joins where one column is put next to another
#Joins allow you to combine the rows of data

SELECT age AS AGE , gender
FROM emp_demographics
UNION
SELECT first_name , last_name
FROM emp_salary;

-- notice it gets rid of duplicates? Union is actually shorthand for Union Distinct

SELECT first_name, last_name
FROM emp_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM emp_salary;

-- we can use UNION ALL to show all values
SELECT first_name, last_name
FROM emp_demographics
UNION ALL
SELECT first_name, last_name
FROM emp_salary;


-- Lets see use case
-- department is trying to cut their budget and wants to identify older employees they can push out or 
-- high paid employees who they can reduce pay or push out
-- let's create some queries to help with this

SELECT first_name , last_name ,'Old'
FROM emp_demographics
WHERE age >50;

SELECT first_name , last_name ,"Old" AS Label
FROM emp_demographics
WHERE age >50
UNION
SELECT first_name , last_name , "High Paid Emp"
FROM emp_salary
WHERE salary >70000 ;


SELECT first_name , last_name ,"Old Male" AS Label
FROM emp_demographics
WHERE age >40 AND gender = 'Male'
UNION
SELECT first_name , last_name ,"Old Female" AS Label
FROM emp_demographics
WHERE age >40 AND gender = 'Female'
UNION
SELECT first_name , last_name , "High Paid Emp"
FROM emp_salary
WHERE salary >70000
ORDER BY first_name, last_name
;


SELECT *
FROM emp_salary;

SELECT * 
FROM emp_demographics;

