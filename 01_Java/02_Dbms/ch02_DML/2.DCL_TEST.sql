SHOW USER;

SELECT ENAME, DNAME, LOC
    FROM SCOTT.EMP E, SCOTT.DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    
SELECT *
    FROM SCOTT.EMP;

EXIT;