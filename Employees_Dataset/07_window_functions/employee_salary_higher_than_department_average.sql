USE employees;

/*
With the help of window functions, find the employees who earn more than the average salary for their department.
Display:
- emp_no
- first_name
- last_name
- dept_name
- salary
- department_avg_salary

Condition:
- The average must be calculated based on the current salaries of employees in the respective department.
*/

WITH salary_comparison AS (
	SELECT
		e.emp_no,
		e.first_name,
		e.last_name,
		d.dept_name,
		s.salary,
		AVG(s.salary) OVER (PARTITION BY d.dept_no) AS avg_dept_salary
	FROM employees e  
	JOIN salaries s ON s.emp_no = e.emp_no
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
	WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
	)
SELECT
	emp_no,
    first_name,
    last_name,
    dept_name,
    salary,
    ROUND(avg_dept_salary, 2) AS avg_dept_salary
FROM salary_comparison
WHERE salary > avg_dept_salary;
