USE employees;

/*
HR wants to identify the employees who
have never received the highest salary in the company.

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
      AND s.salary = (
          SELECT MAX(salary)
          FROM salaries
    )
);
