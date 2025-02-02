-- Having vs Where
-- Both were created to filter rows of data, but they filter 2 separate things
-- Where is going to filters rows based off columns of data
-- Having is going to filter rows based off aggregated columns when grouped

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


SELECT gender, AVG(age) AS AVG_age
FROM employee_demographics
GROUP BY gender
HAVING AVG_age > 40
;
