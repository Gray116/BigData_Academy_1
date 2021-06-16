--  ★ 트랜잭션 (COMMIT, ROLLBACK, SAVEPOINT) : DML명령어에 적용
--      1. COMMIT

--      2. ROLLBACK

--      3. SAVEPOINT
DROP TABLE DEP1;

CREATE TABLE DEP1
    AS SELECT *
            FROM DEPT;
            
DESC DEP1;

SELECT *
    FROM DEP1;
    
DELETE FROM DEP1
    WHERE DEPTNO = 40;
    
SELECT *
    FROM DEP1;
    
ROLLBACK;

--      3-1) 새로운 트랜잭션 시작
SELECT *
    FROM DEP1;
    
DELETE FROM DEP1
    WHERE DEPTNO = 40;
    
COMMIT;

--      3-2) 새로운 트랜잭션 시작
SELECT *
    FROM DEP1;
    
DELETE FROM DEP1
    WHERE DEPTNO = 30;

SELECT *
    FROM DEP1;

SAVEPOINT C1;

DELETE FROM DEP1
    WHERE DEPTNO = 20;
    
SELECT *
    FROM DEP1;
    
SAVEPOINT C2;

DELETE FROM DEP1
    WHERE DEPTNO = 10;

SELECT *
    FROM DEP1;
    
ROLLBACK TO C2;

SELECT *
    FROM DEP1;

COMMIT;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    