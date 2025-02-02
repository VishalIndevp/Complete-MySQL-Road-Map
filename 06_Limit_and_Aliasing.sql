select *
FROM emp_salary;
-- **Invalid use of group function
SELECT gender, AVG(age)
FROM emp_demographics
WHERE AVG(age) >40
GROUP BY gender;


-- Right way of froup function
SELECT gender, AVG(age)
FROM emp_demographics
GROUP BY gender
HAVING AVG(age)>40;


-- How you can use both in one query
SELECT occupation , AVG(salary)
FROM emp_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary)>75000;


SELECT gender, AVG(age) AS AVG_age  #AS is used to set the name 
FROM employee_demographics
GROUP BY gender
HAVING AVG_age > 40
;

-- LIMIT and ALIASING

-- Limit is just going to specify how many rows you want in the output
SELECT *
FROM emp_demographics
LIMIT 4;

-- if we change something like the order or use a group by it would change the output
SELECT *
FROM emp_demographics
ORDER BY first_name DESC
LIMIT 3;

-- this now says start at position 3 and take 2 rows after that
-- this is not used a lot in my opinion
SELECT *
FROM emp_demographics
ORDER BY first_name DESC
LIMIT 3,5;


-- ALIASING=
-- aliasing is just a way to change the name of the column (for the most part)
-- it can also be used in joins, but we will look at that in the intermediate series

SELECT gender, AVG(age)
FROM emp_demographics
GROUP BY gender
;

-- we can use the keyword AS to specify we are using an Alias
SELECT gender, AVG(age) AS Avg_age
FROM emp_demographics
GROUP BY gender
;
-- *we don't need it, but it's more explicit which I usually like