# Subqueries
#So subqueries are queries within queries. Let's see how this looks.
SELECT *
FROM departments;

SELECT *
FROM emp_salary;

SELECT *
FROM emp_demographics;

#Now let's say we wanted to look at employees who actually work in the Parks and Rec Department, we could join tables together or we could use a subquery
#We can do that like this:
SELECT *
FROM emp_demographics
WHERE employee_id IN
					(SELECT employee_id
						FROM emp_salary
                        WHERE dept_id = 1);
               
               
SELECT first_name, salary,
(SELECT AVG(salary)
FROM emp_salary)
FROM emp_salary;

SELECT gender, AVG(age), MAX(age), COUNT(age), COUNT(age)
FROM emp_demographics
GROUP BY gender;


SELECT *
FROM (SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM empl_demographics
GROUP BY gender) 
;
-- now this doesn't work because we get an error saying we have to name it

SELECT *
FROM
(SELECT gender,AVG(age), MIN(age), MAX(age), COUNT(age)
FROM emp_demographics
GROUP BY gender) AS AGG_TABLE
;


SELECT AVG(avg_age)
FROM
(SELECT gender,AVG(age) AS avg_age, MAX(age) AS max_age,  MIN(age) AS min_age, COUNT(age) AS count_age
FROM emp_demographics
GROUP BY gender) AS AGG_TABLE
;