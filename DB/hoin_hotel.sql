
/* Drop Tables */

DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE pet CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE selldata CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE customer
(
	cus_num number NOT NULL, -- 사용자 고유 번호
	cus_pw varchar2(20) NOT NULL, -- 사용자 비밀번호 
	cus_name varchar2(10) NOT NULL, -- 사용자 이름 
	cus_phone varchar2(20) NOT NULL, -- 사용자 전화번호
	cus_email varchar2(30) NOT NULL, -- 사용자 이메일
	cus_id varchar2(20) NOT NULL, -- 사용자 아이디
	cus_money number, -- 뼈다귀 현황
	PRIMARY KEY (cus_num) --기본키 
);
/* customer 쿼리문
INSERT INTO customer VALUES (100, '1234', '일호인', '010-6327-8629', 'hoin1@naver.com', 'hoin', '10');
INSERT INTO customer VALUES (110, '1234', '일호인', '010-6327-8629', 'hoin11@naver.com', 'hoin1', '10');
INSERT INTO customer VALUES (101, '1234', '키호인', '010-6327-2629', 'hoin22@naver.com', 'hoin2', '10');
INSERT INTO customer VALUES (102, '1234', '일키인', '010-6327-3629', 'hoin33@naver.com', 'hoin3', '10');
INSERT INTO customer VALUES (103, '1234', '일호키', '010-6327-4629', 'hoin44@naver.com', 'hoin4', '10');
INSERT INTO customer VALUES (104, '1234', '호키인', '010-6327-5629', 'hoin55@naver.com', 'hoin5', '10');
INSERT INTO customer VALUES (15, '1234', '호키인', '010-6327-5629', 'hoin55@naver.com', 'test', '10');
*/

CREATE TABLE pet
(
	pet_num number NOT NULL,
	cus_num number NOT NULL,
	pet_name varchar2(10) NOT NULL,
	pet_age number NOT NULL,
	pet_weight number,
	PRIMARY KEY (pet_num)
);


CREATE TABLE product
(
	pro_num number NOT NULL,
	pro_kind varchar2(20) NOT NULL,
	pro_price number NOT NULL,
	pro_cnt number NOT NULL,
	pro_name varchar2(20) NOT NULL,
	PRIMARY KEY (pro_num)
);


CREATE TABLE reservation
(
	res_num number NOT NULL,
	res_startdate date NOT NULL,
	res_lastdate date NOT NULL,
	message clob,
	cus_num number NOT NULL,
	pet_num number NOT NULL,
	PRIMARY KEY (res_num)
);


CREATE TABLE review
(
	rev_num number NOT NULL,-- 게시글 고유 번호
	rev_subject varchar2(40) NOT NULL, -- 글 제목
	rev_content clob, -- 글 내용
	rev_star number, -- 별점 
	rev_regdate date NOT NULL, -- 등록 일자
	cus_num number NOT NULL, -- 사용자 고유 번호
	PRIMARY KEY (rev_num) -- 기본키 
);
/*
INSERT INTO review VALUES (1, '1글2글', '이이이이이', 3, '2020-10-5', 100);
INSERT INTO review VALUES (2, '2글2글', '1이이이이', 3, '2020-10-15', 110);
INSERT INTO review VALUES (3, '3글2글', '2이이이이', 3, '2020-10-16', 101);
INSERT INTO review VALUES (4, '4글2글', '3이이이이', 3, '2020-10-17', 102);
INSERT INTO review VALUES (5, '5글2글', '4이이이이', 3, '2020-10-18', 103);
*/

CREATE TABLE selldata
(
	cus_num number NOT NULL,
	pro_num number NOT NULL,
	sell_date date NOT NULL,
	sell_cnt number NOT NULL,
	sell_sum number NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE pet
	ADD FOREIGN KEY (cus_num)
	REFERENCES customer (cus_num)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (cus_num)
	REFERENCES customer (cus_num)
;


ALTER TABLE review
	ADD FOREIGN KEY (cus_num)
	REFERENCES customer (cus_num)
;


ALTER TABLE selldata
	ADD FOREIGN KEY (cus_num)
	REFERENCES customer (cus_num)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (pet_num)
	REFERENCES pet (pet_num)
;


ALTER TABLE selldata
	ADD FOREIGN KEY (pro_num)
	REFERENCES product (pro_num)
;

CREATE SEQUENCE REVIEW_SEQ;


