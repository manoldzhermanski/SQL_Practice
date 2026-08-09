USE employees;

/*
For each department, display:
- dept_no
- dept_name
- total_employees
- low_salary_employees
- high_salary_employees

Low → current salary < 50,000
High → current salary >= 80,000
*/

SELECT
    d.dept_no,
    d.dept_name,
    COUNT(de.emp_no) AS total_employees,
    SUM(
        CASE
            WHEN s.salary < 50000 THEN 1
            ELSE 0
        END
    ) AS low_salary_employees,
    SUM(
        CASE
            WHEN s.salary >= 80000 THEN 1
            ELSE 0
        END
    ) AS high_salary_employees
FROM departments d
JOIN dept_emp de
    ON d.dept_no = de.dept_no
JOIN salaries s
    ON s.emp_no = de.emp_no
WHERE
    de.to_date = '9999-01-01'
    AND s.to_date = '9999-01-01'
GROUP BY
    d.dept_no,
    d.dept_name
ORDER BY d.dept_no;
