USE employees;

/*
For each employee, find their highest salary, but use ROW_NUMBER().
The result should contain:
- emp_no
- salary
- from_date
and include only one row per employee.
*/
WITH ranked_salaries AS (
	SELECT
		s.emp_no,
		s.salary,
		s.from_date,
		ROW_NUMBER() OVER (PARTITION BY s.emp_no ORDER BY s.salary DESC) as row_num
	FROM salaries s
)
SELECT
	rs.emp_no,
    rs.salary,
    rs.from_date
FROM ranked_salaries rs
WHERE rs.row_num = 1;
