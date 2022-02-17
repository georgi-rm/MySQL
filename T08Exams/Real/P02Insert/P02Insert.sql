INSERT INTO `reviews` (`content`, `picture_url`, `published_at`, `rating`)
SELECT left(p.`description`, 15), reverse(p.`name`), '2010-10-10', p.`price` / 8
FROM `products` AS p
WHERE p.`id` >= 5;