SELECT 
    count(`salary`)
FROM
    `employees`
WHERE
    `manager_id` IS NULL;