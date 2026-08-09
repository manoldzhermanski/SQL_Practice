USE employees;

/*
Find the employees whose current salary is above the
average current salary for their department.

Display:
- dept_no
- dept_name
- emp_no
- first_name
- last_name
- salary
- dept_avg_salary

If two employees satisfy the condition, show both of them.
*/

SELECT
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.first_name,
    e.last_name,
    s.salary,
    ROUND(dept_avg.dept_avg_salary, 2) AS dept_avg_salary
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
        AVG(s.salary) AS dept_avg_salary
    FROM salaries s
    JOIN dept_emp de
        ON s.emp_no = de.emp_no
    WHERE
        de.to_date = '9999-01-01'
        AND s.to_date = '9999-01-01'
    GROUP BY de.dept_no
) dept_avg
    ON dept_avg.dept_no = de.dept_no
WHERE
    de.to_date = '9999-01-01'
    AND s.to_date = '9999-01-01'
    AND s.salary > dept_avg.dept_avg_salary
ORDER BY d.dept_no;
