-- WINDOWS FUNCTION

SELECT *
FROM emp_demographics;
SELECT *
FROM emp_salary;

SELECT gender, AVG(salary) 
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

SELECT gender, AVG(salary) OVER()
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id;
-- GROUP BY gender

-- Now lets add aditional thing in this
SELECT dem.first_name,sal.last_name, AVG(salary) OVER(PARTITION BY gender)
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id;
-- *Here not any impact on gender column

-- Now lets try this exact thing in group by
SELECT dem.first_name, dem.last_name, gender, AVG(salary)
FROM emp_demographics dem
JOIN emp_salary sal 
    ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;
-- ** Basically in this when we adding the new columns they are breaks and gives us as different values

-- Now you see there is every avg value is completly different beoz-we'r using GROUP BY
-- first_name , last_name we are breaking everything out based of the unique value

-- And here it's completly independent of what's going on in these other
-- columns all


SELECT dem.first_name,sal.last_name, gender,
SUM(salary) OVER(PARTITION BY gender) sum,
COUNT(salary) OVER(PARTITION BY gender) count
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id;
    
    
-- basically we are addign the rolling_Total which means basically they add its self again once and again
SELECT dem.first_name,sal.last_name, gender,salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id;

    
SELECT dem.employee_id, dem.first_name,sal.last_name, gender,salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total,
ROW_NUMBER() OVER() ##It is basically used to calculate the number of number of rows
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id;

-- If we add the partication by gender look what happen
SELECT dem.employee_id, dem.first_name,sal.last_name, gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) # Basically they first count the Female's and than count again the Male's with no 1,2,3,4
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id;
-- Order by is used to see the salary DESC


-- let's compare this to rank
SELECT dem.employee_id, dem.first_name,sal.last_name, gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_Num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id;
## notice rank repeats on tom ad jerry at 5, but then skips 6 and go to 7 -- this goes based off positional rank


SELECT dem.employee_id, dem.first_name,sal.last_name, gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_Num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id;
    
-- let's compare this to dense rank
SELECT dem.employee_id, dem.first_name,sal.last_name, gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_Num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Ranks ,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Dens_Rank
FROM emp_demographics dem
JOIN emp_salary sal 
	ON dem.employee_id = sal.employee_id;
# Here you se that it is also giving the same value on same salary
#  **BUT it is not skip the numbers sequence
