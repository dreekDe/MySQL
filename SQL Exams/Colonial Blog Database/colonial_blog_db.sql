CREATE SCHEMA `colonial_blog_db`;
USE `colonial_blog_db`;

CREATE TABLE `users` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(30) NOT NULL UNIQUE,
    `email` VARCHAR(50) NOT NULL
);

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(30) NOT NULL
);

CREATE TABLE `articles` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `content` TEXT NOT NULL,
    `category_id` INT,
    CONSTRAINT fk_articles_categories FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id`)
);

CREATE TABLE `users_articles` (
    `user_id` INT,
    `article_id` INT,
    CONSTRAINT fk_ua_u FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`),
    CONSTRAINT fk_ua_a FOREIGN KEY (`article_id`)
        REFERENCES `articles` (`id`)
);

CREATE TABLE `comments` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `comment` VARCHAR(255) NOT NULL,
    `article_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    CONSTRAINT fk_c_u FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`),
    CONSTRAINT fk_c_a FOREIGN KEY (`article_id`)
        REFERENCES `articles` (`id`)
);

CREATE TABLE `likes` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `article_id` INT,
    `comment_id` INT,
    `user_id` INT NOT NULL,
    CONSTRAINT fk_l_u FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`),
    CONSTRAINT fk_l_a FOREIGN KEY (`article_id`)
        REFERENCES `articles` (`id`),
    CONSTRAINT fk_l_c FOREIGN KEY (`comment_id`)
        REFERENCES `comments` (`id`)
);

