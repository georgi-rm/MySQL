SELECT 
    `department_id`, count(*) as 'Number of employees'
FROM
    `employees`
GROUP BY `department_id`
ORDER BY `department_id` ASC , `Number of employees` ASC;