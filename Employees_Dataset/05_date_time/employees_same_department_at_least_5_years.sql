USE employees;

/*
Find all employees who have worked in the same department
for at least 5 years.

Display:
- emp_no
- first_name
- last_name
- dept_no
- from_date
- to_date
- years_in_department

Calculate years_in_department as the number of years
between from_date and to_date.
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    de.dept_no,
    de.from_date,
    de.to_date,
    TIMESTAMPDIFF(
        YEAR,
        de.from_date,
        de.to_date
    ) AS years_in_department
FROM dept_emp de
JOIN employees e
    ON de.emp_no = e.emp_no
WHERE TIMESTAMPDIFF(
    YEAR,
    de.from_date,
    de.to_date
) >= 5;
