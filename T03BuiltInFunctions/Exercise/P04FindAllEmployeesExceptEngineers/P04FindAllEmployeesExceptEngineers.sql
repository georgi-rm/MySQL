SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    lower(`job_title`) NOT LIKE '%engineer%'
ORDER BY `employee_id`;