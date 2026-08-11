USE employees;
 
/*
Find the current salary of each employee, returning:
- emp_no
- first_name
- last_name
- salary
Then, display only those employees whose current salary is above 80% of the maximum current salary in the company.
*/

WITH salary_comparison AS (
	SELECT
		e.emp_no,
		e.first_name,
		e.last_name,
		s.salary,
		MAX(s.salary) OVER () as max_salary
	FROM employees e
	JOIN salaries s ON e.emp_no = s.emp_no
	WHERE s.to_date = '9999-01-01'
)
SELECT
	emp_no,
    first_name,
    last_name,
    salary
FROM salary_comparison
WHERE salary > (max_salary * 0.8);
