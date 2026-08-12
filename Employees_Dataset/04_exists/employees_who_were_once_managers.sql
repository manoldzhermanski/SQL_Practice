USE employees;

/*
Find all employees who have ever been a department manager but are currently no longer managers.
Return:
- emp_no
- first_name
- last_name
*/

SELECT
	e.emp_no,
    e.first_name,
    e.last_name
FROM employees e
JOIN dept_manager dm1 ON e.emp_no = dm1.emp_no
WHERE EXISTS(
	SELECT 1
    FROM dept_manager dm2
    WHERE dm1.emp_no = dm2.emp_no AND dm2.to_date <> '9999-01-01'
) AND NOT EXISTS (
	SELECT 1
    FROM dept_manager dm3
    WHERE dm1.emp_no = dm3.emp_no AND dm3.to_date = '9999-01-01'
);
