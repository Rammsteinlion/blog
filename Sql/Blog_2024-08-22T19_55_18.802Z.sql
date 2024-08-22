CREATE TABLE `users` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	`username` VARCHAR(255) UNIQUE,
	`password` VARCHAR(255),
	`email` VARCHAR(255) UNIQUE,
	`avatar` VARCHAR(255),
	`status` ENUM("active", "inactive", "blocked"),
	`role` ENUM("admin", "subscriber"),
	`last_login` TIMESTAMP,
	`last_updated` DATETIME,
	`token` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE `blog_posts` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`user_id` INT,
	`title` VARCHAR(255),
	`content` VARCHAR(255),
	`cover` VARCHAR(255),
	`created_at` DATETIME,
	PRIMARY KEY(`id`)
);


CREATE TABLE `comments` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`blog_id` INT,
	`user_id` INT,
	`content` TEXT(65535),
	`content` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE `tags` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255),
	PRIMARY KEY(`id`)
);


CREATE TABLE `blog_tag` (
	`blog_id` INT,
	`tag_id` INT,
	PRIMARY KEY(`blog_id`, `tag_id`)
);


ALTER TABLE `blog_posts`
ADD FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `comments`
ADD FOREIGN KEY(`blog_id`) REFERENCES `blog_posts`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `comments`
ADD FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `blog_tag`
ADD FOREIGN KEY(`tag_id`) REFERENCES `tags`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `blog_tag`
ADD FOREIGN KEY(`blog_id`) REFERENCES `blog_posts`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;