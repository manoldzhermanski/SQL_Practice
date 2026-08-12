USE employees;

/*
Find all employees who have been managers of at least one department.

Display:
- emp_no
- first_name
- last_name

Use EXISTS().
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM dept_manager dm
    WHERE dm.emp_no = e.emp_no
);
