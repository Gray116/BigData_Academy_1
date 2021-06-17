-- �� JOIN
--      ���̺� 2�� �̻��� �����Ͽ� ��ȸ�ϴ� ���
SELECT *
    FROM EMP
    WHERE ENAME = 'SCOTT';

SELECT *
    FROM DEPT
    WHERE DEPTNO = 20;



--   �� CROSS JOIN : FROM���� ���̺� 2�� �̻�
--      EMP ���̺��� 1�� * DEPT ���̺��� 4��
SELECT *
    FROM EMP, DEPT
    WHERE ENAME = 'SCOTT';

SELECT *
    FROM EMP, DEPT;



--   �� EQUI JOIN
--      ���� �ʵ��� DEPTNO���� ��ġ�Ǵ� ���Ǹ� JOIN
SELECT *
    FROM EMP, DEPT
    WHERE (ENAME = 'SCOTT') AND (EMP.DEPTNO = DEPT.DEPTNO);

--      ���̺��� ��Ī�� ������ �� ��Ī���θ� ���̺��� �׼��� �� �� �ִ�
SELECT EMPNO NO, ENAME, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY NO;

--  ��������
--   1) �޿��� 2000 �̻��� ������ �̸�, ����, �޿�, �μ���, �ٹ��� ���
SELECT ENAME �̸�, JOB ����, SAL �޿�, DNAME �μ���, LOC �ٹ���
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL >= 2000;

--   2) �ٹ����� CHICAGO�� ����� �̸�, ����, �޿��� ���
SELECT ENAME �̸�, JOB ����, SAL �޿�, LOC �ٹ���
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC = 'CHICAGO';
    
--   3) �μ���ȣ�� 10�̰ų� 20���� ����� �̸�(ENAME), ����(JOB), �ٹ���(LOC)�� �޿������� ���
SELECT ENAME �̸�, JOB ����, LOC �ٹ���
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO IN(10,20)
    ORDER BY SAL;

--   4) JOB�� SALESMAN�̰ų� MANAGER�� ����� �̸�, �޿�, ��, ����, �μ���, �ٹ�����
--      ������ ū ������ ����
SELECT ENAME �̸�, SAL �޿�, COMM ��, SAL*12+NVL(COMM,0) ����, DNAME �μ���, LOC �ٹ���
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND E.JOB IN('SALESMAN', 'MANAGER')
    ORDER BY ���� DESC;
    
--   5) COMM�� NULL�̰� �޿��� 1200�̻��� ����� �̸�, �޿�, �Ի���, �μ���ȣ, �μ����� ���
--      �μ����, �޿��� ū������ ����
SELECT ENAME �̸�, SAL �޿�, HIREDATE �Ի���, E.DEPTNO �μ���ȣ, DNAME �μ���
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND (COMM IS NULL) AND (SAL>=1200)
    ORDER BY �μ���, �޿� DESC;
    
--   6) 'NEW YORK'���� �ٹ��ϴ� ����� �̸��� �޿��� ���
SELECT ENAME �̸�, SAL �޿�
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND LOC = 'NEW YORK';

--   7) 'ACCOUNTING' �μ� �Ҽ��� ����̸��� �Ի����� ���
SELECT ENAME �̸�, HIREDATE �Ի���
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND DNAME = 'ACCOUNTING';

--   8) ������ MANAGER�� ����� �̸�, �μ��� ���
SELECT ENAME �̸�, DNAME �μ���
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND JOB = 'MANAGER';

--   9) COMM�� NULL�� �ƴ� ����� �̸�, �޿�, �μ���ȣ, �ٹ��� ���
SELECT ENAME �̸�, SAL �޿�, E.DEPTNO �μ���ȣ, LOC �ٹ���
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND (COMM IS NOT NULL);
 
 
 
 --  �� NON-EQUI JOIN   
SELECT *
    FROM EMP
    WHERE ENAME = 'SCOTT';

SELECT *
    FROM SALGRADE;

--      CROSS JOIN �߻�, EMP�� 1�� X SALGRADE 5��    
SELECT *
    FROM EMP, SALGRADE
    WHERE ENAME = 'SCOTT';
    
SELECT * 
    FROM EMP, SALGRADE
    WHERE (ENAME = 'SCOTT') AND (SAL BETWEEN LOSAL AND HISAL);
    
--  1) ��� ����� ���, �̸�, ����, �����, �޿�, �޿����(ex. 1���, 2���)
SELECT EMPNO ���, ENAME �̸�, JOB ����, MGR �����, SAL �޿�, GRADE||'���' �޿����
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;

--  2) COMM�� NULL�� �ƴ� ����� �̸�, �޿�, �޿����, �μ���ȣ, �μ��̸�, �ٹ��� ���
SELECT ENAME �̸�, SAL �޿�, GRADE �޿����, E.DEPTNO �μ���ȣ, DNAME �μ��̸�, D.LOC �ٹ���
    FROM EMP E, DEPT D, SALGRADE
    WHERE (E.DEPTNO = D.DEPTNO) 
                AND (SAL BETWEEN LOSAL AND HISAL)
                AND (COMM IS NOT NULL);

