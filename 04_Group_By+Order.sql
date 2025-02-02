-- The GROUP BY clause in MySQL is used to group rows that have the same values in specified columns into summary rows. 
-- It’s often used with aggregate functions like COUNT, SUM, AVG, etc., to perform
SELECT gender
FROM emp_demographics
GROUP BY gender;

SELECT gender, AVG (age)
FROM emp_demographics
GROUP BY gender;

-- **Notice there is only one office manager row
SELECT occupation
 FROM emp_salary
GROUP BY occupation;

-- Here comes the 2 office Manage because of we selected salary also and salary has Unique values
SELECT occupation , salary
 FROM emp_salary
GROUP BY occupation , salary;


SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM emp_demographics
GROUP BY gender;

SELECT *
FROM emp_demographics;

-- ORDER BY --
-- ORDER BY = is used to sort the result in either acending or decending order
SELECT *
FROM emp_demographics
ORDER BY first_name ASC;

SELECT *
FROM emp_demographics
ORDER BY first_name DESC;

SELECT *
FROM emp_demographics
ORDER BY gender, age DESC;