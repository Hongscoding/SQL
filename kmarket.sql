-- kmarket 
CREATE DATABASE IF NOT EXISTS `kmarket`;
USE `kmarket`;

CREATE TABLE IF NOT EXISTS `km_cs_cate1` (
  `qnaCate1` tinyint NOT NULL,
  `qc1Name` varchar(20) NOT NULL,
  PRIMARY KEY (`qnaCate1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `km_cs_cate1` (`qnaCate1`, `qc1Name`) VALUES
	(1, '회원'),
	(2, '쿠폰/이벤트');

CREATE TABLE IF NOT EXISTS `km_cs_cate2` (
  `qnaCate1` tinyint NOT NULL,
  `qnaCate2` int NOT NULL,
  `qc2Name` varchar(20) NOT NULL,
  KEY `fk_km_cs_cate2_km_cs_cate1_idx` (`qnaCate1`),
  CONSTRAINT `fk_km_cs_cate2_km_cs_cate11` FOREIGN KEY (`qnaCate1`) REFERENCES `km_cs_cate1` (`qnaCate1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `km_cs_cate2` (`qnaCate1`, `qnaCate2`, `qc2Name`) VALUES
	(1, 1, '가입'),
	(1, 2, '탈퇴'),
	(1, 3, '회원정보'),
	(1, 4, '로그인'),
	(1, 5, '아이디/비밀번호 찾기');

CREATE TABLE IF NOT EXISTS `km_cs_qna` (
  `uid` varchar(20) NOT NULL,
  `qc1Name` varchar(20) NOT NULL,
  `qc2Name` varchar(20) NOT NULL,
  `qnaTitle` varchar(50) NOT NULL,
  `qnaContent` varchar(255) NOT NULL,
  `regip` varchar(100) NOT NULL,
  `wdate` datetime NOT NULL,
  `qnaCond` varchar(10) DEFAULT '검토 중',
  `qnaNo` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`qnaNo`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 kmarket.km_cs_qna:~152 rows (대략적) 내보내기
INSERT INTO `km_cs_qna` (`uid`, `qc1Name`, `qc2Name`, `qnaTitle`, `qnaContent`, `regip`, `wdate`, `qnaCond`, `qnaNo`) VALUES
	('test', '1', '가입', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:27:47', '검토 중', 1),
	('test', '1', '가입', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:28:42', '검토 중', 2),
	('test', '1', '가입', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:28:46', '검토 중', 3),
	('test', '1', '탈퇴', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:28:51', '검토 중', 4),
	('test', '1', '탈퇴', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:28:56', '검토 중', 5),
	('test', '1', '탈퇴', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:29:03', '검토 중', 6),
	('test', '1', '회원정보', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:29:08', '검토 중', 7),
	('test', '1', '탈퇴', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:29:13', '검토 중', 8),
	('test', '1', '탈퇴', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:29:16', '검토 중', 9),
	('test', '1', '회원정보', 'test', 'test', '0:0:0:0:0:0:0:1', '2022-12-13 13:29:21', '검토 중', 10),


CREATE TABLE IF NOT EXISTS `km_member` (
  `uid` varchar(20) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` tinyint NOT NULL,
  `hp` char(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `type` tinyint NOT NULL,
  `point` int DEFAULT '0',
  `level` tinyint DEFAULT '1',
  `zip` varchar(10) DEFAULT NULL,
  `addr1` varchar(255) DEFAULT NULL,
  `addr2` varchar(255) DEFAULT NULL,
  `company` varchar(20) DEFAULT NULL,
  `ceo` varchar(20) DEFAULT NULL,
  `bizRegNum` char(12) DEFAULT NULL,
  `comRegNum` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `manager` varchar(20) DEFAULT NULL,
  `managerHp` char(13) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `regip` varchar(100) NOT NULL,
  `wdate` datetime DEFAULT NULL,
  `rdate` datetime NOT NULL,
  `etc1` int DEFAULT NULL,
  `etc2` int DEFAULT NULL,
  `etc3` varchar(10) DEFAULT NULL,
  `etc4` varchar(20) DEFAULT NULL,
  `etc5` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `km_member_point` (
  `pointNo` int NOT NULL,
  `uid` varchar(20) NOT NULL,
  `ordNo` int NOT NULL,
  `point` int NOT NULL,
  `pointDate` datetime NOT NULL,
  PRIMARY KEY (`pointNo`),
  KEY `fk_km_member_point_km_member_idx` (`uid`),
  KEY `fk_km_member_point_km_product_order1_idx` (`ordNo`),
  CONSTRAINT `fk_km_member_point_km_member` FOREIGN KEY (`uid`) REFERENCES `km_member` (`uid`),
  CONSTRAINT `fk_km_member_point_km_product_order1` FOREIGN KEY (`ordNo`) REFERENCES `km_product_order` (`ordNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `km_member_terms` (
  `terms` text NOT NULL,
  `privacy` text NOT NULL,
  `location` text NOT NULL,
  `finance` text NOT NULL,
  `tax` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `km_product` (
  `prodNo` int NOT NULL AUTO_INCREMENT,
  `prodCate1` tinyint NOT NULL,
  `prodCate2` tinyint NOT NULL,
  `prodName` varchar(100) NOT NULL,
  `descript` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `seller` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `discount` tinyint DEFAULT '0',
  `point` int DEFAULT '0',
  `stock` int DEFAULT '0',
  `sold` int DEFAULT '0',
  `delivery` int DEFAULT '0',
  `hit` int DEFAULT '0',
  `score` tinyint DEFAULT '0',
  `review` int DEFAULT '0',
  `thumb1` varchar(255) NOT NULL,
  `thumb2` varchar(255) NOT NULL,
  `thumb3` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT '새상품',
  `duty` varchar(20) DEFAULT '과세상품',
  `receipt` varchar(50) DEFAULT '발행가능- 신용카드 전표, 온라인 현금영수증',
  `bizType` varchar(20) DEFAULT '사업자 판매자',
  `origin` varchar(20) DEFAULT '상세설명참고',
  `ip` varchar(20) NOT NULL,
  `rdate` datetime NOT NULL,
  `etc1` int DEFAULT NULL,
  `etc2` int DEFAULT NULL,
  `etc3` varchar(10) DEFAULT NULL,
  `etc4` varchar(20) DEFAULT NULL,
  `etc5` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`prodNo`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `km_product_cart` (
  `cartNo` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) NOT NULL,
  `prodNo` int NOT NULL,
  `count` int NOT NULL,
  `price` int NOT NULL,
  `discount` int NOT NULL,
  `point` int NOT NULL,
  `delivery` int NOT NULL,
  `total` int NOT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`cartNo`),
  KEY `fk_km_product_cart_km_member1_idx` (`uid`),
  KEY `fk_km_product_cart_km_product1_idx` (`prodNo`),
  CONSTRAINT `fk_km_product_cart_km_member1` FOREIGN KEY (`uid`) REFERENCES `km_member` (`uid`),
  CONSTRAINT `fk_km_product_cart_km_product1` FOREIGN KEY (`prodNo`) REFERENCES `km_product` (`prodNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;




CREATE TABLE IF NOT EXISTS `km_product_cate1` (
  `cate1` tinyint NOT NULL,
  `c1Name` varchar(20) NOT NULL,
  PRIMARY KEY (`cate1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


INSERT INTO `km_product_cate1` (`cate1`, `c1Name`) VALUES
	(10, '브랜드패션'),
	(11, '패션의류/잡화/뷰티'),
	(12, '유아동'),
	(13, '식품/생필품'),
	(14, '홈데코/취미/반려'),
	(15, '컴퓨터/디지털/가전'),
	(16, '스포츠/건강/렌탈'),
	(17, '자동차/공구'),
	(18, '여행/도서/티켓/쿠폰');


CREATE TABLE IF NOT EXISTS `km_product_cate2` (
  `cate1` tinyint NOT NULL,
  `cate2` int NOT NULL,
  `c2Name` varchar(20) NOT NULL,
  KEY `fk_km_product_cate2_km_product_cate11_idx` (`cate1`),
  CONSTRAINT `fk_km_product_cate2_km_product_cate11` FOREIGN KEY (`cate1`) REFERENCES `km_product_cate1` (`cate1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `km_product_cate2` (`cate1`, `cate2`, `c2Name`) VALUES
	(10, 10, '브랜드 여성의류'),
	(10, 11, '브랜드 남성의류'),
	(10, 12, '브랜드 진/캐쥬얼'),
	(10, 13, '브랜드 신발/가방'),
	(10, 14, '브랜드 쥬얼리/시계'),
	(10, 15, '브랜드 아웃도어'),
	(11, 10, '여성의류'),
	(11, 11, '남성의류'),
	(11, 12, '언더웨어'),
	(11, 13, '신발'),
	(11, 14, '가방/잡화'),
	(11, 15, '쥬얼리/시계'),
	(11, 16, '화장품/향수'),
	(11, 17, '바디/헤어'),
	(12, 10, '출산/육아'),
	(12, 11, '장난감/완구'),
	(12, 12, '유아동 의류'),
	(12, 13, '유아동 신발/잡화'),
	(13, 10, '신선식품'),
	(13, 11, '가공식품'),
	(13, 12, '건강식품'),
	(13, 13, '커피/음료'),
	(13, 14, '생필품'),
	(13, 15, '바디/헤어'),
	(14, 10, '가구/DIY'),
	(14, 11, '침구/커튼'),
	(14, 12, '조명/인테리어'),
	(14, 13, '생활용품'),
	(14, 14, '주방용품'),
	(14, 15, '문구/사무용품'),
	(14, 16, '사무기기'),
	(14, 17, '악기/취미'),
	(14, 18, '반려동물용품'),
	(15, 10, '노트북/PC'),
	(15, 11, '모니터/프린터'),
	(15, 12, 'PC주변기기'),
	(15, 13, '모바일/태블릿'),
	(15, 14, '카메라'),
	(15, 15, '게임'),
	(15, 16, '영상가전'),
	(15, 17, '주방가전'),
	(15, 18, '계절가전'),
	(15, 19, '생활/미용가전'),
	(15, 20, '음향가전'),
	(15, 21, '건강가전'),
	(16, 10, '스포츠의류/운동화'),
	(16, 11, '휘트니스/수영'),
	(16, 12, '구기/라켓'),
	(16, 13, '골프'),
	(16, 14, '자전거/보드/기타레저'),
	(16, 15, '캠핑/낚시'),
	(16, 16, '등산/아웃도어'),
	(16, 17, '건강/의료용품'),
	(16, 18, '건강식품'),
	(16, 19, '렌탈서비스'),
	(17, 10, '자동차용품'),
	(17, 11, '공구/안전/산업용품'),
	(18, 10, '여행/항공권'),
	(18, 11, '도서/음반/e교육'),
	(18, 12, '공연티켓'),
	(18, 13, 'e쿠폰'),
	(18, 14, '상품권');


CREATE TABLE IF NOT EXISTS `km_product_order` (
  `ordNo` int NOT NULL AUTO_INCREMENT,
  `ordUid` varchar(20) NOT NULL,
  `ordCount` int DEFAULT '0',
  `ordPrice` int DEFAULT '0',
  `ordDiscount` int DEFAULT '0',
  `ordDelivery` int DEFAULT '0',
  `savePoint` int DEFAULT '0',
  `usedPoint` int DEFAULT '0',
  `ordTotPrice` int DEFAULT '0',
  `recipName` varchar(20) NOT NULL,
  `recipHp` char(13) NOT NULL,
  `recipZip` char(5) NOT NULL,
  `recipAddr1` varchar(255) NOT NULL,
  `recipAddr2` varchar(255) NOT NULL,
  `ordPayment` tinyint NOT NULL,
  `ordComplete` tinyint NOT NULL,
  `ordDate` datetime NOT NULL,
  PRIMARY KEY (`ordNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `km_product_order_item` (
  `ordNo` int NOT NULL,
  `prodNo` int NOT NULL,
  `count` int NOT NULL,
  `price` int NOT NULL,
  `discount` tinyint NOT NULL,
  `point` int NOT NULL,
  `delivery` int NOT NULL,
  `total` int NOT NULL,
  KEY `fk_km_product_order_item_km_product1_idx` (`prodNo`),
  KEY `fk_km_product_order_item_km_product_order1_idx` (`ordNo`),
  CONSTRAINT `fk_km_product_order_item_km_product1` FOREIGN KEY (`prodNo`) REFERENCES `km_product` (`prodNo`),
  CONSTRAINT `fk_km_product_order_item_km_product_order1` FOREIGN KEY (`ordNo`) REFERENCES `km_product_order` (`ordNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `km_product_review` (
  `revNo` int NOT NULL AUTO_INCREMENT,
  `prodNo` int NOT NULL,
  `content` varchar(255) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `rating` tinyint NOT NULL,
  `regip` varchar(100) NOT NULL,
  `rdate` datetime NOT NULL,
  PRIMARY KEY (`revNo`),
  KEY `fk_km_product_review_km_product1_idx` (`prodNo`),
  KEY `fk_km_product_review_km_member1_idx` (`uid`),
  CONSTRAINT `fk_km_product_review_km_member1` FOREIGN KEY (`uid`) REFERENCES `km_member` (`uid`),
  CONSTRAINT `fk_km_product_review_km_product1` FOREIGN KEY (`prodNo`) REFERENCES `km_product` (`prodNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

SELECT a.*, b.rating FROM `km_product` AS a JOIN `km_product_review` AS b
ON a.prodNo=b.prodNo WHERE a.prodNo = 1000021;

SELECT * FROM `km_product` WHERE prodNo = 1000021;



