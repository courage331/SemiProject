
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

