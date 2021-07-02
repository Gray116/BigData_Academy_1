DROP TABLE MEMBER;

CREATE TABLE MEMBER (
    ID VARCHAR2(20) PRIMARY KEY,
    PW VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    BIRTH DATE,
    GENDER VARCHAR2(1),
    EMAIL VARCHAR2(50),
    TEL VARCHAR2(30),
    ADDRESS VARCHAR2(100)
);

INSERT INTO MEMBER (ID, PW, NAME, BIRTH, GENDER)
    VALUES ('aaa', 'aaa', '이에이', '1996-09-09', 'F');
    
INSERT INTO MEMBER (ID, PW, NAME, BIRTH, GENDER)
    VALUES ('bbb', 'bbb', '박비비', '1993-01-09', 'F');

INSERT INTO MEMBER (ID, PW, NAME, BIRTH, GENDER)
    VALUES ('ccc', 'ccc', '씨시시', '1994-02-09', 'M');
    
select *
    from member;
    
commit;
------------------------------------ ID 중복체크
SELECT *
    FROM MEMBER
    WHERE ID = 'aaa';













