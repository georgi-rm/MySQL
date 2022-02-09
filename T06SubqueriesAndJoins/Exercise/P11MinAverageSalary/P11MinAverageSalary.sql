SELECT avg(`salary`) AS 'average_salary'
FROM `employees`
GROUP BY `department_id`
ORDER BY `average_salary`
LIMIT 1;