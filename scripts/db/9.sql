/* 12:46:06 root@192.168.40.52 */ ALTER TABLE `usermessage` ADD `senttime` TIMESTAMP  NULL  ON UPDATE CURRENT_TIMESTAMP  AFTER `content`;
/* 12:46:06 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:46:06 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:46:06 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:46:06 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:46:06 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:46:06 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:46:06 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:48:01 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:48:01 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'user';
/* 12:48:01 root@192.168.40.52 */ SHOW CREATE TABLE `user`;
/* 12:48:01 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:48:01 root@192.168.40.52 */ SHOW INDEX FROM `user`;
/* 12:48:01 root@192.168.40.52 */ SELECT COUNT(1) FROM `user`;
/* 12:48:13 root@192.168.40.52 */ SELECT * FROM `user` LIMIT 0,1000;
/* 12:52:13 root@192.168.40.52 */ SHOW COLUMNS FROM `user`;
/* 12:52:15 root@192.168.40.52 */ UPDATE `user` SET `surname` = 'Moreton' WHERE `userid` = '9';
/* 12:52:15 root@192.168.40.52 */ SELECT * FROM `user` LIMIT 0,1000;
/* 12:52:19 root@192.168.40.52 */ UPDATE `user` SET `forenames` = 'Chris' WHERE `userid` = '9';
/* 12:52:19 root@192.168.40.52 */ SELECT * FROM `user` LIMIT 0,1000;
/* 12:53:33 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:53:33 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:53:33 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:53:33 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:53:33 root@192.168.40.52 */ SELECT * FROM `usermessage` LIMIT 0,1000;
/* 12:53:35 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:53:40 root@192.168.40.52 */ ALTER TABLE `usermessage` ADD `senderid` INT  NULL  DEFAULT NULL  AFTER `senttime`;
/* 12:53:40 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:53:40 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:53:40 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:53:40 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:53:40 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:53:40 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:53:40 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:53:43 root@192.168.40.52 */ ALTER TABLE `usermessage` MODIFY COLUMN `senderid` INT(11) DEFAULT NULL AFTER `userid`;
/* 12:53:43 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:53:43 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:53:43 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:53:43 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:53:43 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:53:43 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:53:43 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:55:33 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:55:33 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'user';
/* 12:55:33 root@192.168.40.52 */ SHOW CREATE TABLE `user`;
/* 12:55:33 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:55:33 root@192.168.40.52 */ SHOW INDEX FROM `user`;
/* 12:55:33 root@192.168.40.52 */ SELECT COUNT(1) FROM `user`;
/* 12:55:36 root@192.168.40.52 */ SELECT * FROM `user` LIMIT 0,1000;
/* 12:59:33 root@192.168.40.52 */ SET NAMES 'utf8';
/* 12:59:33 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 12:59:33 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 12:59:33 root@192.168.40.52 */ SET NAMES 'latin1';
/* 12:59:33 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 12:59:33 root@192.168.40.52 */ SELECT COUNT(1) FROM `usermessage`;
/* 12:59:34 root@192.168.40.52 */ SELECT * FROM `usermessage` LIMIT 0,1000;
/* 13:05:56 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:05:56 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'userlanguage';
/* 13:05:56 root@192.168.40.52 */ SHOW CREATE TABLE `userlanguage`;
/* 13:05:56 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:05:56 root@192.168.40.52 */ SELECT * FROM `userlanguage` LIMIT 0,1000;
/* 13:05:57 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:05:57 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 13:05:57 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 13:05:57 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:05:57 root@192.168.40.52 */ SELECT * FROM `usermessage` LIMIT 0,1000;
/* 13:12:36 root@192.168.40.52 */ SHOW INDEX FROM `usermessage`;
/* 13:12:38 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:12:38 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'userprofessionalqualification';
/* 13:12:38 root@192.168.40.52 */ SHOW CREATE TABLE `userprofessionalqualification`;
/* 13:12:38 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:12:38 root@192.168.40.52 */ SELECT * FROM `userprofessionalqualification` LIMIT 0,1000;
/* 13:12:38 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:12:38 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 13:12:38 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 13:12:38 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:12:38 root@192.168.40.52 */ SELECT * FROM `usermessage` LIMIT 0,1000;
/* 13:12:44 root@192.168.40.52 */ DELETE FROM `usermessage` WHERE `usermessageid` IN ('1','2','3','4','5','6','7','8');
/* 13:30:39 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:30:39 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'userlanguage';
/* 13:30:39 root@192.168.40.52 */ SHOW CREATE TABLE `userlanguage`;
/* 13:30:39 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:30:39 root@192.168.40.52 */ SELECT * FROM `userlanguage` LIMIT 0,1000;
/* 13:30:39 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:30:39 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 13:30:39 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 13:30:39 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:30:39 root@192.168.40.52 */ SELECT * FROM `usermessage` LIMIT 0,1000;
/* 13:32:26 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:32:26 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'userlanguage';
/* 13:32:26 root@192.168.40.52 */ SHOW CREATE TABLE `userlanguage`;
/* 13:32:26 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:32:26 root@192.168.40.52 */ SELECT * FROM `userlanguage` LIMIT 0,1000;
/* 13:32:27 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:32:27 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 13:32:27 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 13:32:27 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:32:27 root@192.168.40.52 */ SELECT * FROM `usermessage` LIMIT 0,1000;
/* 13:33:25 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:33:25 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'userlanguage';
/* 13:33:25 root@192.168.40.52 */ SHOW CREATE TABLE `userlanguage`;
/* 13:33:25 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:33:25 root@192.168.40.52 */ SELECT * FROM `userlanguage` LIMIT 0,1000;
/* 13:33:25 root@192.168.40.52 */ SET NAMES 'utf8';
/* 13:33:25 root@192.168.40.52 */ SHOW TABLE STATUS LIKE 'usermessage';
/* 13:33:25 root@192.168.40.52 */ SHOW CREATE TABLE `usermessage`;
/* 13:33:25 root@192.168.40.52 */ SET NAMES 'latin1';
/* 13:33:25 root@192.168.40.52 */ SELECT * FROM `usermessage` LIMIT 0,1000;
