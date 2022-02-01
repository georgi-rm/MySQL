SELECT 
    `department_id`, round(avg(`salary`), 2)
FROM
    `employees`
GROUP BY `department_id`;