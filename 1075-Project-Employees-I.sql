-- Write your PostgreSQL query statement below
WITH data AS (
    SELECT prj.project_id, SUM(emp.experience_years) AS totalexp, COUNT(emp.employee_id) AS totalcount
    FROM Employee emp
    LEFT JOIN Project prj
    ON prj.employee_id = emp.employee_id
    GROUP BY  prj.project_id
)

SELECT project_id, ROUND(totalexp/totalcount:: NUMERIC, 2) AS average_years
FROM data
WHERE project_id IS NOT NULL;