USE employees;

/*
Find all salary contracts where the salary is higher than
the specific employee's average salary.

Display:
- emp_no
- salary
- from_date
- to_date
*/

SELECT
    s.emp_no,
    s.salary,
    s.from_date,
    s.to_date
FROM salaries s
WHERE s.salary > (
    SELECT AVG(s2.salary)
    FROM salaries s2
    WHERE s2.emp_no = s.emp_no
)
ORDER BY s.emp_no;
