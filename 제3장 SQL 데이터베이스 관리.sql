#날짜 : 2022/08/24
#이름 : 홍민준
#내용 : 제3장 데이터베이스 관리alter

#실습 3-1
create database `java1_test_db`;
create user 'java1_test'@'%' identified by '1234';
grant all privileges on `java1_test_db`.* to 'java1_test'@'%';
flush privileges;

#실습 3-2



