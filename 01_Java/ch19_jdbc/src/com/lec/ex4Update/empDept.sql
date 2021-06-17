--  부서이름을 검색하여 사원정보 출력
SELECT * FROM DEPT WHERE DNAME = 'SALES';
        
SELECT W.EMPNO, W.ENAME, W.SAL, M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D
    WHERE W.MGR = M.EMPNO
        AND W.DEPTNO = D.DEPTNO
        AND DNAME = 'ACCOUNTING';
        
--  부서 추가
select *
    from dept;

delete from dept
    where deptno = 50;

delete from dept
    where deptno = 70;

INSERT INTO DEPT
    VALUES (50, 'IT', 'MAPO');
    
commit;

--  부서번호 검색해서 해당 부서번호의 유무 확인
select *
    from dept
    where deptno = 10;
    
insert into dept
    values (60, 'bigdata', 'goyang');
    
select *
    from dept;
    
desc dept;
    
    