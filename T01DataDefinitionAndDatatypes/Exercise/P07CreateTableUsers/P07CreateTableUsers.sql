CREATE TABLE `users` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` DATETIME,
    `is_deleted` BOOL
);

INSERT INTO `users` (`username`, `password`, `last_login_time`, `is_deleted` )
VALUES
		('Georgi', '1234', '2022-01-22 23:10:30', false),
		('Ani', '12345678', '2022-01-16 02:10:01', false),
		('Ivan', '123Qweasd', '2021-12-03 23:50:40', false),
		('Jhon', 'asdfds', '2022-01-15 12:15:05', false),
		('Baj Valcho', 'gmjweopgjweo', '2022-01-01 23:59:59', true);