USE employees;
 
 /*
 For each department, find:
- the highest current salary;
- the average current salary;
- the difference between the highest and the average.

Display:
- dept_no
- dept_name
- highest_salary
- average_salary
- salary_difference
 */
 
SELECT DISTINCT
	d.dept_no,
    d.dept_name,
    MAX(s.salary) OVER w AS highest_salary,
    AVG(s.salary) OVER w AS average_salary,
    MAX(s.salary) OVER w - AVG(s.salary) OVER w AS salary_difference
 FROM departments d
 JOIN dept_emp de ON d.dept_no = de.dept_no
 JOIN salaries s ON de.emp_no = s.emp_no
 WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
 WINDOW w AS (PARTITION BY d.dept_no)
 ORDER BY d.dept_no;
 
