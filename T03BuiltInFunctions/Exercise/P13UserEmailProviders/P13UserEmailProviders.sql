SELECT 
    `user_name`,
    substr(`email`,
        locate('@', `email`) + 1) AS 'email provider'
FROM
    `users`
ORDER BY `email provider` ASC , `user_name` ASC;