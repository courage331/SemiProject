
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

INSERT INTO cmt
(cmt_num, cmt_id, cmt_regdate, cmt_content, rev_num, cus_num)
VALUES(cmt_seq.nextval, '일호인', SYSDATE, ?, ?, ?);
