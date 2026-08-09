USE employees;

/*
Find the department with the highest average current salary.

Display:
- dept_no
- dept_name
- avg_salary

If two or more departments have the same highest average
salary, show all of them.
*/

SELECT
    d.dept_no,
    d.dept_name,
    da.avg_salary
FROM departments d
JOIN (
    SELECT
        de.dept_no,
        AVG(s.salary) AS avg_salary
    FROM dept_emp de
    JOIN salaries s
        ON de.emp_no = s.emp_no
    WHERE
        de.to_date = '9999-01-01'
        AND s.to_date = '9999-01-01'
    GROUP BY de.dept_no
) da
    ON d.dept_no = da.dept_no
WHERE da.avg_salary = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT
            de.dept_no,
            AVG(s.salary) AS avg_salary
        FROM dept_emp de
        JOIN salaries s
            ON de.emp_no = s.emp_no
        WHERE
            de.to_date = '9999-01-01'
            AND s.to_date = '9999-01-01'
        GROUP BY de.dept_no
    ) dept_averages
);
