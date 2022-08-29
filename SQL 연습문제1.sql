#날짜 : 2022/08/29
#이름 : 홍민준
#내용 : SQL 연습문제1

#실습 1-1
create database `Java1_Shop`;
create User `java1_admin1`@'%' identified by '1234';
grant all privileges on `java1_shop`.* to 'java1_admin1'@'%';
flush privileges;

#실습 1-2
create table `Customer`(
		`custID` varchar(10) primary key,
        `name` varchar(10) not null,
        `hp` char(13) null unique,
        `addr` varchar(10) null,
        `rdate` datetime not null
);
create table `Product`(
		`prodNo` tinyint primary key,
        `prodName` varchar(10) not null,
        `stock` int not null,
        `price` int null,
        `company` varchar(10) not null
);
create table `Order`(
		`orderNo` tinyint primary key,
        `orderId` varchar(10) not null,
        `orderProduct` tinyint not null,
        `orderCount` tinyint not null,
        `orderDate` datetime not null
);
#실습 1-3
insert into `customer` values('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `customer` values('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `customer` values('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
insert into `customer` values('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04' );
insert into `customer`(`custId` , `name`, `rdate`) values('c105', '이성계', '2022-01-05');
insert into `customer` values('c106','정철', '010-1234-1006', '경기도 용인시','2022-01-06'  );
insert into `customer`(`custId` , `name`, `rdate`) values('c107', '허준', '2022-01-07');
insert into `customer` values('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08' );
insert into `customer` values('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09' );
insert into `customer` values('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10' );

insert into `Product` values( 1, '새우깡' ,5000 , 1500, '농심');
insert into `product` values( 2, '초코파이' , 2500, 2500,'오리온');
insert into `product` values( 3, '포카칩' ,3600 ,1700 ,'오리온');
insert into `product` values( 4, '양파링' ,1250 ,1800 ,'농심');
insert into `product`(`prodNo`, `prodName` , `stock`, `company`) values( 5, '죠리퐁' , 2200,'크라운');
insert into `product` values( 6, '마카렛트' ,3500 ,3500 ,'롯데');
insert into `product` values( 7, '뿌셔뿌셔' ,1650 , 1200,'오뚜기');

insert into `Order` values( 1, 'c102' ,3 ,2 , '2022-07-01 13:15:10');
insert into `Order` values( 2, 'c101' ,4 ,1 , '2022-07-01 14:16:11');
insert into `Order` values( 3, 'c108' ,1 ,1 , '2022-07-01 17:23:18');
insert into `Order` values( 4, 'c109' ,6 ,5 , '2022-07-02 10:46:36');
insert into `Order` values( 5, 'c102' ,2 ,1 , '2022-07-03 09:15:37');
insert into `Order` values( 6, 'c101' ,7 ,3 , '2022-07-03 12:35:12');
insert into `Order` values( 7, 'c110' ,1 ,2 , '2022-07-03 16:55:36');
insert into `Order` values( 8, 'c104' ,2 ,4 , '2022-07-04 14:23:23');
insert into `Order` values( 9, 'c102' ,1 ,3 , '2022-07-04 21:54:34');
insert into `Order` values( 10, 'c107' ,6 ,1 , '2022-07-05 14:21:03');
#실습 1-4
select * from `customer`;

#실습 1-5
select `custid`, `name`, `hp`from `customer`;
#실습 1-6
select * from `product`;
#실습 1-7
select `company` from `product`;
#실습 1-8
select distinct`company` from `product`;
#실습 1-9
select `prodName`, `price` from `product`;
#실습 1-10
select `prodName`, `price`+500 as `조정단가` from `product`;
#실습 1-11
select `prodName` , `stock`, `price` from `product` where `company` ='오리온';
#실습 1-12
select `orderProduct` , `orderCount` , `orderdate` from `order` where `orderid` = 'c102';
#실습 1-13
select `orderProduct` , `ordercount` , `orderdate` from `order` where `orderid` = 'c102'
	and `ordercount` >= 2;
#실습 1-14
select * from `product` where `price` >= 1000 and `price` <= 2000;
#실습 1-15
select `custid` , `name`, `hp`, `addr` from `customer` where `name` like '김%';
#실습 1-16
select `custid`, `name`, `hp`, `addr` from `customer` where `name` like '__'; 
#실습 1-17
select * from `customer` where `hp` is null; 
#실습 1-18
select * from `customer` where `addr` like '%';
#실습 1-19
select * from `customer` order by `rdate` desc;
#실습 1-20
select * from `order` where `ordercount` >=3
 order by `ordercount` desc ,`orderproduct` asc ; 
#실습 1-21
select avg(price) from `product`;
#실습 1-22
select sum(stock) as `재고량 합계` from `product` where `company` = '농심';
#실습 1-23
select count(custid) as `고객수` from `customer`;
#실습 1-24
select count(distinct `company`) as `제조업체 수` from `product`;
#실습 1-25
select `orderproduct` as `주문 상품번호`, sum(`ordercount`) as `총 주문수량` from
`order` group by `orderProduct` order by `orderProduct`; 
#실습 1-26
select `company` as `제조업체` , count(*) as `제춤수`, max(`price`) as `최고가` from
`product` group by `company` ;
#실습 1-27
select `company` as `제조업체` , count(*) as `제품수`, max(`price`) as `최고가` from
`product` group by `company` having `제품수` >= 2;
#실습 1-28
select `orderProduct` , `orderId` , sum(`ordercount`) as `총 주문수량` from `order`
group by `orderNO` order by `orderProduct`;
#실습 1-29
select a.orderid, b.prodname from `order` as a
join `product` as b
on a.orderProduct = b.prodno
where `orderid` = 'c102';
#실습 1-30
select `orderid` , `name`, `prodname`, `orderdate` from `order` as a
join `customer` as b
on a.orderId = b.custID
join `product` as c
on a.orderProduct = c.prodNo
where `orderDate` like '2022-07-03%'; 
# `orderDate` like '2022-07-03%' = substr(`orderdate`,1,10) = '2022-07-03'