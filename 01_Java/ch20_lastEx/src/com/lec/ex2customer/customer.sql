--  ★ 테이블, 시퀀스 존재 유무 확인
DROP TABLE CUSTOMER;
DROP SEQUENCE CUSTOMER_ID_SEQ;

--  ★ 테이블 및 시퀀스 생성
CREATE TABLE CUSTOMER (
    CNO NUMBER(8) PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    TEL VARCHAR2(30),
    POINT NUMBER(8) DEFAULT 1000
);

CREATE SEQUENCE CUSTOMER_ID_SEQ
    MAXVALUE 99999999
    NOCACHE
    NOCYCLE;

--  ★ 테이블 구성을 위한 기본 데이터 입력
SELECT *
    FROM CUSTOMER;
    
INSERT INTO CUSTOMER
    VALUES (CUSTOMER_ID_SEQ.NEXTVAL, '홍길동', '010-1234-5678', 1200);
    
INSERT INTO CUSTOMER
    VALUES (CUSTOMER_ID_SEQ.NEXTVAL, '이철수', '010-4555-8978', 2200);
    
INSERT INTO CUSTOMER
    VALUES (CUSTOMER_ID_SEQ.NEXTVAL, '김영희', '010-7777-5178', 1900);
    
--  ★ 전화번호 조회 ( 뒷 4자리와 전화번호 전체 조회 )
SELECT *
    FROM CUSTOMER WHERE TEL LIKE '%' || '5178';

--  ★ 포인트가 많은 순으로 출력
SELECT *
    FROM CUSTOMER
    ORDER BY POINT DESC;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
