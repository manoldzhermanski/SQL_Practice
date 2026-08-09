USE employees;

/*
HR wants the employees who have never received a salary increase.

Display:
- emp_no
- first_name
- last_name
- min_salary
- max_salary
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    MIN(s.salary) AS min_salary,
    MAX(s.salary) AS max_salary
FROM employees e
JOIN salaries s
    ON e.emp_no = s.emp_no
GROUP BY
    e.emp_no,
    e.first_name,
    e.last_name
HAVING MIN(s.salary) = MAX(s.salary);
