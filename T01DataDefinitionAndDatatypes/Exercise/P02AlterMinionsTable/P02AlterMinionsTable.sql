ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL;

ALTER TABLE `minions`
ADD CONSTRAINT `towns_minions_fk`
FOREIGN KEY `minions` ( `town_id`)
REFERENCES `towns` (id);