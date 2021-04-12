CREATE SCHEMA `now`;
USE  `now`;

CREATE TABLE `people` (
    `person_id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `salary` DECIMAL(11 , 2 ),
    `passrport_id` INT UNIQUE
);

CREATE TABLE `passports` (
    `passport_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `passport_number` VARCHAR(30) UNIQUE 
);

ALTER TABLE `people`
ADD CONSTRAINT `fk_people_passport`
FOREIGN KEY `people`(`passrport_id`)
REFERENCES `passports`(`passport_id`);

INSERT INTO `passports`
VALUE 
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2');

INSERT INTO `people` 
VALUE 
(1,  'Roberto', 43300.00, 102),
(2,	'Tom', 56100.00, 103),
(3, 'Yana', 60200.00, 101);

DROP SCHEMA `now`;




