SELECT 
    concat_ws(' ', `first_name`, `last_name`) AS 'Full Name',
    datediff(`died`, `born`) AS 'Days Lived'
FROM
    `authors`;