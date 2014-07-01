/* 12:18:11 root@192.168.40.52 */ CREATE TABLE `usermessage` (id INT(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT);
/* 12:18:11 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:18:11 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:18:11 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:11 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:18:11 root@192.168.40.52 */ SHOW VARIABLES LIKE 'collation_database';
/* 12:18:11 root@192.168.40.52 */ SELECT COUNT(1) FROM `usermessage`;
/* 12:18:16 root@192.168.40.52 */ ALTER TABLE `usermessage` CHANGE `id` `usermessageid` INT(11)  UNSIGNED  NOT NULL  AUTO_INCREMENT;
/* 12:18:16 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:16 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:18:16 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:16 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:18:16 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:16 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:18:16 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:20 root@192.168.40.52 */ ALTER TABLE `usermessage` ADD `userid` INT  NULL  DEFAULT NULL  AFTER `usermessageid`;
/* 12:18:20 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:20 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:18:20 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:20 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:18:20 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:20 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:18:20 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:28 root@192.168.40.52 */ ALTER TABLE `usermessage` ADD `typeid` INT  NULL  DEFAULT NULL  AFTER `userid`;
/* 12:18:28 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:28 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:18:28 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:28 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:18:28 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:28 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:18:28 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:32 root@192.168.40.52 */ ALTER TABLE `usermessage` ADD `content` INT  NULL  DEFAULT NULL  AFTER `typeid`;
/* 12:18:32 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:32 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:18:32 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:32 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:18:32 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:32 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:18:32 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:43 root@192.168.40.52 */ ALTER TABLE `usermessage` ADD `title` INT  NULL  DEFAULT NULL  AFTER `content`;
/* 12:18:43 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:43 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:18:43 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:43 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:18:43 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:43 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:18:43 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:51 root@192.168.40.52 */ ALTER TABLE `usermessage` MODIFY COLUMN `title` INT(11) DEFAULT NULL AFTER `typeid`;
/* 12:18:51 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:51 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:18:51 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:51 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:18:51 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:51 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:18:51 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:55 root@192.168.40.52 */ ALTER TABLE `usermessage` CHANGE `content` `content` TEXT  NULL;
/* 12:18:55 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:55 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:18:55 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:18:55 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:18:55 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:18:55 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:18:55 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:19:00 root@192.168.40.52 */ ALTER TABLE `usermessage` CHANGE `title` `title` VARCHAR(11)  NULL  DEFAULT NULL;
/* 12:19:00 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:19:00 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:19:00 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:19:00 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:19:00 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:19:00 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:19:00 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:19:04 root@192.168.40.52 */ ALTER TABLE `usermessage` CHANGE `title` `title` VARCHAR(50)  CHARACTER SET latin1  COLLATE latin1_swedish_ci  NULL  DEFAULT NULL;
/* 12:19:04 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:19:04 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:19:04 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:19:04 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:19:04 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:19:04 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:19:04 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:19:07 root@192.168.40.52 */ ALTER TABLE `usermessage` CHANGE `title` `title` VARCHAR(100)  CHARACTER SET latin1  COLLATE latin1_swedish_ci  NULL  DEFAULT NULL;
/* 12:19:07 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:19:07 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:19:07 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:19:07 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:19:07 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:19:07 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:19:07 root@192.168.40.52 */ SET NAMES 'latin1';
