USE employees;

/*
Find all employees who:
- have never been managers
- have at least 2 salary contracts

Display:
- emp_no
- first_name
- last_name
- salary_contracts
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    COUNT(*) AS salary_contracts
FROM employees e
JOIN salaries s
    ON e.emp_no = s.emp_no
WHERE NOT EXISTS (
    SELECT 1
    FROM dept_manager dm
    WHERE dm.emp_no = e.emp_no
)
GROUP BY
    e.emp_no,
    e.first_name,
    e.last_name
HAVING COUNT(*) >= 2;
