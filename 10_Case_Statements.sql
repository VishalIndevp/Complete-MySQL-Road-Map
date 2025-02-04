-- Case Statements
-- A Case Statement allows you to add logic to your Select Statement, sort of like an if else statement in other programming languages or even things like Excel


SELECT * FROM emp_demographics;


SELECT first_name, last_name,
CASE
	WHEN age <=30 THEN "Young" 
    WHEN age BETWEEN 31 AND 50 THEN "Old"
    WHEN age >=50 THEN "You are very old"
END AS Type
FROM emp_demographics;


-- Pawnee Council sent out a memo of their bonus and pay increase structure so we need to follow it
-- Basically if they make--
-- Pay Increase and Bonusl
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus
SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary * 0.7
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary *.10
END AS Bonus
FROM emp_salary;



-- Checking our wher is finance department
SELECT * FROM departments;
SELECT * FROM emp_salary;