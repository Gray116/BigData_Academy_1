--  �� INDEX : PRIMARY KEY�� �ƴ� �ʵ带 �߽����� ��ȸ�� ���� �ϴ� ���, ��ȸ�ӵ� ����� ���� ����
SELECT *
    FROM USER_INDEXES;

DROP TABLE EMP01;

CREATE TABLE EMP01
    AS SELECT *
            FROM EMP;

--      1�� (28��), 2��(56��)
INSERT INTO EMP01
    SELECT *
        FROM EMP01;
        
SELECT COUNT(*)
    FROM EMP01;

--      12�� (22����)    
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

--  �ε��� ���� �� (0.042��)
SELECT *
    FROM EMP01
    WHERE ENAME = 'HONG';

--  �ε��� ���� �� (0.002��)
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














































