--  3) �̸�, �޿�, �Ի���, �޿������ ���
SELECT ENAME �̸�, SAL �޿�, HIREDATE �Ի���, GRADE �޿����
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;

--  4) �̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ��� ���
SELECT ENAME �̸�, SAL �޿�, HIREDATE �Ի���, GRADE �޿����, DNAME �μ���, LOC �ٹ���
    FROM EMP E, DEPT D, SALGRADE
    WHERE (E.DEPTNO = D.DEPTNO) AND (SAL BETWEEN LOSAL AND HISAL);

--  5) �̸�, �޿�, �޿����, ���� ��� (��, �μ��� ����, ������ ������)
SELECT ENAME �̸�, SAL �޿�, GRADE �޿����, SAL*12+NVL(COMM, 0) ����
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL
    ORDER BY DEPTNO, ����;
    
SELECT ENAME �̸�, SAL �޿�, GRADE �޿����, SAL*12+NVL(COMM, 0) ����
    FROM EMP E, SALGRADE, DEPT D
    WHERE (SAL BETWEEN LOSAL AND HISAL) AND (E.DEPTNO = D.DEPTNO)
    ORDER BY DNAME, ����;
    
--  6) �̸�, ����, �޿�, �޿����, �μ���ȣ, �μ����� ��� (��, �޿��� 1000�� 3000����,
--      �μ���, ������, �޿��� ū �� ����)
SELECT ENAME �̸�, JOB ����, SAL �޿�, GRADE �޿����, E.DEPTNO �μ���ȣ, DNAME �μ���
    FROM EMP E, DEPT D, SALGRADE
    WHERE (E.DEPTNO = D.DEPTNO) AND (SAL BETWEEN LOSAL AND HISAL)
                AND (SAL BETWEEN 1000 AND 3000)
    ORDER BY �μ���, ����, �޿� DESC;

--  7) �̸�, �޿�, ���, �Ի���, �ٹ����� ��� (��, 81�⿡ �Ի��� ����� ���, ����� ū ��
--      ���� ����)
SELECT ENAME �̸�, SAL �޿�, GRADE ���, HIREDATE �Ի���, LOC �ٹ���
    FROM EMP E, DEPT D, SALGRADE
    WHERE (E.DEPTNO = D.DEPTNO) AND TO_CHAR(HIREDATE, 'RR') = 81
                AND(SAL BETWEEN LOSAL AND HISAL)
    ORDER BY ��� DESC;
    
    
    
--  �� SELF JOIN
SELECT EMPNO, ENAME, MGR
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
SELECT EMPNO, ENAME
    FROM EMP
    WHERE EMPNO = 7566;
    
SELECT WORKER.EMPNO, WORKER.ENAME "EMPLOYEE", WORKER.MGR "MGRNO", MANAGER.ENAME "MANAGER"
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR = MANAGER.EMPNO AND WORKER.ENAME = 'SMITH';
    
--  1) ��� ����� ���, �̸�, ����� ���, ����� �̸��� ���
SELECT WORKER.EMPNO ���, WORKER.ENAME ���, MANAGER.EMPNO ����ȣ, MANAGER.ENAME ����
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR = MANAGER.EMPNO;

--  2) 'SMITH�� ���� FORD'�� �� ���� ���
SELECT W.ENAME||'�� ���� ' || M.ENAME||'�̴�.' A
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--  3) ����� �̸��� 'KING'�� ������� �̸��� JOB�� ���
SELECT W.ENAME ����̸�, W.JOB ����
    FROM EMP W, EMP M
    WHERE (W.MGR = M.EMPNO) AND M.ENAME = 'KING';

--  4) 'SCOTT'�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸��� ���
SELECT ENAME, DEPTNO
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
    
SELECT E2.ENAME, E2.DEPTNO
    FROM EMP E1, EMP E2
    WHERE E1.ENAME = 'SCOTT'
        AND E2.ENAME != 'SCOTT'
        AND E1.DEPTNO = E2.DEPTNO;

--  5) 'SCOTT'�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ���
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');

SELECT * FROM EMP;
INSERT INTO EMP VALUES(9999, 'HONG', NULL, NULL, NULL, 9000, NULL, 50);

SELECT E2.ENAME
    FROM EMP E1, EMP E2, DEPT D1, DEPT D2
    WHERE E1.ENAME = 'SCOTT'
        AND E2.ENAME != 'SCOTT'
        AND E1.DEPTNO = D1.DEPTNO
        AND E2.DEPTNO = D2.DEPTNO
        AND D1.LOC = D2.LOC;

ROLLBACK; -- DML ���



