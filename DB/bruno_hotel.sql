
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
	cus_num number NOT NULL,
	cus_pw varchar2(20) NOT NULL,
	cus_name varchar2(10) NOT NULL,
	cus_phone varchar2(20) NOT NULL,
	cus_email varchar2(30) NOT NULL,
	cus_id varchar2(20) NOT NULL,
	cus_money number,
	PRIMARY KEY (cus_num)
);


CREATE TABLE pet
(
	pet_num number NOT NULL,
	cus_num number NOT NULL,
	pet_name varchar2(10) NOT NULL,
	pet_age number NOT NULL,
	pet_weight number,
	-- 1이면 예약 불가 상태
	-- 0이면 예약 가능 상태
	pet_reserve number NOT NULL,
	pet_image NUMBER NOT NULL,
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
	-- 예약번호
	res_num number NOT NULL,
	-- 예약 시작날짜
	res_startdate date NOT NULL,
	-- 예약 마지막날짜
	res_lastdate date NOT NULL,
	--서비스 항목
	res_sinfo varchar2(30) NOT NULL,
	-- 건의사항
	res_message clob,
	-- 사용자 고유 번호
	res_state number NOT NULL,
	--예약 상태
	cus_num number NOT NULL,
	-- 애완견고유번호
	pet_num number NOT NULL,
	PRIMARY KEY (res_num)
);


CREATE TABLE review
(
	rev_num number NOT NULL,
	rev_subject varchar2(40) NOT NULL,
	rev_content clob,
	rev_star number,
	rev_regdate date NOT NULL,
	cus_num number NOT NULL,
	PRIMARY KEY (rev_num)
);


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

SELECT * FROM customer;

INSERT  INTO customer (CUS_NUM, CUS_PW, CUS_NAME, CUS_PHONE, CUS_EMAIL, CUS_ID, CUS_MONEY)
VALUES (1,'1234','bruno','010-2353-1836','tkwk@naver.com','test', 0);

INSERT INTO CUSTOMER VALUES(2,'1234','테스트','010-1234-5678','abcd@naver.com','test2',100);

DELETE FROM customer WHERE cus_num=2;

CREATE SEQUENCE RESERVATION_SEQ;
CREATE SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE PRODUCT_SEQ;
CREATE SEQUENCE SELLDATA_SEQ;
CREATE SEQUENCE CUSTOMER_SEQ;
CREATE SEQUENCE PET_SEQ;
DROP SEQUENCE customer_SEQ;


SELECT count(*) FROM CUSTOMER WHERE CUS_ID = '1234';