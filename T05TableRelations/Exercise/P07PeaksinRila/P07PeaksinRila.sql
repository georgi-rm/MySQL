SELECT `mountain_range`, `peak_name`, `elevation` AS 'peak_elevation'
FROM `peaks` AS p
JOIN `mountains` AS m ON p.`mountain_id` = m.`id`
HAVING `mountain_range` = 'Rila'
ORDER BY `peak_elevation` DESC;
