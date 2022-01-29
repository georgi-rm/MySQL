SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    lower(substring(`first_name`, 1, 2)) = 'sa'
ORDER BY `employee_id`;