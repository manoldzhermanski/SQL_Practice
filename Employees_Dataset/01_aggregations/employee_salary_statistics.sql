USE employees;

/*
For each employee, display:
- emp_no
- first_name
- last_name
- the lowest salary received
- the highest salary received
- the number of salary contracts

Sort by emp_no.
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    MIN(s.salary) AS min_salary,
    MAX(s.salary) AS max_salary,
    COUNT(*) AS salary_contracts
FROM employees e
JOIN salaries s
    ON e.emp_no = s.emp_no
GROUP BY
    e.emp_no,
    e.first_name,
    e.last_name
ORDER BY e.emp_no;
