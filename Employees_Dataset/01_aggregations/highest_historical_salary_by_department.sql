USE employees;

/*
For each department, find the employee(s) who received
the highest historical salary.

Display:
- dept_no
- dept_name
- emp_no
- first_name
- last_name
- salary

If two employees have the same highest salary in the department,
show both of them.
*/

SELECT
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.first_name,
    e.last_name,
    s.salary
FROM salaries s
JOIN employees e
    ON s.emp_no = e.emp_no
JOIN dept_emp de
    ON e.emp_no = de.emp_no
JOIN departments d
    ON de.dept_no = d.dept_no
JOIN (
    SELECT
        de.dept_no,
        MAX(s.salary) AS max_salary
    FROM salaries s
    JOIN dept_emp de
        ON s.emp_no = de.emp_no
    GROUP BY de.dept_no
) ms
    ON de.dept_no = ms.dept_no
    AND s.salary = ms.max_salary
ORDER BY d.dept_no;
