USE employees;

/*
Find all employees who have worked in at least two different departments.

Display:
- emp_no
- first_name
- last_name
- department_count

Use a self-join.
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    COUNT(DISTINCT de1.dept_no) AS department_count
FROM employees e
JOIN dept_emp de1
    ON e.emp_no = de1.emp_no
JOIN dept_emp de2
    ON de1.emp_no = de2.emp_no
    AND de1.dept_no <> de2.dept_no
GROUP BY
    e.emp_no,
    e.first_name,
    e.last_name
HAVING COUNT(DISTINCT de1.dept_no) >= 2;
