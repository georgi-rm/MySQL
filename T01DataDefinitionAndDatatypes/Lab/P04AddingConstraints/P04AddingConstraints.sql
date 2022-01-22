ALTER TABLE `products` 
ADD CONSTRAINT `cat_prod_fk`
FOREIGN KEY (`category_id`)
REFERENCES `categories` (`id`);