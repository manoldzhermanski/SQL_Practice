USE employees;

/*
The finance department wants to find the employees who
have never received a salary below the company average.

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
    FROM salaries s
    WHERE s.emp_no = e.emp_no
      AND s.salary < (
          SELECT AVG(salary)
          FROM salaries
      )
);
