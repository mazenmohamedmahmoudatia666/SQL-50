SELECT
    e.reports_to AS employee_id,
    (SELECT name FROM Employees WHERE employee_id = e.reports_to),
    count(*) AS reports_count,
    round(avg(e.age)) AS average_age
FROM
    Employees e
WHERE
    e.reports_to IS NOT NULL
GROUP BY
    e.reports_to
ORDER BY
    e.reports_to;