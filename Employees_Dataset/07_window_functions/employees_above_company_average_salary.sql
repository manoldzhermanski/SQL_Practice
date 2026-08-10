USE employees;

/*
Find all employees who are currently earning more than the average current salary for the entire company.

Display:
- emp_no
- first_name
- last_name
- salary
*/
WITH salary_comparison  AS (
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    s.salary,
    AVG(s.salary) OVER () AS avg_salary
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
WHERE salary > avg_salary;
