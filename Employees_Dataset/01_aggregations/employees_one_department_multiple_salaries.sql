USE employees;

/*
Find all employees who have worked in only one department
but have had more than one salary contract.

Display:
- emp_no
- first_name
- last_name
- dept_no
- salary_contracts
*/

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dc.dept_no,
    sc.salary_contracts
FROM employees e
JOIN (
    SELECT
        de.emp_no,
        MIN(de.dept_no) AS dept_no
    FROM dept_emp de
    GROUP BY de.emp_no
    HAVING COUNT(DISTINCT de.dept_no) = 1
) dc
    ON e.emp_no = dc.emp_no
JOIN (
    SELECT
        s.emp_no,
        COUNT(*) AS salary_contracts
    FROM salaries s
    GROUP BY s.emp_no
    HAVING COUNT(*) > 1
) sc
    ON e.emp_no = sc.emp_no;
