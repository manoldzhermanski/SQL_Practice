USE employees;

/*
HR wants to find employees who have worked in more than
one department during their careers.

Display:
- emp_no
- first_name
- last_name
- the number of distinct departments they have worked in,
  as department_count

Sort by department_count in descending order.

An employee with multiple records for the same department
should be counted only once.
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    COUNT(DISTINCT de.dept_no) AS department_count
FROM employees e
JOIN dept_emp de
    ON e.emp_no = de.emp_no
GROUP BY
    e.emp_no,
    e.first_name,
    e.last_name
HAVING COUNT(DISTINCT de.dept_no) > 1
ORDER BY department_count DESC;
