/*----------------------------------------------------------------------------------------------------------------------*/

/* Drop Tables */

DROP TABLE cmt CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE pet CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE selldata CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE cmt
(
	cmt_num number NOT NULL,
	cmt_id varchar2(40) NOT NULL,
	cmt_regdate date NOT NULL,
	cmt_content clob NOT NULL,
	rev_num number NOT NULL,
	cus_num number NOT NULL,
	PRIMARY KEY (cmt_num)
);



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
   -- 상품고유번호
   pro_num number NOT NULL,
   -- 상품종류
   pro_kind varchar2(20) NOT NULL,
   -- 가격
   pro_price number NOT NULL,
   -- 수량
   pro_cnt number NOT NULL,
   -- 상품이름
   pro_name varchar2(20) NOT NULL,
   --컨텐츠 내용
   pro_content clob,
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

/*create sequence*/
CREATE SEQUENCE RESERVATION_SEQ;
CREATE SEQUENCE CMT_SEQ;
CREATE SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE PRODUCT_SEQ;
CREATE SEQUENCE SELLDATA_SEQ;
CREATE SEQUENCE CUSTOMER_SEQ;
CREATE SEQUENCE PET_SEQ;

/* drop sequence */
DROP SEQUENCE RESERVATION_SEQ;
DROP SEQUENCE CMT_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE PRODUCT_SEQ;
DROP SEQUENCE SELLDATA_SEQ;
DROP SEQUENCE CUSTOMER_SEQ;
DROP SEQUENCE PET_SEQ;


/* Create Foreign Keys */

ALTER TABLE cmt
	ADD FOREIGN KEY (rev_num)
	REFERENCES review (rev_num)
	ON DELETE CASCADE
;


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

INSERT INTO CUSTOMER VALUES(CUSTOMER_SEQ.nextval,'1234','관리자','010-1234-5678','walwal@naver.com','admin',99999);
INSERT INTO CUSTOMER VALUES(CUSTOMER_SEQ.nextval,'1234','사용자','010-5555-5555','abc@naver.com','test',123);
INSERT INTO CUSTOMER VALUES(CUSTOMER_SEQ.nextval,'1234','사용자1','010-5123-2255','abcf@naver.com','test1',123);
INSERT INTO CUSTOMER VALUES(CUSTOMER_SEQ.nextval,'1234','사용자2','010-5555-3355','abcd@naver.com','test2',123);

INSERT INTO PET VALUES(pet_seq.nextval,2,'강아지1',5,5,0,1);
INSERT INTO PET VALUES(pet_seq.nextval,2,'강아지2',6,4,0,1);
INSERT INTO PET VALUES(pet_seq.nextval,2,'강아지3',7,8,0,1);	


INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.nextval, '2020-10-18', '2020-10-19','독파크',NULL,2,2,3);
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.nextval, '2020-10-22', '2020-10-27','아카데미',NULL,2,2,1);
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.nextval, '2020-10-23', '2020-10-30','유치원',NULL,2,2,1);
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.nextval, '2020-10-23', '2020-10-30','유치원',NULL,2,2,2);
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.nextval, '2020-11-20', '2020-12-23','그루밍',NULL,1,2,3);
INSERT INTO RESERVATION VALUES (RESERVATION_SEQ.nextval, '2020-11-10', '2020-12-20','그루밍',NULL,0,2,1);

INSERT INTO REVIEW VALUES (REVIEW_SEQ.nextval, '잘 놀다 갑니다','놀기 좋아요','3',SYSDATE,2);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.nextval, '좋았어요!','놀기 좋아요',5,SYSDATE,2);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.nextval, '강아지가 좋아하네요','놀기 좋아요',4,SYSDATE,2);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.nextval, '별로에요....','놀기 좋아요','1',SYSDATE,2);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.nextval, '깔끔해요','놀기 좋아요','3',SYSDATE,2);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.nextval, '서비스가 친절해요','놀기 좋아요','4',SYSDATE,2);
INSERT INTO REVIEW VALUES (REVIEW_SEQ.nextval, '다시 올게요','놀기 좋아요','5',SYSDATE,2);


SELECT * FROM CUSTOMER;
SELECT * FROM PET;
SELECT * FROM REVIEW;
SELECT * FROM PRODUCT;
SELECT * FROM RESERVATION;