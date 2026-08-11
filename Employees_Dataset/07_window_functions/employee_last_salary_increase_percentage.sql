USE employees;

/*
For each employee, find their current salary, previous salary, and the percentage change between the two.

Return:
- emp_no
- first_name
- last_name
- current_salary
- previous_salary
- salary_change_percent
*/

WITH salary_statistics AS (
	SELECT
		e.emp_no,
		e.first_name,
		e.last_name,
		s.to_date,
		s.salary,
		LAG(s.salary) OVER (PARTITION BY e.emp_no ORDER BY s.from_date) AS previous_salary
	FROM salaries s
	JOIN employees e ON s.emp_no = e.emp_no
)
SELECT
	emp_no,
    first_name,
    last_name,
    salary AS current_salary,
    previous_salary,
    ROUND((salary - previous_salary) * 100 / previous_salary, 2) AS salary_change_percent
FROM salary_statistics
WHERE to_date = '9999-01-01';
