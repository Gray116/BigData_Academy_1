--  �μ��̸��� �˻��Ͽ� ������� ���
SELECT * FROM DEPT WHERE DNAME = 'SALES';
        
SELECT W.EMPNO, W.ENAME, W.SAL, M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D
    WHERE W.MGR = M.EMPNO
        AND W.DEPTNO = D.DEPTNO
        AND DNAME = 'ACCOUNTING';
        
--  �μ� �߰�
select *
    from dept;

delete from dept
    where deptno = 50;

delete from dept
    where deptno = 70;

INSERT INTO DEPT
    VALUES (50, 'IT', 'MAPO');
    
commit;

--  �μ���ȣ �˻��ؼ� �ش� �μ���ȣ�� ���� Ȯ��
select *
    from dept
    where deptno = 10;
    
insert into dept
    values (50, 'bigdata', 'goyang');

--  ����
UPDATE DEPT
    SET DNAME = 'IT', LOC = 'MAPO'
    WHERE DEPTNO = 50;

SELECT *
    FROM DEPT;

COMMIT;

select deptno
    from dept
    where deptno = 10;
    
--  ����
DELETE FROM DEPT WHERE DEPTNO = 50;

COMMIT;
    
SELECT *
    FROM DEPT;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    