--   �� OUTER JOIN
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    
--  1) 'SMITH�� �Ŵ����� FORD�Դϴ�' �������� ���
SELECT W.ENAME||'�� �Ŵ����� '||M.ENAME||'�Դϴ�.' �޼���
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    
--  2) 'KING�� �Ŵ����� �����ϴ�.' �������� ���
SELECT W.ENAME||'�� �Ŵ����� '||NVL(M.ENAME, '�����ϴ�') �޼���
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--  3) ���� ��� ���
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+) = M.EMPNO AND W.ENAME IS NULL;
    
SELECT M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+) = M.EMPNO AND W.ENAME IS NULL;
    
    
    
--  �� �������� (���� ���� ����)
--   1) �̸�, ���ӻ��
SELECT W.ENAME �̸�, M.MGR ���ӻ��, M.ENAME ����
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--   2) �̸�, �޿�, ����, ���ӻ��
SELECT W.ENAME �̸�, W.SAL �޿�, W.JOB ����, M.ENAME ���ӻ��
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--   3) �̸�, �޿�, ����, ���ӻ��. (��簡 ���� �������� ��ü ���� �� ���.
--      ��簡 ���� �� '����'���� ���)
SELECT W.ENAME �̸�, W.SAL �޿�, W.JOB ����, NVL(M.ENAME, '����') ���ӻ��
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--   4) �̸�, �޿�, �μ���, ���ӻ���
SELECT W.ENAME �̸�, W.SAL �޿�, DNAME �μ���, M.ENAME ���ӻ��
    FROM EMP W, EMP M, DEPT D
    WHERE (W.MGR = M.EMPNO) AND (W.DEPTNO = D.DEPTNO);

--   5) �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ���, (��簡 ���� �������� ��ü ���� �� ���)
SELECT W.ENAME �̸�, W.SAL �޿�, W.DEPTNO �μ��ڵ�, DNAME �μ���, LOC �ٹ���, M.ENAME ���ӻ��
    FROM EMP W, EMP M, DEPT D
    WHERE (W.MGR = M.EMPNO(+)) AND (W.DEPTNO = D.DEPTNO);

--   6) �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���
SELECT W.ENAME �̸�, W.SAL �޿�, GRADE ���, D.DNAME �μ���, M.ENAME ���ӻ��
    FROM EMP W, EMP M, DEPT D, SALGRADE
    WHERE (W.MGR = M.EMPNO) AND (W.DEPTNO = D.DEPTNO)
        AND (W.SAL BETWEEN LOSAL AND HISAL) AND (W.SAL >= 2000);

--   7) �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����)
SELECT W.ENAME �̸�, W.SAL �޿�, GRADE ���, DNAME �μ���, M.ENAME ���ӻ��
    FROM EMP W, EMP M, DEPT D, SALGRADE
    WHERE (W.MGR = M.EMPNO(+)) AND (W.DEPTNO = D.DEPTNO)
        AND (W.SAL BETWEEN LOSAL AND HISAL)
    ORDER BY �μ���;

--   8) �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12 �� comm�� null�̸� 0
SELECT W.ENAME �̸�, W.SAL �޿�, GRADE ���, DNAME �μ���, (W.SAL*12+NVL(W.COMM,0)) ����,  M.ENAME ���ӻ��
    FROM EMP W, EMP M, DEPT D, SALGRADE
    WHERE (W.MGR = M.EMPNO) AND (W.DEPTNO = D.DEPTNO)
        AND (W.SAL BETWEEN LOSAL AND HISAL);

--   9) 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����
SELECT W.ENAME �̸�, W.SAL �޿�, GRADE ���, DNAME �μ���, (W.SAL*12+NVL(W.COMM,0)) ����, M.ENAME ���ӻ��
    FROM EMP W, EMP M, DEPT D, SALGRADE
    WHERE (W.MGR = M.EMPNO) AND (W.DEPTNO = D.DEPTNO)
        AND (W.SAL BETWEEN LOSAL AND HISAL)
    ORDER BY �μ���, �޿� DESC;
    
    
--  �������� PART2
--   1)EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT E.ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;

--   2) EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ���
SELECT E.ENAME, JOB, E.SAL, E.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC = 'NEW YORK';

--   3) EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ���
SELECT ENAME, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NOT NULL
        AND COMM != 0;

--   4) EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���
SELECT ENAME, JOB, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND ENAME LIKE '%L%';

--   5) ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY ENAME;

--   6) ���, �����, �޿�, �μ����� �˻��϶�. 
--      �� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL>=2000
    ORDER BY SAL DESC;

--   7) ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
--      ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB = 'MANAGER' AND SAL >=2500
    ORDER BY EMPNO;

--   8) ���, �����, ����, �޿�, ����� �˻��Ͻÿ�. ��, �޿����� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL DESC;

--   9) ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü)
SELECT W.ENAME, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--   10) �����, ����, ����� ������ �˻��Ͻÿ�
SELECT W.ENAME, M.ENAME ���, MM.ENAME "����� ���"
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO AND M.MGR = MM.EMPNO;

--   11) ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�
SELECT W.ENAME, M.ENAME ���, MM.ENAME "����� ���"
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO(+) AND M.MGR = MM.EMPNO(+);