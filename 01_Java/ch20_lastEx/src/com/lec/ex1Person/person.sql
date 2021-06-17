DROP TABLE PERSON;
DROP TABLE JOB;

--  ★ 테이블 및 시퀀스 생성
CREATE TABLE JOB (
    JNO NUMBER(2) PRIMARY KEY,
    JNAME VARCHAR2(30) NOT NULL
);

CREATE TABLE PERSON (
    NO NUMBER(8) PRIMARY KEY,
    JNO NUMBER(2) REFERENCES JOB (JNO) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    KOR NUMBER(3),
    ENG NUMBER(3),
    MAT NUMBER(3)
);

DROP SEQUENCE PERSON_NO_SEQ;
CREATE SEQUENCE PERSON_NO_SEQ
    MAXVALUE 99999999
    NOCYCLE
    NOCACHE;

--  ★ 1번 쿼리 (이름, 직업명, 국, 영, 수의 데이터를 입력받기)
INSERT INTO JOB
    VALUES (10, '배우');
    
INSERT INTO JOB
    VALUES (20, '가수');
    
INSERT INTO JOB
    VALUES (30, 'MC');

SELECT *
    FROM PERSON;

INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '배우'),
                '홍길동', 100, 100, 100);

INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '배우'),
                '정우성', 90, 80, 81);

INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '배우'),
                '박세영', 80, 90, 80);

INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '가수'),
                '배수지', 20, 90, 90);
        
INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '가수'),
                '설현', 95, 95, 95);
                
COMMIT;

--  ★ 2번 쿼리 (해당직업명의 등수, 이름, 직업명, 국, 영, 수, 총점이 큰 순 정렬)
--  INLINE VIEW 서브쿼리
SELECT NAME || '('||NO||'번)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM
    FROM PERSON P, JOB J
    WHERE P.JNO = J.JNO AND JNAME = '배우'
    ORDER BY SUM DESC;

--  ROWNUM ( JAVA에서 쓸 예정 )
SELECT ROWNUM RANK, S.*
    FROM (SELECT NAME || '('||NO||'번)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM
                FROM PERSON P, JOB J
                WHERE P.JNO = J.JNO AND JNAME = '배우'
                ORDER BY SUM DESC) S;
    
--  ★ 3번 쿼리 (전체 입력된 사람의 등수, 이름, 직업명, 국, 영, 수, 총점, 총점이 큰 순 정렬)
--  INLINE VIEW 서브쿼리
SELECT NAME || '('||NO||'번)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM
    FROM PERSON P, JOB J
    WHERE P.JNO = J.JNO
    ORDER BY SUM DESC;

--  ROWNUM ( JAVA에서 쓸 예정 )
SELECT ROWNUM RANK, S.*
    FROM (SELECT NAME || '('||NO||'번)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM
                FROM PERSON P, JOB J
                WHERE P.JNO = J.JNO
                ORDER BY SUM DESC) S;

--  ★ 직업명 리스트 가져오기
SELECT JNAME
    FROM JOB
    ORDER BY JNO;











