USE employees;

/*
For each employee, find:
- the date they started work;
- the date they left;
- the total duration of their career in years.

Categorize employees based on tenure:
< 5 years → Junior
5–10 years → Mid
10–20 years → Senior
20+ years → Veteran

Return:
- emp_no
- first_name
- last_name
- hire_date
- end_date
- career_years
- career_category
*/

WITH career AS (
    SELECT
        e.emp_no,
        e.first_name,
        e.last_name,
        e.hire_date,
        CASE
            WHEN MAX(t.to_date) = '9999-01-01'
                THEN CURDATE()
            ELSE MAX(t.to_date)
        END AS end_date
    FROM employees e
    JOIN titles t
        ON e.emp_no = t.emp_no
    GROUP BY
        e.emp_no,
        e.first_name,
        e.last_name,
        e.hire_date
)
SELECT
    emp_no,
    first_name,
    last_name,
    hire_date,
    end_date,
    TIMESTAMPDIFF(YEAR, hire_date, end_date) AS career_years,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, hire_date, end_date) < 5
            THEN 'Junior'
        WHEN TIMESTAMPDIFF(YEAR, hire_date, end_date) < 10
            THEN 'Mid'
        WHEN TIMESTAMPDIFF(YEAR, hire_date, end_date) < 20
            THEN 'Senior'
        ELSE 'Veteran'
    END AS career_category
FROM career;
