USE employees;

/*
For each employee, find their current salary and their previous salary, if applicable.
Return:
- emp_no
- salary
- from_date
- previous_salary
- salary_change

Order the records by:
- emp_no
- from_date
*/
WITH salary_history AS (
    SELECT
        s.emp_no,
        s.salary,
        s.from_date,
        s.to_date,
        LAG(s.salary) OVER w AS previous_salary
    FROM salaries s
    WINDOW w AS (PARTITION BY s.emp_no ORDER BY s.from_date)
)
SELECT
    emp_no,
    salary,
    from_date,
    previous_salary,
    salary - previous_salary AS salary_change
FROM salary_history
WHERE to_date = '9999-01-01';
