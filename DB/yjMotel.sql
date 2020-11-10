
/* Drop Tables */

DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE pet CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE selldata CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
ALTER TABLE SELLDATA DORP CONSTRAINT FK_SELLDATA;

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'PRODUCT'; -- 제약 명 확인하기
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'SELLDATA';
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'customer';
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'pet';
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'review';


ALTER TABLE SELLDATA DROP CONSTRAINT SYS_C007404; -- 제약조건 삭제
ALTER TABLE SELLDATA DROP CONSTRAINT SYS_C007405;
ALTER TABLE PRODUCT DROP CONSTRAINT SYS_C007318;

SELECT * FROM PRODUCT ;



/* Create Tables */

CREATE TABLE customer
(
	-- 사용자 고유 번호
	cus_num number NOT NULL,
	-- 사용자 비밀번호
	cus_pw varchar2(20) NOT NULL,
	-- 사용자 이름
	cus_name varchar2(10) NOT NULL,
	-- 사용자 전화번호
	cus_phone varchar2(20) NOT NULL,
	-- 사용자 이메일
	cus_email varchar2(30) NOT NULL,
	-- 사용자 아이디
	cus_id varchar2(20) NOT NULL,
	-- 뼈다귀현황
	cus_money number,
	PRIMARY KEY (cus_num)
);


CREATE TABLE pet
(
	-- 애완견고유번호
	pet_num number NOT NULL,
	-- 애완견 이름
	pet_name varchar2(10) NOT NULL,
	-- 애완견 나이
	pet_age number NOT NULL,
	-- 애완견 무게
	pet_weight number NOT NULL,
	-- 사용자 고유 번호
	pet_reserve number NOT NULL,
	-- 애완견 예약 여부
	pet_image NUMBER NOT NULL,
	--애완견 이미지
	cus_num number NOT NULL,
	
	
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
	PRIMARY KEY (pro_num)
);

CREATE TABLE SHOPFILE
(
	bf_fid NUMBER NOT NULL,
	-- 파일 번호
	bf_source varchar2(100) NOT NULL,
	-- 파일소스
	bf_file varchar2(100) NOT NULL,
	-- 저장(변환)이름
	pro_num NUMBER NOT NULL
	PRIMARY KEY (bf_fid)
);
ALTER TABLE shopfile 
	ADD FOREIGN KEY (pro_num)
	REFERENCES PRODUCT (pro_num)
	ON DELETE CASCADE --참조하는 부모가 삭제시 같이 삭제 
	;

DELETE FROM CUSTOMER WHERE CUS_NUM =1;
DELETE FROM PRODUCT WHERE PRO_KIND = '장난감';
DELETE FROM PRODUCT WHERE PRO_KIND = '사료';
DELETE FROM PRODUCT WHERE PRO_KIND = '간식';
DELETE FROM PRODUCT WHERE PRO_KIND = '샴푸';
INSERT INTO PRODUCT VALUES(1,'rice',10, 500, 'r1');
INSERT INTO PRODUCT VALUES(2,'rice',10, 500, 'r2');
INSERT INTO PRODUCT VALUES(3,'rice',10, 500, 'r3');
INSERT INTO PRODUCT VALUES(4,'rice',10, 500, 'r4');

INSERT INTO PRODUCT VALUES(5,'snack',5, 300, 'g1');
INSERT INTO PRODUCT VALUES(6,'snack',5, 200, 'g2');
INSERT INTO PRODUCT VALUES(7,'snack',10, 100, 'g3');
INSERT INTO PRODUCT VALUES(8,'snack',5, 500, 'g4');
INSERT INTO PRODUCT VALUES(9,'shampoo',13, 500, 's1');
INSERT INTO PRODUCT VALUES(10,'shampoo',13, 500, 's2');
INSERT INTO PRODUCT VALUES(11,'shampoo',13, 500, 's3');
INSERT INTO PRODUCT VALUES(12,'shampoo',13, 500, 's4');
INSERT INTO PRODUCT VALUES(13,'etc',20, 100, 'e1');
SELECT * FROM CUSTOMER;
SELECT * FROM PET;
SELECT * FROM RESERVATION;
select * from product;
SELECT * FROM SELLDATA;
SELECT * FROM REVIEW;
SELECT * FROM PRODUCT WHERE PRO_KIND ='rice';
UPDATE (SELECT pro_price, pro_cnt FROM product WHERE pro_num = 1) SET pro_price = 200, pro_cnt = 200;
UPDATE PRODUCT SET pro_price = 100, pro_cnt = 100 WHERE pro_num = 1;
 UPDATE (SELECT pro_price, pro_cnt FROM PRODUCT WHERE pro_num = 7) SET pro_price = 7, pro_cnt = 500;
 UPDATE (SELECT pro_price, pro_cnt FROM product WHERE pro_num = 7) SET pro_price = 10, pro_cnt = 3;
DELETE FROM PRODUCT WHERE pro_num =1;
DELETE FROM CUSTOMER WHERE CUS_NUM =3;

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
	-- 게시글 고유 번호
	rev_num number NOT NULL,
	-- 글제목
	rev_subject varchar2(40) NOT NULL,
	-- 글내용
	rev_content clob,
	-- 별점주기
	rev_star number,
	-- 등록일자
	rev_regdate date,
	-- 사용자 고유 번호
	cus_num number NOT NULL,
	PRIMARY KEY (rev_num)
);


