USE employees;

/*
Display each employee's current salary and categorize it:

- < 50,000 → Low
- 50,000 – 79,999 → Medium
- 80,000 – 99,999 → High
- >= 100,000 → Very High

Display:
- emp_no
- first_name
- last_name
- salary
- salary_category
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    s.salary,
    CASE
        WHEN s.salary < 50000 THEN 'Low'
        WHEN s.salary BETWEEN 50000 AND 79999 THEN 'Medium'
        WHEN s.salary BETWEEN 80000 AND 99999 THEN 'High'
        ELSE 'Very High'
    END AS salary_category
FROM employees e
JOIN salaries s
    ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';
