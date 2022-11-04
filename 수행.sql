java1_bookstoreCREATE DATABASE `java1_BookStore`;
CREATE USER 'java1_BookStore'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `java1_BookStore`.* TO 'java1_BookStore'@'%';
FLUSH PRIVILEGES;

DROP TABLE `book`;
DROP TABLE `customer`;

CREATE TABLE `book`(
	`bno` INT  null,
	`bname` VARCHAR(20) not NULL,
	`bpub` VARCHAR(20)  NULL,
	`bpric` INT  NULL
);

CREATE TABLE `customer`(
	`custId` INT AUTO_INCREMENT PRIMARY KEY,
	`cusname` VARCHAR(20)  NULL,
	`cusaddr` VARCHAR(20)  NULL,
	`cushp` CHAR(20) NULL
);

INSERT INTO `book` VALUES( 1, '축구의 역사' ,'굿스포츠' ,7000 );
INSERT INTO `book` VALUES( 2, '축구의 이해' ,'대한미디어' ,22000 );
INSERT INTO `book` VALUES( 3, '골프바이블' ,'대한미디어' ,35000 );

INSERT INTO `customer` VALUES(1,'박지성','영국 맨체스터', '010-1234-1001');
INSERT INTO `customer` VALUES(2,'김연아','대한민국 서울', '010-1234-1002');
INSERT INTO `customer` VALUES(3,'장미란','대한민국 강원도맨체스터', '010-1234-1003');
