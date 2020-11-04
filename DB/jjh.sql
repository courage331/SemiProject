
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
	-- 미정...
	res_state number NOT NULL,
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
/* customer 테스트 쿼리문 */
INSERT INTO customer VALUES (1, '1234', '장정호', '010-6481-5124', 'jjh5324@kakao.com', 'jjh', '999');
INSERT INTO customer VALUES (2, '1234', '일호인', '010-6327-8629', 'hoin1@naver.com', 'hoin', '10');
INSERT INTO customer VALUES (3, '1234', 'test', '010-6481-4444', '$4444@kakao.com', 'test', '999');
/* pet 테스트 쿼리문 */
INSERT INTO PET VALUES(1,1,'강아지1',5,10,0);
INSERT INTO PET VALUES(2,1,'강아지2',6,12,1);
INSERT INTO PET VALUES(3,2,'강아지1',5,10,1);
INSERT INTO PET VALUES(4,3,'강아지1',5,10,1);

INSERT INTO PRODUCT VALUES(1,'사료',10, 500, '사료1');
INSERT INTO PRODUCT VALUES(2,'사료',10, 500, '사료2');
INSERT INTO PRODUCT VALUES(3,'사료',10, 500, '사료3');
INSERT INTO PRODUCT VALUES(4,'사료',10, 500, '사료4');

INSERT INTO PET VALUES(PET_SEQ.nextval,1,'강아지3',6,10,0);

/* select 테스트 쿼리 */
SELECT CUS_MONEY FROM CUSTOMER WHERE CUS_NUM = 1;
/*테이블에 있는지 확인용*/
SELECT * FROM CUSTOMER;
/*뼈다귀 충전*/
UPDATE CUSTOMER SET CUS_MONEY = CUS_MONEY + 20 WHERE CUS_NUM = 1;
UPDATE (SELECT CUS_MONEY FROM CUSTOMER WHERE CUS_NUM = 1) SET CUS_MONEY = CUS_MONEY + 1;

SELECT * FROM PET WHERE CUS_NUM = 1;

select * from user_tables

CREATE SEQUENCE PET_SEQ;
CREATE SEQUENCE RESERVATION_SEQ;
CREATE SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE PRODUCT_SEQ;
CREATE SEQUENCE SELLDATA_SEQ;
CREATE SEQUENCE CUSTOMER_SEQ;
DROP SEQUENCE PET_SEQ;

