SELECT * FROM emp_demographics;


SELECT * FROM emp_demographics
WHERE first_name = "Leslie";


SELECT * FROM emp_demographics
WHERE age >40;

SELECT * FROM emp_demographics
WHERE age >=40;

SELECT * FROM emp_demographics
WHERE age <40;

SELECT * FROM emp_demographics
WHERE age <=40;

SELECT * FROM emp_demographics
WHERE gender = "male";

SELECT * FROM emp_demographics
WHERE gender != "male";

-- AND OR NOT -- Logical Operators
SELECT * FROM emp_demographics
WHERE gender > "1985-01-01"
AND gender = 'male';

SELECT * FROM emp_demographics
WHERE gender > "1985-01-01"
OR gender = 'male';

SELECT * FROM emp_demographics
WHERE gender > "1985-01-01"
OR NOT gender = 'male';


SELECT * FROM emp_demographics
WHERE first_name = 'Leslie' AND  age =44;

SELECT * FROM emp_demographics
WHERE (first_name = 'Leslie' AND  age =44) OR age >55;


-- LIKE Statement
-- %  and _
-- % = means anything 
-- _ = Specific value
SELECT * FROM emp_demographics
WHERE first_name LIKE 'a%';

SELECT * FROM emp_demographics
WHERE first_name LIKE '%a%';

SELECT * FROM emp_demographics
WHERE first_name LIKE 'a___';

SELECT * FROM emp_demographics
WHERE first_name LIKE 'a__%';

SELECT * FROM emp_demographics
WHERE first_name LIKE 'a___';

SELECT * FROM emp_demographics