CREATE TABLE selldata
(
	-- 사용자 고유 번호
	cus_num number NOT NULL,
	-- 상품고유번호
	pro_num number NOT NULL,
	-- 판매한날짜
	sell_date date,
	-- 판매한수량
	sell_cnt number NOT NULL,
	-- 총구매금액
	sell_sum number
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


/* Create Foreign Keys */

ALTER TABLE pet
	ADD FOREIGN KEY (cus_num)
	REFERENCES customer (cus_num)
	ON DELETE CASCADE --부모가 삭제되면 자식도 삭제된다.
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

/*가상의 테스트용 customer 생성*/
INSERT INTO CUSTOMER VALUES(1,'1234','테스트','010-1234-5678','abcd@naver.com','test',100);
INSERT INTO CUSTOMER VALUES(2,'1234','테스트','010-1234-5678','abcd@naver.com','test2',100);
INSERT INTO CUSTOMER VALUES(3,'1234','테스트','010-1234-5678','abcd@naver.com','test3',100);

/*가상의 테스트용 펫 생성*/
INSERT INTO PET VALUES(1,'강아지1',5,10,0,1);
INSERT INTO PET VALUES(2,'강아지2',6,12,0,1);
INSERT INTO PET VALUES(3,'강아지3',5,10,0,2);
INSERT INTO PET VALUES(4,'강아지4',6,12,0,2);
/*테이블에 있는지 확인용*/
SELECT * FROM CUSTOMER;
SELECT * FROM PET;
SELECT * FROM RESERVATION;
select * from product;
SELECT * FROM SELLDATA;

INSERT INTO PET VALUES(4,'강아지4',6,12,0,2);




/*SQL문 테스트*/
SELECT * FROM PET WHERE cus_num=1;

SELECT pet_num FROM pet WHERE cus_num=1 AND pet_name='강아지2';

UPDATE pet SET pet_reserve = 1 WHERE pet_num = 1;

SELECT * FROM CUSTOMER WHERE cus_id = 'test' AND cus_pw = '1234';

CREATE SEQUENCE RESERVATION_SEQ;
CREATE SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE PRODUCT_SEQ;
CREATE SEQUENCE SELLDATA_SEQ;
CREATE SEQUENCE CUSTOMER_SEQ;
CREATE SEQUENCE PET_SEQ;


/* Comments */

COMMENT ON COLUMN customer.cus_num IS '사용자 고유 번호';
COMMENT ON COLUMN customer.cus_pw IS '사용자 비밀번호';
COMMENT ON COLUMN customer.cus_name IS '사용자 이름';
COMMENT ON COLUMN customer.cus_phone IS '사용자 전화번호';
COMMENT ON COLUMN customer.cus_email IS '사용자 이메일';
COMMENT ON COLUMN customer.cus_id IS '사용자 아이디';
COMMENT ON COLUMN customer.cus_money IS '뼈다귀현황';
COMMENT ON COLUMN pet.pet_num IS '애완견고유번호';
COMMENT ON COLUMN pet.pet_name IS '애완견 이름';
COMMENT ON COLUMN pet.pet_age IS '애완견 나이';
COMMENT ON COLUMN pet.pet_weight IS '애완견 무게';
COMMENT ON COLUMN pet.cus_num IS '사용자 고유 번호';
COMMENT ON COLUMN product.pro_num IS '상품고유번호';
COMMENT ON COLUMN product.pro_kind IS '상품종류';
COMMENT ON COLUMN product.pro_price IS '가격';
COMMENT ON COLUMN product.pro_cnt IS '수량';
COMMENT ON COLUMN product.pro_name IS '상품이름';
COMMENT ON COLUMN reservation.res_num IS '예약번호';
COMMENT ON COLUMN reservation.res_startdate IS '예약 시작날짜';
COMMENT ON COLUMN reservation.res_lastdate IS '예약 마지막날짜';
COMMENT ON COLUMN reservation.res_message IS '건의사항';
COMMENT ON COLUMN reservation.cus_num IS '사용자 고유 번호';
COMMENT ON COLUMN reservation.pet_num IS '애완견고유번호';
COMMENT ON COLUMN review.rev_num IS '게시글 고유 번호';
COMMENT ON COLUMN review.rev_subject IS '글제목';
COMMENT ON COLUMN review.rev_content IS '글내용';
COMMENT ON COLUMN review.rev_star IS '별점주기';
COMMENT ON COLUMN review.rev_regdate IS '등록일자';
COMMENT ON COLUMN review.cus_num IS '사용자 고유 번호';
COMMENT ON COLUMN selldata.cus_num IS '사용자 고유 번호';
COMMENT ON COLUMN selldata.pro_num IS '상품고유번호';
COMMENT ON COLUMN selldata.sell_date IS '판매한날짜';
COMMENT ON COLUMN selldata.sell_cnt IS '판매한수량';
COMMENT ON COLUMN selldata.sell_sum IS '총구매금액';



