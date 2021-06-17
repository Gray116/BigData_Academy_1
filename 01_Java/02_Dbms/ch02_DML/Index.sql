--  ★ INDEX : PRIMARY KEY가 아닌 필드를 중심으로 조회를 많이 하는 경우, 조회속도 향상을 위해 생성
SELECT *
    FROM USER_INDEXES;

DROP TABLE EMP01;

CREATE TABLE EMP01
    AS SELECT *
            FROM EMP;

--      1번 (28개), 2번(56개)
INSERT INTO EMP01
    SELECT *
        FROM EMP01;
        
SELECT COUNT(*)
    FROM EMP01;

--      12번 (22만개)    
INSERT INTO EMP01
    SELECT *
        FROM EMP01;

SELECT COUNT(*)
    FROM EMP01;

SELECT TO_CHAR(COUNT(*), '9,999,999')
    FROM EMP01;

--
INSERT INTO EMP01 (EMPNO, ENAME, DEPTNO)
    VALUES (1111, 'HONG', 40);

INSERT INTO EMP01
    SELECT *
        FROM EMP01;

SELECT TO_CHAR(COUNT(*), '9,999,999')
    FROM EMP01;

--  인덱스 생성 전 (0.042초)
SELECT *
    FROM EMP01
    WHERE ENAME = 'HONG';

--  인덱스 생성 후 (0.002초)
CREATE INDEX IDX_EMP01_ENAME
    ON EMP01 (ENAME);

SELECT *
    FROM EMP01
    WHERE ENAME = 'HONG';

SELECT *
    FROM USER_INDEXES
    WHERE INDEX_NAME = 'IDX_EMP01_ENAME';

DROP INDEX IDX_EMP01_ENAME;

SELECT *
    FROM EMP01
    WHERE ENAME = 'HONG';














































































