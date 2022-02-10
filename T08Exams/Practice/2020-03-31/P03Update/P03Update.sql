-- Version 1
UPDATE `addresses` 
SET 
    `country` = 'Blocked'
WHERE
    `country` LIKE 'B%';

UPDATE `addresses` 
SET 
    `country` = 'Test'
WHERE
    `country` LIKE 'T%';

UPDATE `addresses` 
SET 
    `country` = 'In Progress'
WHERE
    `country` LIKE 'P%';

-- Version 2
UPDATE `addresses`
SET 
    `country` = (CASE
        WHEN `country` LIKE 'B%' THEN 'Blocked'
        WHEN `country` LIKE 'T%' THEN 'Test'
        WHEN `country` LIKE 'P%' THEN 'In Progress'
        ELSE `country`
    END);