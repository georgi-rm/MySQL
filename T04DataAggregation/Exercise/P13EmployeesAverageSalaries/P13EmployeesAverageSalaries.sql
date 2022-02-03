-- Version 1
SELECT 
    `department_id`,
    IF(`department_id` = 1,
        avg(`salary`) + 5000,
        avg(`salary`)) AS 'avg_salary'
FROM
    `employees`
WHERE
    `salary` > 30000 AND `manager_id` != 42
GROUP BY `department_id`
ORDER BY `department_id`;

-- Version 2
CREATE VIEW `v_high_paid_employees` AS
    SELECT 
        `department_id`,
        IF(`department_id` = 1,
            `salary` + 5000,
            `salary`) AS 'salary'
    FROM
        `employees`
    WHERE
        `salary` > 30000 AND `manager_id` != 42;

SELECT 
    `department_id`, avg(`salary`) AS 'avg_salary'
FROM
    `v_high_paid_employees`
GROUP BY `department_id`
ORDER BY `department_id`;