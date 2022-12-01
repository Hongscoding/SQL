-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.30 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- java1_bank 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java1_bank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `java1_bank`;

-- 테이블 java1_bank.bank_account 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_account` (
  `a_no` varchar(11) NOT NULL,
  `a_item_dist` varchar(2) NOT NULL,
  `a_item_name` varchar(20) NOT NULL,
  `a_c_no` varchar(14) NOT NULL,
  `a_balance` int NOT NULL DEFAULT '0',
  `a_open_date` datetime NOT NULL,
  PRIMARY KEY (`a_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_bank.bank_account:~10 rows (대략적) 내보내기
INSERT INTO `bank_account` (`a_no`, `a_item_dist`, `a_item_name`, `a_c_no`, `a_balance`, `a_open_date`) VALUES
	('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 380000, '2005-07-21 00:00:00'),
	('101-11-1003', 'S1', '자유저축예금', '870830', 53000, '2007-02-17 00:00:00'),
	('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14 00:00:00'),
	('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000, '2008-12-30 00:00:00'),
	('101-11-2003', 'S1', '자유저축예금', '101-22-51094', 8325010, '2010-06-07 00:00:00'),
	('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13 00:00:00'),
	('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-15 00:00:00'),
	('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25 00:00:00'),
	('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 35000, '2013-12-11 00:00:00'),
	('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23 00:00:00');

-- 테이블 java1_bank.bank_customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_customer` (
  `c_no` varchar(14) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_dist` int NOT NULL DEFAULT '0',
  `c_phone` varchar(20) NOT NULL,
  `c_addr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`c_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_bank.bank_customer:~9 rows (대략적) 내보내기
INSERT INTO `bank_customer` (`c_no`, `c_name`, `c_dist`, `c_phone`, `c_addr`) VALUES
	('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구'),
	('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구'),
	('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시'),
	('730423-1000001', '김유신', 1, '010-1234-1001', '경기도 수원시'),
	('750210-1000002', '감춘추', 1, '010-1234-1002', '경기도 광주시'),
	('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구'),
	('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구'),
	('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시'),
	('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

-- 테이블 java1_bank.bank_transaction 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank_transaction` (
  `t_no` int NOT NULL AUTO_INCREMENT,
  `t_a_no` varchar(11) NOT NULL,
  `t_dist` int NOT NULL,
  `t_amount` int NOT NULL DEFAULT '0',
  `t_datetime` datetime NOT NULL,
  PRIMARY KEY (`t_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_bank.bank_transaction:~10 rows (대략적) 내보내기
INSERT INTO `bank_transaction` (`t_no`, `t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES
	(1, '101-11-1001', 1, 50000, '2022-08-31 11:44:27'),
	(2, '101-11-1003', 2, 120000, '2022-08-31 11:44:28'),
	(3, '101-11-2001', 2, 300000, '2022-08-31 11:44:29'),
	(4, '101-11-1002', 1, 1000000, '2022-08-31 11:44:29'),
	(5, '101-11-1001', 3, 0, '2022-08-31 11:44:30'),
	(6, '101-13-1005', 1, 200000, '2022-08-31 11:44:31'),
	(7, '101-11-1001', 1, 450000, '2022-08-31 11:44:32'),
	(8, '101-11-2002', 2, 32000, '2022-08-31 11:44:32'),
	(9, '101-11-2003', 3, 0, '2022-08-31 11:44:33'),
	(10, '101-11-1003', 1, 75000, '2022-08-31 11:44:34');


-- java1_board 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java1_board` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `java1_board`;

-- 테이블 java1_board.board_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_user` (
  `uid` varchar(20) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `nick` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `grade` tinyint DEFAULT '2',
  `zip` char(5) DEFAULT NULL,
  `addr1` varchar(255) DEFAULT NULL,
  `addr2` varchar(255) DEFAULT NULL,
  `regip` varchar(100) DEFAULT NULL,
  `rdate` datetime DEFAULT NULL,
  `wdate` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `nick` (`nick`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_board.board_user:~3 rows (대략적) 내보내기
INSERT INTO `board_user` (`uid`, `pass`, `name`, `nick`, `email`, `hp`, `grade`, `zip`, `addr1`, `addr2`, `regip`, `rdate`, `wdate`) VALUES
	('a1002', '8c86837c796f2871647133cee065e6978113940e18a23db5f9dbc04f8511b920', '이순신', '이순신1', 'alswns-3948@naver.com', '010-5555-1001', 2, '47545', '부산 연제구 중앙대로 지하 1017', '', '0:0:0:0:0:0:0:1', '2022-12-01 10:43:01', NULL),
	('a1003', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', '김유신', '유신123', 'alswns3906@naver.com', '', 2, '', '', '', '0:0:0:0:0:0:0:1', '2022-11-30 10:28:50', NULL),
	('a1004', 'c0a0c40a55b8ee119ab09a28e89ed501d1b5e0f818368fe6a1d42b6e01a0e63e', '홍길동', '길동이', 'asd@naver.com', '010-1234-1001', 2, '', '', '', '0:0:0:0:0:0:0:1', '2022-11-30 10:30:08', NULL);


-- java1_bookstore 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java1_bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `java1_bookstore`;

-- 테이블 java1_bookstore.book 구조 내보내기
CREATE TABLE IF NOT EXISTS `book` (
  `bno` int DEFAULT NULL,
  `bname` varchar(20) NOT NULL,
  `bpub` varchar(20) DEFAULT NULL,
  `bpric` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_bookstore.book:~2 rows (대략적) 내보내기
INSERT INTO `book` (`bno`, `bname`, `bpub`, `bpric`) VALUES
	(3, '골프바이블', '대한미디어', 35000),
	(4, '장발장', '장발장', 11001);

-- 테이블 java1_bookstore.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `custId` int NOT NULL AUTO_INCREMENT,
  `cusname` varchar(20) DEFAULT NULL,
  `cusaddr` varchar(20) DEFAULT NULL,
  `cushp` char(20) DEFAULT NULL,
  PRIMARY KEY (`custId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_bookstore.customer:~2 rows (대략적) 내보내기
INSERT INTO `customer` (`custId`, `cusname`, `cusaddr`, `cushp`) VALUES
	(5, '장발장', '영국', '010-1234-1234'),
	(6, '셜록홈즈', '영국', '010-1234-1234');


-- java1_college 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java1_college` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `java1_college`;

-- 테이블 java1_college.lecture 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecNo` int NOT NULL,
  `lecName` varchar(20) NOT NULL,
  `lecCredit` int NOT NULL,
  `lecTime` int NOT NULL,
  `lecClass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lecNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_college.lecture:~7 rows (대략적) 내보내기
INSERT INTO `lecture` (`lecNo`, `lecName`, `lecCredit`, `lecTime`, `lecClass`) VALUES
	(159, '인지행동심리학', 3, 40, '본304'),
	(167, '운영체제론', 3, 25, '본B05'),
	(234, '중급영문법', 3, 20, '본201'),
	(239, '세법개론', 3, 40, '본204'),
	(248, '빅데이터 개론', 3, 20, '본B01'),
	(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
	(349, '사회복지 마케팅', 2, 50, '본301');

-- 테이블 java1_college.register 구조 내보내기
CREATE TABLE IF NOT EXISTS `register` (
  `regStdNo` varchar(8) NOT NULL,
  `regLecNo` int NOT NULL,
  `regMidScore` int DEFAULT NULL,
  `regFinalScore` int DEFAULT NULL,
  `regTotalScore` int DEFAULT NULL,
  `regGrade` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_college.register:~8 rows (대략적) 내보내기
INSERT INTO `register` (`regStdNo`, `regLecNo`, `regMidScore`, `regFinalScore`, `regTotalScore`, `regGrade`) VALUES
	('20201126', 234, 36, 42, 78, 'C'),
	('20201016', 248, 24, 62, 86, 'B'),
	('20201016', 253, 28, 40, 68, 'D'),
	('20201126', 239, 37, 57, 94, 'A'),
	('20210216', 349, 28, 68, 96, 'A'),
	('20210326', 349, 16, 65, 81, 'B'),
	('20201016', 167, 18, 38, 56, 'F'),
	('20220416', 349, 25, 58, 83, 'B');

-- 테이블 java1_college.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `stdNo` varchar(8) NOT NULL,
  `stdName` varchar(20) NOT NULL,
  `stdHp` varchar(13) NOT NULL,
  `stdYear` int NOT NULL,
  `stdAddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_college.student:~6 rows (대략적) 내보내기
INSERT INTO `student` (`stdNo`, `stdName`, `stdHp`, `stdYear`, `stdAddress`) VALUES
	('20201016', '김유신', '010-1234-1001', 3, NULL),
	('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
	('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시'),
	('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
	('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
	('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구'),
	('20220710', '홍길동', '010-1234-1007', 1, '부산지 진구');


-- java1_hospital 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java1_hospital` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `java1_hospital`;

-- 테이블 java1_hospital.charts 구조 내보내기
CREATE TABLE IF NOT EXISTS `charts` (
  `chart_id` char(8) NOT NULL,
  `treat_no` int NOT NULL,
  `doc_id` char(7) NOT NULL,
  `pat_id` char(7) NOT NULL,
  `chart_contents` varchar(255) NOT NULL,
  PRIMARY KEY (`chart_id`,`treat_no`,`doc_id`,`pat_id`),
  KEY `fk_Charts_Treatments1_idx` (`treat_no`,`doc_id`,`pat_id`),
  CONSTRAINT `fk_Charts_Treatments1` FOREIGN KEY (`treat_no`, `doc_id`, `pat_id`) REFERENCES `treatments` (`treat_no`, `doc_id`, `pat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_hospital.charts:~11 rows (대략적) 내보내기
INSERT INTO `charts` (`chart_id`, `treat_no`, `doc_id`, `pat_id`, `chart_contents`) VALUES
	('C1021001', 1021001, 'D102101', 'P102101', '감기 주사 및 약 처방'),
	('C1021003', 1021003, 'D102104', 'P102102', '위내시경'),
	('C1021009', 1021009, 'D102104', 'P102103', '주사 처방'),
	('C1031002', 1031002, 'D103101', 'P103101', '입원 치료'),
	('C1031006', 1031006, 'D103101', 'P103102', '목 견인치료'),
	('C1041004', 1041004, 'D104101', 'P104101', '피부 감염 방지 주사'),
	('C1041007', 1041007, 'D104101', 'P104102', '여드름 치료약 처방'),
	('C1041012', 1041012, 'D104101', 'P104103', '화상 크림약 처방'),
	('C1051005', 1051005, 'D105101', 'P105101', '비염 치료'),
	('C1051011', 1051011, 'D105101', 'P105102', '귀 청소 및 약 처방'),
	('C1071010', 1071010, 'D107104', 'P107101', 'MRI 검사'),
	('C1081008', 1081008, 'D108101', 'P108101', '발목 깁스');

-- 테이블 java1_hospital.departments 구조 내보내기
CREATE TABLE IF NOT EXISTS `departments` (
  `dep_no` char(3) NOT NULL,
  `dep_name` varchar(20) NOT NULL,
  `dep_manager` varchar(20) NOT NULL,
  `dep_tel` varchar(20) NOT NULL,
  PRIMARY KEY (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_hospital.departments:~12 rows (대략적) 내보내기
INSERT INTO `departments` (`dep_no`, `dep_name`, `dep_manager`, `dep_tel`) VALUES
	('101', '소아과', '김유신', '051-123-0101'),
	('102', '내과', '김춘추', '051-123-0102'),
	('103', '외과', '장보고', '051-123-0103'),
	('104', '피부과', '선덕여왕', '051-123-0104'),
	('105', '이비인후과', '강감찬', '051-123-0105'),
	('106', '산부인과', '신사임당', '051-123-0106'),
	('107', '흉부외과', '류성룡', '051-123-0107'),
	('108', '정형외과', '송상현', '051-123-0108'),
	('109', '신경외과', '이순신', '051-123-0109'),
	('110', '비뇨기과', '정약용', '051-123-0110'),
	('111', '안과', '박지원', '051-123-0111'),
	('112', '치과', '전봉준', '051-123-0112');

-- 테이블 java1_hospital.doctors 구조 내보내기
CREATE TABLE IF NOT EXISTS `doctors` (
  `doc_id` char(7) NOT NULL,
  `doc_name` varchar(45) NOT NULL,
  `doc_birth` varchar(10) NOT NULL,
  `doc_gen` char(1) NOT NULL,
  `dep_no` char(3) NOT NULL,
  `doc_pos` varchar(45) NOT NULL,
  `doc_phone` varchar(20) NOT NULL,
  `doc_email` varchar(45) NOT NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_email_UNIQUE` (`doc_email`),
  UNIQUE KEY `doc_phone_UNIQUE` (`doc_phone`),
  KEY `fk_Doctors_Departments_idx` (`dep_no`),
  CONSTRAINT `fk_Doctors_Departments` FOREIGN KEY (`dep_no`) REFERENCES `departments` (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_hospital.doctors:~12 rows (대략적) 내보내기
INSERT INTO `doctors` (`doc_id`, `doc_name`, `doc_birth`, `doc_gen`, `dep_no`, `doc_pos`, `doc_phone`, `doc_email`) VALUES
	('D101101', '김유신', '1976-01-21', 'M', '101', '과장', '010-1101-1976', 'kimys@bw.com'),
	('D101102', '계백', '1975-06-11', 'M', '101', '전문의', '010-1102-1975', 'gaeback@bw.com'),
	('D101103', '김관창', '1989-05-30', 'M', '101', '전문의', '010-1103-1989', 'kwanch@bw.com'),
	('D102101', '김춘추', '1979-04-13', 'M', '102', '과장', '010-2101-1979', 'kimcc@bw.com'),
	('D102104', '이사부', '1966-09-12', 'M', '102', '전문의', '010-2104-1966', 'leesabu@bw.com'),
	('D103101', '장보고', '1979-07-28', 'M', '103', '과장', '010-3101-1979', 'jangbg@bw.com'),
	('D104101', '선덕여왕', '1984-06-15', 'F', '104', '과장', '010-4101-1984', 'gueen@bw.com'),
	('D105101', '강감찬', '1965-10-21', 'M', '105', '과장', '010-5101-1965', 'kang@bw.com'),
	('D106101', '신사임당', '1972-11-28', 'F', '106', '과장', '010-6101-1972', 'sinsa@bw.com'),
	('D107103', '이이', '1992-09-07', 'M', '107', '전문의', '010-7103-1992', 'leelee@bw.com'),
	('D107104', '이황', '1989-12-09', 'M', '107', '전문의', '010-7104-1989', 'hwang@bw.com'),
	('D108101', '송상현', '1997-03-14', 'M', '108', '과장', '010-8101-1977', 'ssh@bw.com');

-- 테이블 java1_hospital.nurse 구조 내보내기
CREATE TABLE IF NOT EXISTS `nurse` (
  `nur_id` char(7) NOT NULL,
  `nur_name` varchar(45) NOT NULL,
  `nur_birth` char(10) NOT NULL,
  `nur_gender` char(1) NOT NULL,
  `dep_no` char(3) NOT NULL,
  `nur_pos` varchar(45) NOT NULL,
  `nur_phone` char(13) NOT NULL,
  `nur_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nur_id`),
  UNIQUE KEY `nur_phone_UNIQUE` (`nur_phone`),
  UNIQUE KEY `nur_email_UNIQUE` (`nur_email`),
  KEY `fk_Nurse_Departments1_idx` (`dep_no`),
  CONSTRAINT `fk_Nurse_Departments1` FOREIGN KEY (`dep_no`) REFERENCES `departments` (`dep_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_hospital.nurse:~10 rows (대략적) 내보내기
INSERT INTO `nurse` (`nur_id`, `nur_name`, `nur_birth`, `nur_gender`, `dep_no`, `nur_pos`, `nur_phone`, `nur_email`) VALUES
	('N101101', '송승헌', '1976-02-21', 'M', '101', '수간호사', '010-1101-7602', 'ssh@bw.com'),
	('N102101', '이영애', '1975-07-11', 'F', '102', ' 수간호사', '010-1101-7507', 'yung@bw.com'),
	('N102102', '엄정화', '1989-06-30', 'F', '102', '주임', '010-1103-8906', 'um@bw.com'),
	('N102103', '박명수', '1979-05-13', 'M', '102', '주임', '010-2101-7905', 'park@bw.com'),
	('N103101', '정준하', '1966-10-12', 'M', '103', '주임', '010-2104-6610', 'jung@bw.com'),
	('N104101', '김태희', '1979-08-28', 'F', '104', '주임', '010-3101-7908', 'taeh@bw.com'),
	('N105101', '송혜교', '1984-07-15', 'F', '105', '주임', '010-4101-8407', 'song@bw.com'),
	('N106101', '공유', '1965-11-21', 'M', '106', '간호사', '010-5101-6511', 'gong@bw.com'),
	('N107101', '이병헌', '1972-12-28', 'M', '107', '간호사', '010-6101-7212', 'byung@bw.com'),
	('N108101', '송중기', '1992-10-07', 'M', '108', '간호사', '010-7103-9210', 'jungi@bw.com');

-- 테이블 java1_hospital.patients 구조 내보내기
CREATE TABLE IF NOT EXISTS `patients` (
  `pat_id` char(7) NOT NULL,
  `doc_id` char(7) NOT NULL,
  `nur_id` char(7) NOT NULL,
  `pat_name` varchar(45) NOT NULL,
  `pat_jumin` char(14) NOT NULL,
  `pat_gen` char(1) NOT NULL,
  `pat_addr` varchar(100) NOT NULL,
  `pat_phone` varchar(45) NOT NULL,
  `pat_email` varchar(45) DEFAULT NULL,
  `pat_job` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pat_id`),
  UNIQUE KEY `pat_jumin_UNIQUE` (`pat_jumin`),
  UNIQUE KEY `pat_phone_UNIQUE` (`pat_phone`),
  UNIQUE KEY `pat_email_UNIQUE` (`pat_email`),
  KEY `fk_Patients_Nurse1_idx` (`nur_id`),
  KEY `fk_Patients_Doctors1_idx` (`doc_id`),
  CONSTRAINT `fk_Patients_Doctors1` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`),
  CONSTRAINT `fk_Patients_Nurse1` FOREIGN KEY (`nur_id`) REFERENCES `nurse` (`nur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_hospital.patients:~12 rows (대략적) 내보내기
INSERT INTO `patients` (`pat_id`, `doc_id`, `nur_id`, `pat_name`, `pat_jumin`, `pat_gen`, `pat_addr`, `pat_phone`, `pat_email`, `pat_job`) VALUES
	('P102101', 'D102101', 'N102101', '정우성', '760121-1234567', 'M', '서울', '010-1101-7601', NULL, '배우'),
	('P102102', 'D102104', 'N102103', '전지현', '890530-1234567', 'F', '대전', '010-1103-8905', 'jjh@naver.com', '자영업'),
	('P102103', 'D102104', 'N102102', '유재석', '721128-1234567', 'M', '부산', '010-6101-7211', NULL, '개그맨'),
	('P103101', 'D103101', 'N103101', '이정재', '750611-1234567', 'M', '서울', '010-1102-7506', NULL, '배우'),
	('P103102', 'D103101', 'N103101', '장동건', '790728-1234567', 'M', '대구', '010-3101-7907', 'jang@naver.com', '배우'),
	('P104101', 'D104101', 'N104101', '이나영', '790413-1234567', 'F', '대전', '010-2101-7904', 'lee@naver.com', '회사원'),
	('P104102', 'D104101', 'N104101', '고소영', '840615-1234567', 'F', '대구', '010-4101-8406', 'goso@daum.net', '회사원'),
	('P104103', 'D104101', 'N104101', '강동원', '770314-1234567', 'M', '광주', '010-8101-7703', 'dong@naver.com', '배우'),
	('P105101', 'D105101', 'N105101', '원빈', '660912-1234567', 'M', '대전', '010-2104-6609', 'one@daum.net', '배우'),
	('P105102', 'D105101', 'N105101', '조인성', '891209-1234567', 'M', '광주', '010-7104-8912', 'join@gmail.com', '배우'),
	('P107101', 'D107104', 'N107101', '강호동', '920907-1234567', 'M', '부산', '010-7103-9209', NULL, '개그맨'),
	('P108101', 'D108101', 'N108101', '김연아', '651021-1234567', 'F', '대구', '010-5101-6510', 'yuna@daum.net', '운동선수');

-- 테이블 java1_hospital.treatments 구조 내보내기
CREATE TABLE IF NOT EXISTS `treatments` (
  `treat_no` int NOT NULL,
  `doc_id` char(7) NOT NULL,
  `pat_id` char(7) NOT NULL,
  `treat_contents` varchar(255) NOT NULL,
  `treat_datetime` datetime NOT NULL,
  PRIMARY KEY (`treat_no`,`doc_id`,`pat_id`),
  KEY `fk_Treatments_Doctors1_idx` (`doc_id`),
  KEY `fk_Treatments_Patients1_idx` (`pat_id`),
  CONSTRAINT `fk_Treatments_Doctors1` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`),
  CONSTRAINT `fk_Treatments_Patients1` FOREIGN KEY (`pat_id`) REFERENCES `patients` (`pat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_hospital.treatments:~12 rows (대략적) 내보내기
INSERT INTO `treatments` (`treat_no`, `doc_id`, `pat_id`, `treat_contents`, `treat_datetime`) VALUES
	(1021001, 'D102101', 'P102101', '감기, 몸살', '2022-09-08 13:27:38'),
	(1021003, 'D102104', 'P102102', '위염, 장염', '2022-09-08 13:27:38'),
	(1021009, 'D102104', 'P102103', '소화불량', '2022-09-08 13:27:38'),
	(1031002, 'D103101', 'P103101', '교통사고 외상', '2022-09-08 13:27:38'),
	(1031006, 'D103101', 'P103102', '목 디스크', '2022-09-08 13:27:38'),
	(1041004, 'D104101', 'P104101', '피부 트러블', '2022-09-08 13:27:38'),
	(1041007, 'D104101', 'P104102', '여드름', '2022-09-08 13:27:38'),
	(1041012, 'D104101', 'P104103', '팔목 화상', '2022-09-08 13:27:38'),
	(1051005, 'D105101', 'P105101', '코막힘 및 비염', '2022-09-08 13:27:38'),
	(1051011, 'D105101', 'P105102', '귀 이명', '2022-09-08 13:27:38'),
	(1071010, 'D107104', 'P107101', '가슴통증', '2022-09-08 13:27:38'),
	(1081008, 'D108101', 'P108101', '오른쪽 발목 뼈 골절', '2022-09-08 13:27:38');


-- java1_shop 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java1_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `java1_shop`;

-- 테이블 java1_shop.customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `customer` (
  `custID` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `hp` char(13) DEFAULT NULL,
  `addr` varchar(10) DEFAULT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`custID`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_shop.customer:~9 rows (대략적) 내보내기
INSERT INTO `customer` (`custID`, `name`, `hp`, `addr`, `rdate`) VALUES
	('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01 00:00:00'),
	('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02 00:00:00'),
	('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03 00:00:00'),
	('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04 00:00:00'),
	('c105', '이성계', NULL, NULL, '2022-01-05 00:00:00'),
	('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06 00:00:00'),
	('c107', '허준', NULL, NULL, '2022-01-07 00:00:00'),
	('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08 00:00:00'),
	('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09 00:00:00'),
	('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10 00:00:00');

-- 테이블 java1_shop.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `orderNo` tinyint NOT NULL,
  `orderId` varchar(10) NOT NULL,
  `orderProduct` tinyint NOT NULL,
  `orderCount` tinyint NOT NULL,
  `orderDate` datetime NOT NULL,
  PRIMARY KEY (`orderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_shop.order:~10 rows (대략적) 내보내기
INSERT INTO `order` (`orderNo`, `orderId`, `orderProduct`, `orderCount`, `orderDate`) VALUES
	(1, 'c102', 3, 2, '2022-07-01 13:15:10'),
	(2, 'c101', 4, 1, '2022-07-01 14:16:11'),
	(3, 'c108', 1, 1, '2022-07-01 17:23:18'),
	(4, 'c109', 6, 5, '2022-07-02 10:46:36'),
	(5, 'c102', 2, 1, '2022-07-03 09:15:37'),
	(6, 'c101', 7, 3, '2022-07-03 12:35:12'),
	(7, 'c110', 1, 2, '2022-07-03 16:55:36'),
	(8, 'c104', 2, 4, '2022-07-04 14:23:23'),
	(9, 'c102', 1, 3, '2022-07-04 21:54:34'),
	(10, 'c107', 6, 1, '2022-07-05 14:21:03');

-- 테이블 java1_shop.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `prodNo` tinyint NOT NULL,
  `prodName` varchar(10) NOT NULL,
  `stock` int NOT NULL,
  `price` int DEFAULT NULL,
  `company` varchar(10) NOT NULL,
  PRIMARY KEY (`prodNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1_shop.product:~7 rows (대략적) 내보내기
INSERT INTO `product` (`prodNo`, `prodName`, `stock`, `price`, `company`) VALUES
	(1, '새우깡', 5000, 1500, '농심'),
	(2, '초코파이', 2500, 2500, '오리온'),
	(3, '포카칩', 3600, 1700, '오리온'),
	(4, '양파링', 1250, 1800, '농심'),
	(5, '죠리퐁', 2200, NULL, '크라운'),
	(6, '마카렛트', 3500, 3500, '롯데'),
	(7, '뿌셔뿌셔', 1650, 1200, '오뚜기');


-- java1_shoppingmall 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java1_shoppingmall` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `java1_shoppingmall`;

-- 테이블 java1_shoppingmall.carts 구조 내보내기
CREATE TABLE IF NOT EXISTS `carts` (
  `cartNo` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) NOT NULL,
  `prodNo` int NOT NULL,
  `cartProdCount` int DEFAULT '1',
  `cartProdDate` datetime NOT NULL,
  PRIMARY KEY (`cartNo`,`userID`,`prodNo`),
  KEY `fk_Carts_Users1_idx` (`userID`),
  KEY `fk_Carts_Products1_idx` (`prodNo`),
  CONSTRAINT `fk_Carts_Products1` FOREIGN KEY (`prodNo`) REFERENCES `products` (`prodNo`),
  CONSTRAINT `fk_Carts_Users1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_shoppingmall.carts:~10 rows (대략적) 내보내기
INSERT INTO `carts` (`cartNo`, `userID`, `prodNo`, `cartProdCount`, `cartProdDate`) VALUES
	(1, 'user1', 100101, 1, '2022-09-16 13:26:26'),
	(2, 'user1', 100110, 2, '2022-09-16 13:26:26'),
	(3, 'user3', 120103, 1, '2022-09-16 13:26:26'),
	(4, 'user4', 130112, 1, '2022-09-16 13:26:26'),
	(5, 'user5', 130101, 1, '2022-09-16 13:26:26'),
	(6, 'user2', 110101, 3, '2022-09-16 13:26:26'),
	(7, 'user2', 160103, 1, '2022-09-16 13:26:26'),
	(8, 'user2', 170115, 1, '2022-09-16 13:26:26'),
	(9, 'user3', 110101, 1, '2022-09-16 13:26:26'),
	(10, 'user6', 130101, 1, '2022-09-16 13:26:26');

-- 테이블 java1_shoppingmall.categories 구조 내보내기
CREATE TABLE IF NOT EXISTS `categories` (
  `cateNo` int NOT NULL,
  `cateName` varchar(45) NOT NULL,
  PRIMARY KEY (`cateNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_shoppingmall.categories:~10 rows (대략적) 내보내기
INSERT INTO `categories` (`cateNo`, `cateName`) VALUES
	(10, '여성의류패션'),
	(11, '남성의류패션'),
	(12, '식품·생필품'),
	(13, '취미·반려견'),
	(14, '홈·문구'),
	(15, '자동차·공구'),
	(16, '스포츠·건강'),
	(17, '컴퓨터·가전·디지털'),
	(18, '여행'),
	(19, '도서');

-- 테이블 java1_shoppingmall.orderitems 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderitems` (
  `itemNo` int NOT NULL AUTO_INCREMENT,
  `orderNo` char(12) NOT NULL,
  `prodNo` int NOT NULL,
  `itemPrice` int NOT NULL,
  `itemDiscount` tinyint NOT NULL,
  `itemCount` int DEFAULT '1',
  PRIMARY KEY (`itemNo`,`orderNo`,`prodNo`),
  KEY `fk_OrderItems_Orders1_idx` (`orderNo`),
  KEY `fk_OrderItems_Products1_idx` (`prodNo`),
  CONSTRAINT `fk_OrderItems_Orders1` FOREIGN KEY (`orderNo`) REFERENCES `orders` (`orderNo`),
  CONSTRAINT `fk_OrderItems_Products1` FOREIGN KEY (`prodNo`) REFERENCES `products` (`prodNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_shoppingmall.orderitems:~13 rows (대략적) 내보내기
INSERT INTO `orderitems` (`itemNo`, `orderNo`, `prodNo`, `itemPrice`, `itemDiscount`, `itemCount`) VALUES
	(1, '22010210001', 100110, 38000, 15, 1),
	(2, '22010210001', 100101, 25000, 20, 1),
	(3, '22010210002', 120103, 21000, 10, 3),
	(4, '22010310001', 130112, 15000, 0, 1),
	(5, '22010310001', 130101, 56000, 0, 2),
	(6, '22010210010', 110101, 76000, 5, 1),
	(7, '22010310100', 160103, 120000, 0, 1),
	(8, '22010410101', 170115, 900000, 12, 1),
	(9, '22010510021', 110101, 76000, 5, 1),
	(10, '22010510027', 130101, 56000, 0, 2),
	(11, '22010510021', 100101, 25000, 20, 1),
	(12, '22010510031', 170115, 900000, 12, 1),
	(13, '22010710110', 120103, 21000, 10, 5);

-- 테이블 java1_shoppingmall.orders 구조 내보내기
CREATE TABLE IF NOT EXISTS `orders` (
  `orderNo` char(12) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `orderTotalPrice` int NOT NULL,
  `orderAddr` varchar(255) NOT NULL,
  `orderStatus` tinyint DEFAULT '0',
  `orderDate` datetime NOT NULL,
  PRIMARY KEY (`orderNo`,`userID`),
  KEY `fk_Orders_Users_idx` (`userID`),
  CONSTRAINT `fk_Orders_Users` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_shoppingmall.orders:~10 rows (대략적) 내보내기
INSERT INTO `orders` (`orderNo`, `userID`, `orderTotalPrice`, `orderAddr`, `orderStatus`, `orderDate`) VALUES
	('22010210001', 'user2', 52300, '서울시 마포구 121', 1, '2022-09-16 13:19:33'),
	('22010210002', 'user3', 56700, '서울시 강남구 21-1', 1, '2022-09-16 13:19:33'),
	('22010210010', 'user4', 72200, '서울시 강서구 큰대로 38', 2, '2022-09-16 13:19:33'),
	('22010310001', 'user5', 127000, '경기도 광주시 초월로 21', 1, '2022-09-16 13:19:33'),
	('22010310100', 'user1', 120000, '경기도 수원시 120번지', 0, '2022-09-16 13:19:33'),
	('22010410101', 'user6', 792000, '부산시 남구 21-1', 2, '2022-09-16 13:19:33'),
	('22010510021', 'user7', 92200, '부산시 부산진구 56 10층', 4, '2022-09-16 13:19:33'),
	('22010510027', 'user8', 112000, '대구시 팔달로 19', 3, '2022-09-16 13:19:33'),
	('22010510031', 'user10', 792000, '대전시 한밭로 24-1', 2, '2022-09-16 13:19:33'),
	('22010710110', 'user9', 94500, '광주시 충열로 11', 1, '2022-09-16 13:19:33');

-- 테이블 java1_shoppingmall.points 구조 내보내기
CREATE TABLE IF NOT EXISTS `points` (
  `pointNo` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(20) NOT NULL,
  `point` int NOT NULL,
  `pointDesc` varchar(45) NOT NULL,
  `pointDate` datetime NOT NULL,
  PRIMARY KEY (`pointNo`,`userID`),
  KEY `fk_Points_Users1_idx` (`userID`),
  CONSTRAINT `fk_Points_Users1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_shoppingmall.points:~10 rows (대략적) 내보내기
INSERT INTO `points` (`pointNo`, `userID`, `point`, `pointDesc`, `pointDate`) VALUES
	(1, 'user1', 1000, '회원가입 1000 적립', '2022-09-16 13:19:33'),
	(2, 'user1', 6000, '상품구매 5% 적립', '2022-09-16 13:19:33'),
	(3, 'user3', 2835, '상품구매 5% 적립', '2022-09-16 13:19:33'),
	(4, 'user7', 3610, '상품구매 5% 적립', '2022-09-16 13:19:33'),
	(5, 'user5', 3000, '이벤트 응모 3000 적립', '2022-09-16 13:19:33'),
	(6, 'user2', 1000, '회원가입 1000 적립', '2022-09-16 13:19:33'),
	(7, 'user2', 2000, '이벤트 응모 2000 적립', '2022-09-16 13:19:33'),
	(8, 'user2', 2615, '상품구매 5% 적립', '2022-09-16 13:19:33'),
	(9, 'user3', 1500, '이벤트 응모 1500 적립', '2022-09-16 13:19:33'),
	(10, 'user6', 15840, '상품구매 2% 적립', '2022-09-16 13:19:33');

-- 테이블 java1_shoppingmall.products 구조 내보내기
CREATE TABLE IF NOT EXISTS `products` (
  `prodNo` int NOT NULL,
  `cateNo` int NOT NULL,
  `sellerNo` int NOT NULL,
  `prodName` varchar(20) NOT NULL,
  `prodPrice` int NOT NULL,
  `prodStock` int DEFAULT '0',
  `prodSold` int DEFAULT '0',
  `prodDiscount` tinyint DEFAULT '0',
  PRIMARY KEY (`prodNo`,`cateNo`),
  KEY `fk_Products_Categories1_idx` (`cateNo`),
  KEY `fk_Products_Sellers1_idx` (`sellerNo`),
  CONSTRAINT `fk_Products_Categories1` FOREIGN KEY (`cateNo`) REFERENCES `categories` (`cateNo`),
  CONSTRAINT `fk_Products_Sellers1` FOREIGN KEY (`sellerNo`) REFERENCES `sellers` (`sellerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_shoppingmall.products:~10 rows (대략적) 내보내기
INSERT INTO `products` (`prodNo`, `cateNo`, `sellerNo`, `prodName`, `prodPrice`, `prodStock`, `prodSold`, `prodDiscount`) VALUES
	(100101, 11, 10003, '반팔티 L~2XL', 869, 25000, 132, 20),
	(100110, 10, 10004, '트레이닝 통바지', 1602, 38000, 398, 15),
	(110101, 10, 10003, '신상 여성운동화', 160, 76000, 40, 5),
	(120101, 12, 10010, '암소 1등급 구이셋트 1.2kg', 0, 150000, 87, 15),
	(120103, 12, 10010, '바로구이 부채살 250g', 0, 21000, 61, 10),
	(130101, 13, 10006, '[ANF] 식스프리 강아지 사료', 58, 56000, 142, 0),
	(130112, 13, 10006, '중대형 사계절 강아지옷', 120, 15000, 80, 0),
	(141001, 14, 10001, '라떼 2인 소피/방수 패브릭', 0, 320000, 42, 0),
	(160103, 16, 10009, '치닝디핑 33BR 철봉', 32, 120000, 28, 0),
	(170115, 17, 10007, '지포스 3080 그래픽 카드', 28, 900000, 12, 12);

-- 테이블 java1_shoppingmall.sellers 구조 내보내기
CREATE TABLE IF NOT EXISTS `sellers` (
  `sellerNo` int NOT NULL,
  `sellerBizName` varchar(45) NOT NULL,
  `sellerPhone` varchar(20) NOT NULL,
  `sellerManager` varchar(20) NOT NULL,
  `sellerAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`sellerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_shoppingmall.sellers:~10 rows (대략적) 내보내기
INSERT INTO `sellers` (`sellerNo`, `sellerBizName`, `sellerPhone`, `sellerManager`, `sellerAddr`) VALUES
	(10001, '(주)다팔아', '01-201-1976', '정우성', '서울'),
	(10002, '판매의민족', '02-102-1975', '이정재', '서울'),
	(10003, '멋남', '031-103-1989', '원빈', '경기'),
	(10004, '스타일살아', '032-201-1979', '이나영', '경기'),
	(10005, '(주)삼성전자', '02-214-1966', '장동건', '서울'),
	(10006, '복실이옷짱', '051-301-1979', '고소영', '부산'),
	(10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구'),
	(10008, '(주)LG전자', '02-511-1965', '강호동', '서울'),
	(10009, '굿바디스포츠', '080-6101-1972', '조인성', '부산'),
	(10010, '누리푸드', '051-710-1992', '강동원', '부산');

-- 테이블 java1_shoppingmall.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `userID` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userBirth` varchar(45) NOT NULL,
  `userGender` char(1) NOT NULL,
  `userHp` char(13) NOT NULL,
  `userEmail` varchar(45) DEFAULT NULL,
  `userPoint` int DEFAULT '0',
  `userLevel` tinyint DEFAULT '1',
  `userAddr` varchar(100) DEFAULT NULL,
  `userRegDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userHp_UNIQUE` (`userHp`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_shoppingmall.users:~10 rows (대략적) 내보내기
INSERT INTO `users` (`userID`, `userName`, `userBirth`, `userGender`, `userHp`, `userEmail`, `userPoint`, `userLevel`, `userAddr`, `userRegDate`) VALUES
	('user1', '김유신', '1976-01-21', 'M', '010-1101-1976', 'kimys@naver.com', 0, 1, '서울', '2022-09-16 13:19:33'),
	('user10', '허난설헌', '1992-09-07', 'F', '010-7103-1992', NULL, 4100, 3, '광주', '2022-09-16 13:19:33'),
	('user2', '계백', '1975-06-11', 'M', '010-1102-1975', NULL, 1000, 1, '서울', '2022-09-16 13:19:33'),
	('user3', '김춘추', '1989-05-30', 'M', '010-1103-1989', NULL, 1200, 2, '서울', '2022-09-16 13:19:33'),
	('user4', '이사부', '1979-04-13', 'M', '010-2101-1979', 'leesabu@gmail.com', 2600, 1, '서울', '2022-09-16 13:19:33'),
	('user5', '장보고', '1966-09-12', 'M', '010-2104-1966', 'jangbg@naver.com', 9400, 4, '대전', '2022-09-16 13:19:33'),
	('user6', '선덕여왕', '1979-07-28', 'F', '010-3101-1979', 'gueen@naver.com', 1600, 2, '대전', '2022-09-16 13:19:33'),
	('user7', '강감찬', '1984-06-15', 'M', '010-4101-1984', 'kang@daum.net', 800, 0, '대구', '2022-09-16 13:19:33'),
	('user8', '신사임당', '1965-10-21', 'F', '010-5101-1965', 'sinsa@gmail.com', 1500, 1, '대구', '2022-09-16 13:19:33'),
	('user9', '이이', '1972-11-28', 'M', '010-6101-1972', 'leelee@nete.com', 3400, 3, '부산', '2022-09-16 13:19:33');


-- java1_university 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java1_university` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `java1_university`;

-- 테이블 java1_university.departments 구조 내보내기
CREATE TABLE IF NOT EXISTS `departments` (
  `depNo` char(2) NOT NULL,
  `depName` varchar(20) NOT NULL,
  `depTel` char(14) NOT NULL,
  PRIMARY KEY (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_university.departments:~11 rows (대략적) 내보내기
INSERT INTO `departments` (`depNo`, `depName`, `depTel`) VALUES
	('10', '국어국문학과', '051-510-1010'),
	('11', '영어영문학과', '051-510-1011'),
	('20', '경영학과', '051-510-1020'),
	('21', '경제학과', '051-510-1021'),
	('22', '정치외교학과', '051-510-1022'),
	('23', '사회복지학과', '051-510-1023'),
	('30', '수학과', '051-510-1030'),
	('31', '통계학과', '051-510-1031'),
	('32', '생명과학과', '051-510-1032'),
	('40', '기계공학과', '051-510-1040'),
	('41', '전자공학과', '051-510-1041'),
	('42', '컴퓨터공학과', '051-510-1042');

-- 테이블 java1_university.lectures 구조 내보내기
CREATE TABLE IF NOT EXISTS `lectures` (
  `lecNo` char(6) NOT NULL,
  `proNo` char(6) NOT NULL,
  `lecName` varchar(45) NOT NULL,
  `lecCredit` tinyint NOT NULL,
  `lecTime` tinyint NOT NULL,
  `lecClass` varchar(45) NOT NULL,
  PRIMARY KEY (`lecNo`,`proNo`),
  KEY `fk_Lectures_Professors1_idx` (`proNo`),
  CONSTRAINT `fk_Lectures_Professors1` FOREIGN KEY (`proNo`) REFERENCES `professors` (`proNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_university.lectures:~10 rows (대략적) 내보내기
INSERT INTO `lectures` (`lecNo`, `proNo`, `lecName`, `lecCredit`, `lecTime`, `lecClass`) VALUES
	('101001', 'P10101', '대학 글쓰기', 2, 10, '본102'),
	('101002', 'P10102', '한국어음운론', 3, 30, '본102'),
	('101003', 'P10102', '한국현대문학사', 3, 30, '본103'),
	('111011', 'P11103', '중세영문학', 3, 25, '본201'),
	('111012', 'P11104', '영미시', 3, 25, '본201'),
	('231110', 'P23102', '사회복지학개론', 1, 8, '별관103'),
	('311002', 'P31101', '통계학의 이해', 2, 16, '별관303'),
	('311003', 'P31104', '기초 통계학', 3, 26, '별관303'),
	('401019', 'P40101', '기계역학', 3, 36, '공학관 102'),
	('421012', 'P42103', '데이터베이스', 3, 32, '공학관 103');

-- 테이블 java1_university.professors 구조 내보내기
CREATE TABLE IF NOT EXISTS `professors` (
  `proNo` char(6) NOT NULL,
  `depNo` char(2) NOT NULL,
  `proName` varchar(20) NOT NULL,
  `proJumiin` char(14) NOT NULL,
  `proHp` char(13) NOT NULL,
  `proEmail` varchar(45) NOT NULL,
  `proAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`proNo`),
  UNIQUE KEY `proJumiin_UNIQUE` (`proJumiin`),
  UNIQUE KEY `proHp_UNIQUE` (`proHp`),
  KEY `fk_Professors_Departments1_idx` (`depNo`),
  CONSTRAINT `fk_Professors_Departments1` FOREIGN KEY (`depNo`) REFERENCES `departments` (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_university.professors:~11 rows (대략적) 내보내기
INSERT INTO `professors` (`proNo`, `depNo`, `proName`, `proJumiin`, `proHp`, `proEmail`, `proAddr`) VALUES
	('P10101', '10', '김유신', '750120-1234567', '010-1101-1976', 'kimys@hg.ac.kr', '서울'),
	('P10102', '10', '계백', '740610-1234567', '010-1102-1975', 'gaeback@hg.ac.kr', '서울'),
	('P11101', '11', '김관창', '880529-1234567', '010-1103-1989', 'kwanch@hg.ac.kr', '대전'),
	('P11103', '11', '김춘추', '780412-1234567', '010-2101-1979', 'kimcc@hg.ac.kr', '대전'),
	('P11104', '11', '이사부', '650911-1234567', '010-2104-1966', 'leesabu@hg.ac.kr', '대전'),
	('P22110', '22', '장보고', '780727-1234567', '010-3101-1979', 'jangbg@hg.ac.kr', '대구'),
	('P23102', '23', '선덕여왕', '830614-1234567', '010-4101-1984', 'gueen@hg.ac.kr', '대구'),
	('P31101', '31', '강감찬', '641020-1234567', '010-5101-1965', 'kang@hg.ac.kr', '대구'),
	('P31104', '31', '신사임당', '711127-1234567', '010-6101-1972', 'sinsa@hg.ac.kr', '부산'),
	('P40101', '40', '이이', '910906-1234567', '010-7103-1992', 'leelee@hg.ac.kr', '부산'),
	('P40102', '40', '이황', '881208-1234567', '010-7104-1989', 'hwang@hg.ac.kr', '광주'),
	('P42103', '42', '송상현', '760313-1234567', '010-8101-1997', 'ssh@hg.ac.kr', '광주');

-- 테이블 java1_university.register 구조 내보내기
CREATE TABLE IF NOT EXISTS `register` (
  `stdNo` char(8) NOT NULL,
  `lecNo` char(6) NOT NULL,
  `proNo` char(6) NOT NULL,
  `regAttenScore` tinyint DEFAULT NULL,
  `regMidScore` tinyint DEFAULT NULL,
  `regFinalScore` tinyint DEFAULT NULL,
  `regEtcScore` tinyint DEFAULT NULL,
  `regTotal` tinyint DEFAULT NULL,
  `regGrade` char(1) DEFAULT NULL,
  PRIMARY KEY (`stdNo`,`lecNo`,`proNo`),
  KEY `fk_Register_Lectures1_idx` (`lecNo`,`proNo`),
  CONSTRAINT `fk_Register_Lectures1` FOREIGN KEY (`lecNo`, `proNo`) REFERENCES `lectures` (`lecNo`, `proNo`),
  CONSTRAINT `fk_Register_Students1` FOREIGN KEY (`stdNo`) REFERENCES `students` (`stdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_university.register:~9 rows (대략적) 내보내기
INSERT INTO `register` (`stdNo`, `lecNo`, `proNo`, `regAttenScore`, `regMidScore`, `regFinalScore`, `regEtcScore`, `regTotal`, `regGrade`) VALUES
	('20101001', '101001', 'P10101', NULL, NULL, NULL, NULL, NULL, NULL),
	('20101001', '101002', 'P10102', NULL, NULL, NULL, NULL, NULL, NULL),
	('20101001', '101003', 'P10102', NULL, NULL, NULL, NULL, NULL, NULL),
	('20111013', '111011', 'P11103', NULL, NULL, NULL, NULL, NULL, NULL),
	('20111013', '111012', 'P11104', NULL, NULL, NULL, NULL, NULL, NULL),
	('21231002', '231110', 'P23102', NULL, NULL, NULL, NULL, NULL, NULL),
	('22401001', '401019', 'P40101', NULL, NULL, NULL, NULL, NULL, NULL),
	('22401001', '421012', 'P42103', NULL, NULL, NULL, NULL, NULL, NULL),
	('22421003', '311003', 'P31104', NULL, NULL, NULL, NULL, NULL, NULL),
	('22421003', '421012', 'P42103', NULL, NULL, NULL, NULL, NULL, NULL);

-- 테이블 java1_university.students 구조 내보내기
CREATE TABLE IF NOT EXISTS `students` (
  `stdNo` char(8) NOT NULL,
  `depNo` char(2) NOT NULL,
  `proNo` char(6) NOT NULL,
  `stdName` varchar(20) NOT NULL,
  `stdJumin` char(14) NOT NULL,
  `stdHp` char(13) NOT NULL,
  `stdEmail` varchar(45) DEFAULT NULL,
  `stdAddr` varchar(100) NOT NULL,
  PRIMARY KEY (`stdNo`),
  UNIQUE KEY `stdHp_UNIQUE` (`stdHp`),
  UNIQUE KEY `stdJumin_UNIQUE` (`stdJumin`),
  UNIQUE KEY `stdEmail_UNIQUE` (`stdEmail`),
  KEY `fk_Students_Professors_idx` (`proNo`),
  KEY `fk_Students_Departments1_idx` (`depNo`),
  CONSTRAINT `fk_Students_Departments1` FOREIGN KEY (`depNo`) REFERENCES `departments` (`depNo`),
  CONSTRAINT `fk_Students_Professors` FOREIGN KEY (`proNo`) REFERENCES `professors` (`proNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 java1_university.students:~11 rows (대략적) 내보내기
INSERT INTO `students` (`stdNo`, `depNo`, `proNo`, `stdName`, `stdJumin`, `stdHp`, `stdEmail`, `stdAddr`) VALUES
	('20101001', '10', 'P10101', '정우성', '760121-1234567', '010-1101-7601', NULL, '서울'),
	('20101002', '10', 'P10101', '이정재', '750611-1234567', '010-1102-7506', NULL, '서울'),
	('20111011', '11', 'P11103', '전지현', '890530-1234567', '010-1103-8905', 'jjh@naver.com', '대전'),
	('20111013', '11', 'P11103', '이나영', '790413-1234567', '010-2101-7904', 'lee@naver.com', '대전'),
	('20111014', '11', 'P11103', '원빈', '660912-1234567', '010-2104-6609', 'one@naver.com', '대전'),
	('21221010', '22', 'P22110', '장동건', '790728-1234567', '010-3101-7907', 'jang@naver.com', '대구'),
	('21231002', '23', 'P23102', '고소영', '840615-1234567', '010-4101-8406', 'goso@daum.net', '대구'),
	('22311011', '31', 'P31104', '김연아', '651021-1234567', '010-5101-6510', 'yuna@daum.net', '대구'),
	('22311014', '31', 'P31104', '유재석', '721128-1234567', '010-6101-7211', NULL, '부산'),
	('22401001', '40', 'P40101', '강호동', '920907-1234567', '010-7103-9209', NULL, '부산'),
	('22401002', '40', 'P40101', '조인성', '891209-1234567', '010-7104-8912', 'join@gmail.com', '광주'),
	('22421003', '42', 'P42103', '강동원', '770314-1234567', '010-8101-7703', 'dong@naver.com', '광주');


-- java1db 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `java1db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `java1db`;

-- 테이블 java1db.book 구조 내보내기
CREATE TABLE IF NOT EXISTS `book` (
  `bno` int DEFAULT NULL,
  `bname` varchar(20) NOT NULL,
  `bpub` varchar(20) DEFAULT NULL,
  `bpric` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.book:~0 rows (대략적) 내보내기

-- 테이블 java1db.child 구조 내보내기
CREATE TABLE IF NOT EXISTS `child` (
  `cid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `pid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `hp` (`hp`),
  KEY `pid` (`pid`),
  CONSTRAINT `child_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.child:~0 rows (대략적) 내보내기
INSERT INTO `child` (`cid`, `name`, `hp`, `pid`) VALUES
	('c101', '이방원', '010-1234-1001', 'p101');

-- 테이블 java1db.department 구조 내보내기
CREATE TABLE IF NOT EXISTS `department` (
  `depNo` tinyint NOT NULL,
  `name` varchar(13) NOT NULL,
  `tel` char(12) NOT NULL,
  PRIMARY KEY (`depNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.department:~7 rows (대략적) 내보내기
INSERT INTO `department` (`depNo`, `name`, `tel`) VALUES
	(101, '영업1부', '051-512-1001'),
	(102, '영업2부', '051-512-1002'),
	(103, '영업3부', '051-512-1003'),
	(104, '영업4부', '051-512-1004'),
	(105, '영업5부', '051-512-1005'),
	(106, '영업지원부', '051-512-1006'),
	(107, '인사부', '051-512-1007');

-- 테이블 java1db.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `uid` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `hp` char(13) NOT NULL,
  `pos` varchar(10) NOT NULL DEFAULT '사원',
  `dep` tinyint DEFAULT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.member:~11 rows (대략적) 내보내기
INSERT INTO `member` (`uid`, `name`, `hp`, `pos`, `dep`, `rdate`) VALUES
	('a101', '박혁거', '010-1234-1001', '사원', 101, '2022-08-24 12:16:47'),
	('a102', '김유신', '010-1234-1002', '차장', 101, '2022-08-24 12:16:47'),
	('a103', '김춘추', '010-1234-1003', '사원', 101, '2022-08-24 12:16:47'),
	('a104', '장보고', '010-1234-1004', '대리', 102, '2022-08-24 12:16:47'),
	('a105', '강감찬', '010-1234-1005', '과장', 102, '2022-08-24 12:16:47'),
	('a106', '이성계', '010-1234-1006', '차장', 103, '2022-08-24 12:16:47'),
	('a107', '정철', '010-1234-1007', '차장', 103, '2022-08-24 12:16:47'),
	('a108', '이순신', '010-1234-1008', '부장', 104, '2022-08-24 12:16:47'),
	('a109', '허균', '010-1234-1009', '부장', 104, '2022-08-24 12:16:47'),
	('a110', '정약용', '010-1234-1010', '사원', 105, '2022-08-24 12:16:47');

-- 테이블 java1db.parent 구조 내보내기
CREATE TABLE IF NOT EXISTS `parent` (
  `pid` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.parent:~0 rows (대략적) 내보내기
INSERT INTO `parent` (`pid`, `name`, `hp`) VALUES
	('p101', '이성계', '010-1234-1111');

-- 테이블 java1db.sales 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `year` year NOT NULL,
  `month` tinyint NOT NULL,
  `sale` int NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.sales:~30 rows (대략적) 내보내기
INSERT INTO `sales` (`seq`, `uid`, `year`, `month`, `sale`) VALUES
	(1, 'a101', '2018', 1, 98100),
	(2, 'a102', '2018', 1, 136000),
	(3, 'a103', '2018', 1, 80100),
	(4, 'a104', '2018', 1, 78000),
	(5, 'a105', '2018', 1, 93000),
	(6, 'a101', '2018', 2, 23500),
	(7, 'a102', '2018', 2, 126000),
	(8, 'a103', '2018', 2, 18500),
	(9, 'a105', '2018', 2, 19000),
	(10, 'a106', '2018', 2, 53000),
	(11, 'a101', '2019', 1, 24000),
	(12, 'a102', '2019', 1, 109000),
	(13, 'a103', '2019', 1, 101000),
	(14, 'a104', '2019', 1, 53500),
	(15, 'a107', '2019', 1, 24000),
	(16, 'a102', '2019', 2, 160000),
	(17, 'a103', '2019', 2, 101000),
	(18, 'a104', '2019', 2, 43000),
	(19, 'a105', '2019', 2, 24000),
	(20, 'a106', '2019', 2, 109000),
	(21, 'a102', '2020', 1, 201000),
	(22, 'a104', '2020', 1, 63000),
	(23, 'a105', '2020', 1, 74000),
	(24, 'a106', '2020', 1, 122000),
	(25, 'a107', '2020', 1, 111000),
	(26, 'a102', '2020', 2, 120000),
	(27, 'a103', '2020', 2, 93000),
	(28, 'a104', '2020', 2, 84000),
	(29, 'a105', '2020', 2, 180000),
	(30, 'a108', '2020', 2, 76000);

-- 테이블 java1db.sales2 구조 내보내기
CREATE TABLE IF NOT EXISTS `sales2` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `year` year NOT NULL,
  `month` tinyint NOT NULL,
  `sale` int NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.sales2:~30 rows (대략적) 내보내기
INSERT INTO `sales2` (`seq`, `uid`, `year`, `month`, `sale`) VALUES
	(1, 'a101', '2021', 1, 98100),
	(2, 'a102', '2021', 1, 136000),
	(3, 'a103', '2021', 1, 80100),
	(4, 'a104', '2021', 1, 78000),
	(5, 'a105', '2021', 1, 93000),
	(6, 'a101', '2021', 2, 23500),
	(7, 'a102', '2021', 2, 126000),
	(8, 'a103', '2021', 2, 18500),
	(9, 'a105', '2021', 2, 19000),
	(10, 'a106', '2021', 2, 53000),
	(11, 'a101', '2022', 1, 24000),
	(12, 'a102', '2022', 1, 109000),
	(13, 'a103', '2022', 1, 101000),
	(14, 'a104', '2022', 1, 53500),
	(15, 'a107', '2022', 1, 24000),
	(16, 'a102', '2022', 2, 160000),
	(17, 'a103', '2022', 2, 101000),
	(18, 'a104', '2022', 2, 43000),
	(19, 'a105', '2022', 2, 24000),
	(20, 'a106', '2022', 2, 109000),
	(21, 'a102', '2023', 1, 201000),
	(22, 'a104', '2023', 1, 63000),
	(23, 'a105', '2023', 1, 74000),
	(24, 'a106', '2023', 1, 122000),
	(25, 'a107', '2023', 1, 111000),
	(26, 'a102', '2023', 2, 120000),
	(27, 'a103', '2023', 2, 93000),
	(28, 'a104', '2023', 2, 84000),
	(29, 'a105', '2023', 2, 180000),
	(30, 'a108', '2023', 2, 76000);

-- 테이블 java1db.tblproduct 구조 내보내기
CREATE TABLE IF NOT EXISTS `tblproduct` (
  `prdCode` int DEFAULT NULL,
  `prdName` varchar(10) DEFAULT NULL,
  `prdPrice` int DEFAULT NULL,
  `prdAmount` int DEFAULT NULL,
  `prdCompany` varchar(10) DEFAULT NULL,
  `prdMakeDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.tblproduct:~6 rows (대략적) 내보내기
INSERT INTO `tblproduct` (`prdCode`, `prdName`, `prdPrice`, `prdAmount`, `prdCompany`, `prdMakeDate`) VALUES
	(1, '냉장고', 800, 10, 'LG', '2022-01-06'),
	(2, '노트북', 1200, 20, '삼성', '2022-01-06'),
	(3, 'TV', 1400, 6, 'LG', '2022-01-06'),
	(4, '세탁기', 1000, 8, 'LG', '2022-01-06'),
	(6, '컴퓨터', 1100, 0, NULL, NULL),
	(6, '휴대폰', 900, 102, '삼성', '2022-01-06');

-- 테이블 java1db.tbluser 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbluser` (
  `userId` varchar(10) DEFAULT NULL,
  `userName` varchar(10) DEFAULT NULL,
  `userHp` char(13) DEFAULT NULL,
  `userAge` tinyint DEFAULT NULL,
  `userAddr` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.tbluser:~8 rows (대략적) 내보내기
INSERT INTO `tbluser` (`userId`, `userName`, `userHp`, `userAge`, `userAddr`) VALUES
	('p101', '김유신', '010-1234-1001', 25, '서울시 중구'),
	('p101', '김춘추', '010-1234-1002', 25, '부산시 금정구'),
	('p104', '강감찬', NULL, 42, '경남 창원시'),
	('p105', '이순신', '010-1234-1005', 50, '경남 김해시'),
	('p101', '김유신', '010-1234-1001', 25, '서울시 중구'),
	('p101', '김춘추', '010-1234-1002', 25, '부산시 금정구'),
	('p104', '강감찬', NULL, 42, '경남 창원시'),
	('p105', '이순신', '010-1234-1005', 50, '경남 김해시');

-- 테이블 java1db.user1 구조 내보내기
CREATE TABLE IF NOT EXISTS `user1` (
  `uid` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.user1:~7 rows (대략적) 내보내기
INSERT INTO `user1` (`uid`, `name`, `hp`, `age`) VALUES
	('A102', '김춘추', '010-1234-2222', 22),
	('a101', '김유신', '010-1234-1001', 23),
	('a101', '김유신', '010-1234-1001', 23),
	('a101', '김유신', '010-1234-1001', 23),
	('a101', '김유신', '010-1234-1001', 23),
	('a101', '김유신', '010-1234-1001', 23);

-- 테이블 java1db.user2 구조 내보내기
CREATE TABLE IF NOT EXISTS `user2` (
  `uid` varchar(20) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.user2:~5 rows (대략적) 내보내기
INSERT INTO `user2` (`uid`, `name`, `hp`, `age`) VALUES
	('a101', '김유신', '010-1234-1001', 25),
	('a102', '김춘추', '010-1234-1002', 23),
	('a103', '김유신', '010-1234-1001', 25),
	('a104', '', '', 12),
	('a105', '홍길동', '010-5555-1001', 12),
	('a106', '', '', 22),
	('b102', '홍길동', '010-5555-1001', 12);

-- 테이블 java1db.user3 구조 내보내기
CREATE TABLE IF NOT EXISTS `user3` (
  `uid` varchar(20) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `hp` (`hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.user3:~4 rows (대략적) 내보내기
INSERT INTO `user3` (`uid`, `name`, `hp`, `age`) VALUES
	('a103', '장보고', '010-1234-1003', 31),
	('a104', '홍길동', '010-1234-1123', 22),
	('j101', '홍길동', '010-1111-1111', 21),
	('j102', '홍길동', '010-1111-1112', 21);

-- 테이블 java1db.user4 구조 내보내기
CREATE TABLE IF NOT EXISTS `user4` (
  `seq` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `birth` char(10) DEFAULT '0000-00-00',
  `gender` tinyint DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.user4:~3 rows (대략적) 내보내기
INSERT INTO `user4` (`seq`, `name`, `birth`, `gender`, `age`, `addr`) VALUES
	(1, '김유신', '0000-00-00', 1, 25, '김해시'),
	(2, '김춘추', '0000-00-00', 1, 23, '경주시'),
	(4, '신사임당', '0000-00-00', 2, 27, '강릉시');

-- 테이블 java1db.user5 구조 내보내기
CREATE TABLE IF NOT EXISTS `user5` (
  `uid` varchar(10) DEFAULT NULL,
  `name` varchar(10) NOT NULL,
  `birth` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.user5:~4 rows (대략적) 내보내기
INSERT INTO `user5` (`uid`, `name`, `birth`, `gender`, `age`, `address`, `hp`) VALUES
	(NULL, '김유신', NULL, NULL, 1, NULL, NULL),
	(NULL, '김춘추', NULL, NULL, 1, '부산시', NULL),
	('a101', '홍길동', '2022-10-06', 1, 21, '서울시', '010-1234-1123');

-- 테이블 java1db.user6 구조 내보내기
CREATE TABLE IF NOT EXISTS `user6` (
  `uid` varchar(10) DEFAULT NULL,
  `name` varchar(10) NOT NULL,
  `age` tinyint DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `hp` char(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 java1db.user6:~0 rows (대략적) 내보내기

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
