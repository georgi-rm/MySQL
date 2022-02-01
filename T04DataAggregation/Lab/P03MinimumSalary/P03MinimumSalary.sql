SELECT 
    `department_id`, round(min(`salary`), 2) AS 'Min Salary'
FROM
    `employees`
GROUP BY `department_id`
HAVING `Min Salary` > 800;