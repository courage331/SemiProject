
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
SELECT * FROM CUSTOMER ;
SELECT * FROM SELLDATA;
SELECT * FROM PRODUCT ;
DELETE FROM CUSTOMER WHERE CUS_NUM =1;
DELETE FROM PRODUCT WHERE PRO_NUM =79;



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
	pro_name varchar2(100) NOT NULL,
	--컨텐츠 내용
	pro_content clob,
	PRIMARY KEY (pro_num)
);

SELECT *FROM product;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'product';
ALTER SEQUENCE product INCREMENT BY -100;


DELETE FROM CUSTOMER WHERE CUS_NUM =1;
DELETE FROM PRODUCT WHERE PRO_KIND = '장난감';
DELETE FROM PRODUCT WHERE PRO_KIND = '사료';
DELETE FROM PRODUCT WHERE PRO_KIND = '간식';
DELETE FROM PRODUCT WHERE PRO_KIND = '샴푸';
SELECT *FROM PRODUCT ;
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
INSERT INTO PRODUCT VALUES(product_seq.nextval,'etc',20, 100, '가지놈','<p><img alt="" src="/SemiProject/chkupload/가지.jpg" style="width: 220px; height: 220px;" /></p>');
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

DROP SEQUENCE product_seq;

SELECT PRODUCT_SEQ.NEXTVAL FROM DUAL; --시퀀스 다음 번호 조회

ALTER SEQUENCE PRODUCT_SEQ INCREMENT BY 1; --시퀀스 1로 초기화
SELECT *FROM product;
DELETE FROM PRODUCT WHERE pro_num = 100;

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



