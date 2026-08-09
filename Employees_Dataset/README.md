# Employees Dataset

SQL practice based on the **MySQL Employees** sample database.

The exercises are designed to strengthen SQL skills through increasingly complex queries and to provide additional practice in areas that require further attention.

## Dataset

The exercises use the following tables from the Employees database:

* `employees` — employee information
* `departments` — department information
* `dept_emp` — employee department assignments
* `dept_manager` — department manager assignments
* `salaries` — employee salary history

## Structure

The exercises are grouped by the primary SQL technique they are intended to practice.

```text
Employees_Dataset/
│
├── 01_aggregations/
├── 02_joins/
├── 03_subqueries/
├── 04_exists/
├── 05_dates/
├── 06_case/
└── 07_advanced/
```

A problem may use multiple SQL concepts, but it is placed according to the main technique being practiced.

## Topics Covered

* Aggregate functions
* `GROUP BY` and `HAVING`
* `JOIN`s
* Subqueries
* Correlated subqueries
* `EXISTS` / `NOT EXISTS`
* Conditional aggregation
* `CASE` expressions
* Date and time functions
* Finding first and latest records
* Comparing individual and group-level aggregates
* Multi-step queries

## Exercise Format

Each exercise is stored as a separate `.sql` file.

The file contains the problem description followed by the SQL solution:

```sql
/*
Problem description
*/

SELECT
    ...
FROM ...
```

The problems are created with the help of **ChatGPT** and are intentionally focused on concepts that require additional practice.

The solutions are reviewed and refined as my understanding of the underlying SQL concepts improves.
