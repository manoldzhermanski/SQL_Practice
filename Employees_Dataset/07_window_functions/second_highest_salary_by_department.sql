USE employees;
 
 /*
 Find the second highest-paid employee in each department.
Display:
- emp_no
- first_name
- last_name
- dept_name
- salary
 */
WITH salary_ranking_by_dept AS (SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_no,
    d.dept_name,
    s.salary,
    RANK() OVER (PARTITION BY d.dept_no ORDER BY s.salary DESC) AS salary_ranking
 FROM employees e 
 JOIN salaries s ON e.emp_no = s.emp_no
 JOIN dept_emp de ON e.emp_no = de.emp_no
 JOIN departments d on de.dept_no = d.dept_no
 WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
 )
 SELECT
	emp_no,
    first_name,
    last_name,
    dept_no,
    dept_name,
    salary
 FROM salary_ranking_by_dept
 WHERE salary_ranking = 2
 ORDER BY dept_no;
