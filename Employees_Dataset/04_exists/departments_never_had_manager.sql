USE employees;

/*
Find all departments that have never had a manager.

Display:
- dept_no
- dept_name

Sort by dept_no in ascending order.
*/

SELECT
    d.dept_no,
    d.dept_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM dept_manager dm
    WHERE dm.dept_no = d.dept_no
)
ORDER BY d.dept_no;
