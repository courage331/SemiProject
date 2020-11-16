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
   pro_name varchar2(100) NOT NULL,
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

INSERT INTO review VALUES (REVIEW_SEQ.nextval, '왔다갑니다', '또 왔다 갑니다', 3, '2020-11-16', 1);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '안뇽하세용', '여기에 입양시키고 싶어지네요', 3, '2020-11-16', 2);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '대박대박대박', '완전 너무 좋음 ㅜㅠ', 3, '2020-11-15', 3);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '또 맡기고 싶어용', 'ㅎ_ㅇ', 3, '2020-11-15', 1);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '강아지가 활발해졌어요!', 'ㅋㅋㅋㅋㅋㅋㅋㅋ굿임당', 3, '2020-11-14', 2);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '또 오고싶은 이곳', '하이효이라이훙', 3, '2020-11-18', 2);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '시간나면 또 맡길게용', '가나다라마바사아자차카', 3, '2020-11-13', 2);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '하하하하하', '하자차카타파하', 3, '2020-11-12', 3);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '무슨 글을 쓰지', '무슨글 적지', 3, '2020-11-11', 3);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '이런이런이런', '요런요런요런요런', 3, '2020-11-11', 3);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '생각보다 별로네요', '연연', 4, '2020-10-11', 2);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '기대이하', '철철철', 5, '2020-10-10', 1);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '완전 좋음', '99999999', 2, '2020-10-09', 1);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '1414', 'Systemㅎㅇ', 5, '2020-10-08', 2);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '1415', '아릉하세연', 5, '2020-10-07', 2);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '아릉하세연', '안뇽안녕', 5, '2020-10-06', 2);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '키키키키키킼', '이이호호인인', 5, '2020-10-05', 2);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '큐큐큐큐큐큨', '김김지지민민', 3, '2020-10-05', 3);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, '새로운글 new', '장장정정호호', 5, '2020-10-04', 3);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, 'he is korean', '이이주주혁혁', 5, '2020-10-03', 1);
INSERT INTO review VALUES (REVIEW_SEQ.nextval, 'he is korean', '김김영영재재', 5, '2020-10-02', 1);

INSERT INTO PRODUCT VALUES(product_seq.nextval,'rice',10, 200, '존맛탱 유기농 사료','<p><img alt="" src="/SemiProject/chkupload/r1.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'rice',10, 300, '둘이 먹다 둘다 죽은 사료','<p><img alt="" src="/SemiProject/chkupload/r2.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'rice',10, 100, '계속 찾게 되는 그맛 ','<p><img alt="" src="/SemiProject/chkupload/r3.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'rice',10, 300, '건강한 맛!','<p><img alt="" src="/SemiProject/chkupload/r4.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'snack',5, 300, '강철 이빨을 위한 개껌','<p><img alt="" src="/SemiProject/chkupload/g1.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'snack',5, 200, '말캉말캉 껌','<p><img alt="" src="/SemiProject/chkupload/g2.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'snack',10, 100, '맛좋은 껌','<p><img alt="" src="/SemiProject/chkupload/g3.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'snack',5, 500, '치석제거껌','<p><img alt="" src="/SemiProject/chkupload/g4.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'shampoo',13, 500, '엘라스틴 샴푸','<p><img alt="" src="/SemiProject/chkupload/s1.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'shampoo',13, 500, '전지현 개가 썼다는 그 샴푸','<p><img alt="" src="/SemiProject/chkupload/s2.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'shampoo',13, 500, '샤넬 향수향 샴푸','<p><img alt="" src="/SemiProject/chkupload/s3.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'shampoo',13, 500, '모발모발 샴푸','<p><img alt="" src="/SemiProject/chkupload/s4.jpg" style="width: 220px; height: 220px;" /></p>');
INSERT INTO PRODUCT VALUES(product_seq.nextval,'etc',20, 100, '그래 이거지 장난감','<p><img alt="" src="/SemiProject/chkupload/e1.jpg" style="width: 220px; height: 220px;" /></p>');

SELECT * FROM CUSTOMER;
SELECT * FROM PET;
SELECT * FROM REVIEW;
SELECT * FROM PRODUCT;
SELECT * FROM RESERVATION;