USE employees;

/*
Find all employees whose highest salary received is higher
than the company's average salary.

Display:
- emp_no
- first_name
- last_name
- max_salary

Sort by max_salary in descending order.
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) AS max_salary
FROM employees e
JOIN salaries s
    ON e.emp_no = s.emp_no
GROUP BY
    e.emp_no,
    e.first_name,
    e.last_name
HAVING MAX(s.salary) > (
    SELECT AVG(s.salary)
    FROM salaries s
)
ORDER BY max_salary DESC;
