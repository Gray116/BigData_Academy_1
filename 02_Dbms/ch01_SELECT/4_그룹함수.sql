--�� �׷��Լ�
--  1. ������ �Լ�

SELECT ENAME, ROUND(SAL, -3)
    FROM EMP;

--      �׷��Լ�
--          �׷��Լ�(MIN, MAX, COUNT)�� ����, ��¥, ������ ��� ��밡��
SELECT MAX(SAL)
    FROM EMP;
    
SELECT DEPTNO, MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    
--      �׷��Լ� �ǽ�
SELECT ROUND(AVG(SAL), 2)
    FROM EMP;
    
SELECT COUNT(SAL)
    FROM EMP;

SELECT AVG(SAL), SUM(SAL) / COUNT(SAL)
    FROM EMP;

SELECT AVG(COMM) ���, SUM(COMM) �հ�, COUNT(COMM) ����,
    SUM(COMM) / COUNT(COMM) ���2
    FROM EMP;

--      1) EMP ���̺��� ��(�ο�)��
SELECT COUNT(*)
    FROM EMP;
    
--      2) SAL�� ���, ��, �ּҰ�, �ִ밪, �л�, ǥ������
SELECT ROUND(AVG(SAL), 2), SUM(SAL), MIN(SAL), MAX(SAL), ROUND(VARIANCE(SAL), 2),
    ROUND(STDDEV(SAL)), COUNT(SAL)
    FROM EMP;

SELECT ROUND(SQRT(VARIANCE(SAL)), 2)
    FROM EMP;

--      ���� �ֱٿ� �Ի��� ����� �Ի��ϰ� �Ի����� ���� ������ ����� �Ի��� ���
SELECT MIN(HIREDATE), MAX(HIREDATE)
    FROM EMP;
--      �ֱ��Ի� : X,XXX�� �ٹ�, �����Ի� : XX,XXX�� �ٹ�2
SELECT MAX(HIREDATE)||' �ֱ��Ի� : '||TO_CHAR(TRUNC(MIN(SYSDATE - HIREDATE)), '99,999')||'�� �ٹ�'
    FROM EMP;
    
SELECT MIN(HIREDATE)||' �����Ի� : '||TO_CHAR(TRUNC(MAX(SYSDATE - HIREDATE)), '99,999')||'�� �ٹ�'
    FROM EMP;
    
--      10�� �μ� �Ҽ��� ��� �޿� ���
SELECT ROUND(AVG(SAL))
    FROM EMP
    WHERE DEPTNO = 10;
    
    
    
--  2. GROUP BY �Լ�
SELECT DEPTNO, MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;

--      �μ���ȣ�� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�(�Ҽ��� ���ڸ�)
SELECT DEPTNO, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL), 2)
    FROM EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;

--      �޿��� 5000�̸��� ����� ���ؼ��� �μ���ȣ�� �����, �ִ�޿�, �ּұ޿�, ��ձ޿� ���
SELECT DEPTNO, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL), 2)
    FROM EMP
    WHERE SAL < 5000
    GROUP BY DEPTNO
    ORDER BY DEPTNO;
    
--      �μ��� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�
SELECT DNAME, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2)
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
    GROUP BY DNAME
    ORDER BY DNAME;


    
--  3. HAVING �� : �׷� �Լ������ ���� ����
--      �μ���ȣ �� ��� �޿�(��� �޿��� 2000�̻��� �μ��� ���)
--          �ʵ��� ��Ī�� ORDER BY �������� ����, HAVING�� �Ұ�
SELECT DEPTNO, ROUND(AVG(SAL), 2)
    FROM EMP
    GROUP BY DEPTNO
    HAVING AVG(SAL) >= 2000
    ORDER BY AVG(SAL) DESC;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    











  
  
  
  
  
  
  
  
   