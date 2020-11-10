
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

ALTER TABLE cmt
	ADD FOREIGN KEY (cus_num)
	REFERENCES customer (cus_num)
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


ALTER TABLE cmt
	ADD FOREIGN KEY (rev_num)
	REFERENCES review (rev_num)
;



/* Comments */

COMMENT ON COLUMN pet.pet_reserve IS '1이면 예약 불가 상태
0이면 예약 가능 상태';
COMMENT ON COLUMN reservation.res_state IS '미정...';


CREATE SEQUENCE CMT_SEQ;

SELECT * FROM cmt WHERE REV_NUM = 2 ORDER BY CMT_NUM;
SELECT * FROM cmt WHERE rev_num = 44;

DROP SEQUENCE CMT_SEQ;
DROP SEQUENCE REVIEW_SEQ;

<<<<<<< HEAD

INSERT INTO review VALUES (REVIEW_SEQ.nextval, '5글2글', '4이이이이', 3, '2020-10-18', 6);

INSERT INTO PRODUCT VALUES(product_seq.nextval,'사료',10, 500, 'r1');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'사료',10, 500, 'r2');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'사료',10, 500, 'r3');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'사료',10, 500, 'r4');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'간식',10, 500, 'g1');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'간식',10, 500, 'g2');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'간식',10, 500, 'g3');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'간식',10, 500, 'g4');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'미용',10, 500, 's1');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'미용',10, 500, 's2');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'미용',10, 500, 's3');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'미용',10, 500, 's4');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'장난감',10, 0, 'e1');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'장난감',10, 1, '가지');

1
SELECT * FROM CUSTOMER WHERE cus_id = '' AND cus_pw = 1234;
=======
INSERT INTO cmt
(cmt_num, cmt_id, cmt_regdate, cmt_content, rev_num, cus_num)
VALUES(cmt_seq.nextval, '일호인', SYSDATE, ?, ?, ?);
>>>>>>> branch 'master' of https://github.com/courage331/SemiProject.git
