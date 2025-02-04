-- Joins

-- joins allow you to combine 2 tables together (or more) if they have a common column.
-- doesn't mean they need the same column name, but the data in it are the same and can be used to join the tables together
-- there are several joins we will look at today, inner joins, outer joins, and self joins


-- here are the first 2 tables - let's see what columns and data in the rows we have in common that we can join on
SELECT *
FROM emp_demographics;

SELECT *
FROM emp_salary;

-- let's start with an inner join -- inner joins return rows that are the same in both columns
-- By default lonely JOIN represent an INNER JOIN
SELECT *
FROM emp_demographics
INNER JOIN emp_salary
	ON employee_id = employee_id;
-- **notice isn't in the results? This is because he doesn't have an employee id in the demographics table. He refused to give his birth date or age or gender

SELECT *
FROM emp_demographics as dem
INNER JOIN emp_salary as sal
	ON dem.employee_id = sal.employee_id;
    

SELECT employee_id, age, occupation
FROM emp_demographics as dem
INNER JOIN emp_salary as sal
	ON dem.employee_id = sal.employee_id;
-- **notice isn't in the results? This is because he doesn't have in SELECT section employee id in the demographics table. He refused to give his birth date or age or gender

SELECT dem.employee_id, age, occupation # In this we are going to selecting the what specific column need to be showCase
FROM emp_demographics as dem
INNER JOIN emp_salary as sal
	ON dem.employee_id = sal.employee_id;
    
    

-- Outer Join=
-- We have a left join and we have a right join or a left outer and a right outer
-- LEFT JOIN= is going to take everything from the left table even if there is no match in the join 
-- 			and then it will only return the matches from the right table the exact opposite
SELECT *
FROM emp_demographics as dem
LEFT JOIN emp_salary as sal
	ON dem.employee_id = sal.employee_id;
-- so you'll notice we have everything from the left table or the salary table. Even though there is no match to ron swanson. 
-- Since there is not match on the right table it's just all Nulls


-- if we just switch this to a right join it basically just looks like an inner join
-- that's because we are taking everything from the demographics table and only matches from the left or salary table. Since they have all the matches
-- it looks kind of like an inner join
SELECT *
FROM emp_demographics as dem
RIGHT JOIN emp_salary as sal
	ON dem.employee_id = sal.employee_id;
    
    
    
-- Self Join=
-- a self join is where you tie a table to itself
SELECT *
FROM emp_salary emp1
JOIN emp_salary emp2
	ON emp1.employee_id +1 = emp2.employee_id ;
    
    
SELECT emp1.employee_id AS emp_heaven,
       emp1.first_name AS first_name_heaven,
       emp1.last_name AS last_name_heaven,
       emp2.employee_id AS emp_id,
       emp2.first_name AS first_name_emp,
       emp2.last_name AS last_name_emp
FROM emp_salary emp1
JOIN emp_salary emp2
    ON emp1.employee_id +1 = emp2.employee_id;
--    - So leslie is Ron's secret santa and so on -- Mark Brandanowitz didn't get a secret santa,
--  but he doesn't deserve one because he broke Ann's heart so it's all good 



-- Joining multiple tables

SELECT * FRoM departments;

    
SELECT *
FROM emp_demographics dem
INNER JOIN emp_salary sal
	ON dem.employee_id = sal.employee_id
INNER JOIN departments dept
	ON dept.department_id = sal.dept_id;


SELECT *
FROM emp_demographics as dem
RIGHT JOIN emp_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN departments AS pd
	ON sal.dept_id = pd.department_id
;
