USE employees;

/*
Find all employees who have never been department managers.

Display:
- emp_no
- first_name
- last_name
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM dept_manager dm
    WHERE dm.emp_no = e.emp_no
)
ORDER BY e.emp_no;
