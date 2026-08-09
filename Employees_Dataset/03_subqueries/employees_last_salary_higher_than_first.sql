USE employees;

/*
Find all employees whose last salary is higher than their first salary.

Display:
- emp_no
- first_name
- last_name
- first_salary
- last_salary
- salary_increase

salary_increase = last_salary - first_salary
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    fs.first_salary,
    ls.last_salary,
    ls.last_salary - fs.first_salary AS salary_increase
FROM employees e
JOIN (
    SELECT
        s.emp_no,
        s.salary AS first_salary
    FROM salaries s
    JOIN (
        SELECT
            emp_no,
            MIN(from_date) AS first_date
        FROM salaries
        GROUP BY emp_no
    ) fd
        ON s.emp_no = fd.emp_no
        AND s.from_date = fd.first_date
) fs
    ON e.emp_no = fs.emp_no
JOIN (
    SELECT
        s.emp_no,
        s.salary AS last_salary
    FROM salaries s
    JOIN (
        SELECT
            emp_no,
            MAX(from_date) AS last_date
        FROM salaries
        GROUP BY emp_no
    ) ld
        ON s.emp_no = ld.emp_no
        AND s.from_date = ld.last_date
) ls
    ON e.emp_no = ls.emp_no
WHERE ls.last_salary > fs.first_salary
ORDER BY salary_increase DESC;
