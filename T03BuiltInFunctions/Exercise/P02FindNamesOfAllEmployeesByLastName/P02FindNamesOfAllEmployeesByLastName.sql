SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    lower(`last_name`) LIKE '%ei%'
ORDER BY `employee_id`;