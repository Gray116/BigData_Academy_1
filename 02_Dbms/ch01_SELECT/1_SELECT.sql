-- [����] SELECT(��ȸ) �� -
-- �� SQL���� �ۼ���

select * from tab; -- �� ����(scott)�� ������ �ִ� ���̺��� ��ȸ, �빮�ڷ� �Է��ϴ� ���� �ʿ�.

SELECT * from DEPT; -- DEPT ���̺� �ִ� ��� ��,���� ���

SELECT * from EMP; -- EMP ���̺� �ִ� ��� ��,���� ���

-- 1). DEPT ���̺��� ���� Ȯ��
DESC EMP;

-- �� SQL�� ���� (Ư�� ���� ���)
SELECT EMPNO, ENAME, SAL, JOB from EMP; 
SELECT EMPNO AS ���, ENAME �̸�, SAL AS "�޿�", JOB AS "��å"  -- ��Ī�� AS, "" ���� ����
FROM EMP;

SELECT EMPNO "�� ��", ENAME AS "�� ��", SAL "�� ��", JOB AS "�� å" -- ���Ⱑ ���� ��쿡�� �� ""�ȿ� �Է�
FROM EMP;

SELECT EMPNO NO, ENAME NAME, SAL SALARY FROM EMP;

-- �� Ư�� �� ����ϴ� WHERE��
--  1) �񱳿�����
SELECT EMPNO ���, ENAME �̸�, SAL �޿� FROM EMP
WHERE SAL = 3000;

SELECT EMPNO ���, ENAME �̸�, SAL �޿� FROM EMP
WHERE SAL != 3000;

SELECT EMPNO ���, ENAME �̸�, SAL �޿� FROM EMP
WHERE SAL <> 3000;

SELECT EMPNO ���, ENAME �̸�, SAL �޿� FROM EMP
WHERE SAL ^= 3000;

---- 10�� �μ��� ����� ��� �ʵ带 ���

SELECT * FROM EMP
WHERE DEPTNO = 10;

---- �̸���(ENAME)�� FORD�� ������ EMPNO, ENAME, MGR�� ���

SELECT EMPNO ���, ENAME �̸�, MGR ��� FROM EMP
WHERE ENAME = 'FORD'; -- ���� �Է½� ''�� ���α�

-- �� ��������
--  1) �޿�(SAL)�� 2000�̻� 3000�̸��� ������ ��� �ʵ� ���
SELECT * FROM EMP
WHERE SAL>=2000 AND SAL<3000;

---- �񱳿����� ����, ����, DATE�� �ʵ� ��� ����

-- 2) ����� �̸�(ENAME)�� 'A', 'B', 'C'�� �����ϴ� ����� ��� �ʵ� ���
SELECT * FROM EMP
WHERE ENAME < 'D'; -- D���� ���� ���ڷ� �����ϴ� ����� ��µ�

-- 3) 81�� ������ �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP
WHERE HIREDATE < '81/01/01';

-- 4) 82�⵵�� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP
WHERE HIREDATE > '81/12/31' AND HIREDATE < '83/01/01';

-- 5) ��¥ ǥ��� ���� (���� : RR/MM/DD)
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-RR';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR-MM-DD';
SELECT HIREDATE FROM EMP;

-- 6) ������ 2400 �̻��� ������ ENAME, SAL, ���� ��� (���� = SAL*12)
SELECT ENAME �̸�, SAL �޿�, (SAL*12) ���� FROM EMP
    WHERE (SAL*12) > 24000;

SELECT ENAME �̸�, SAL �޿�, (SAL*12) ���� FROM EMP
    WHERE (SAL*12) > 24000;

-- �� ������� - FROM, WHERE, SELECT, ORDER BY
SELECT ENAME �̸�, SAL �޿�, (SAL*12) ����
    FROM EMP
    WHERE (SAL*12) >= 24000
    ORDER BY ����;

-- 7) 10�� �μ����� ��å(JOB)�� MANAGER�� ����� ��� �ʵ�
SELECT * FROM EMP
    WHERE DEPTNO =10 AND JOB = 'MANAGER';
    
-- 8) 10�� �μ��̰ų� ��å�� MANAGER�� ����� ��� �ʵ�
SELECT * FROM EMP
    WHERE DEPTNO = 10 OR JOB = 'MANAGER';

-- 9) �μ���ȣ�� 10���� �ƴ� ����� ��� �ʵ�
SELECT * FROM EMP
    WHERE NOT DEPTNO = 10
    ORDER BY DEPTNO;
    
-- �� ��� ǥ����
SELECT ENAME, SAL, SAL+100 UPGRADE_SAL FROM EMP
    WHERE DEPTNO = 10;
    
--  1) ��� ����� �̸�, ����(SAL), ��(COMM), ����(SAL*12+COMM)�� ���
--      ��������� ����� null�� �����ϸ� ����� null
--      NVL(NULL�ϼ��� �ִ� �ʵ��, ��ġ��), �ݵ�� ���� Ÿ���� ���ƾ� ��
SELECT ENAME �̸�, SAL ����, COMM ��, SAL*12+COMM ���� FROM EMP;
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) FROM EMP;

-- 2) ��� ����� �����, �����(MGR)�� ��� (��, ��簡 ������ 0)
SELECT ENAME �̸�, NVL(MGR, 0) ����� FROM EMP
ORDER BY �����;

-- �� ���Ῥ����(||) : ���̳� ���ڸ� ����
SELECT ENAME || '��(��) ' || JOB AS EMPLOYEES FROM EMP;

-- 1) "SMITH : 1 YEAR SALARY = XXXX"�� ���� ��� ���� ���(��, ������ SAL*12+COMM)
SELECT ENAME || '�� 1�� ���� = ' || (SAL*12+NVL(COMM, 0)) MESSAGE FROM EMP;

-- �� �ߺ� ���� (DISTINCT)
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;
SELECT * FROM DEPT;

-- �� �������� �� Ǯ��
--  1. emp ���̺��� ���� ��� (ORACLE ���)
DESC EMP;

--  2. emp ���̺��� ��� ������ ��� 
SELECT * FROM EMP;

--  3. �� scott �������� ��밡���� ���̺� ���
SELECT * FROM TAB;
SHOW USER;

--  4. emp ���̺��� ���, �̸�, �޿�, ����, �Ի��� ���
SELECT EMPNO ���, ENAME �̸�, SAL �޿�, JOB ����, HIREDATE �Ի��� FROM EMP;

--  5. emp ���̺��� �޿��� 2000�̸��� ����� ���, �̸�, �޿� ���
SELECT EMPNO ���, ENAME �̸�, SAL �޿� FROM EMP
    WHERE SAL < 2000;

--  6. �Ի����� 81/02���Ŀ� �Ի��� ����� ���, �̸�, ����, �Ի��� ���
SELECT EMPNO ���, ENAME �̸�, JOB ����, HIREDATE �Ի��� FROM EMP
    WHERE HIREDATE > '81/02/01';

--  7. ������ SALESMAN�� ����� ��� �ڷ� ���
SELECT * FROM EMP
    WHERE JOB = 'SALESMAN';

--  8. ������ CLERK�� �ƴ� ����� ��� �ڷ� ���
SELECT * FROM EMP
    WHERE JOB != 'CLERK';
    
SELECT * FROM EMP
    WHERE JOB <> 'CLERK';
    
SELECT * FROM EMP
    WHERE NOT JOB = 'CLERK';

SELECT * FROM EMP
    WHERE JOB ^= 'CLERK';

--  9. �޿��� 1500�̻��̰� 3000������ ����� ���, �̸�, �޿� ���
SELECT EMPNO ���, ENAME �̸�, SAL �޿� FROM EMP
    WHERE SAL >= 1500 AND SAL<= 3000;

--  10. �μ��ڵ尡 10���̰ų� 30�� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO ���, ENAME �̸�, JOB ����, DEPTNO �μ��ڵ� FROM EMP
    WHERE DEPTNO = 10 OR DEPTNO = 30;

--  11. ������ SALESMAN�̰ų� �޿��� 3000�̻��� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO ���, ENAME �̸�, JOB ����, DEPTNO �μ��ڵ�, SAL �޿� FROM EMP
    WHERE JOB = 'SALESMAN' OR SAL>=3000;

--  12. �޿��� 2500�̻��̰� ������ MANAGER�� ����� ���, �̸�, ����, �޿� ���
SELECT EMPNO ���, ENAME �̸�, JOB ����, SAL �޿� FROM EMP
    WHERE SAL>=2500 AND JOB = 'MANAGER';

--  13.��ename�� XXX �����̰� ������ XX�١� ��Ÿ�Ϸ� ��� ���(������ SAL*12+COMM)
SELECT ENAME || '��(��) ' || JOB || '�̰� ������ ' || (SAL*12+NVL(COMM, 0)) || '�̴�.' AS MGR FROM EMP;

-- �� SQL ������ (BETWEEN , IN, LIKE, IS NULL)
-- 8-1 BETWEEN
--  1) SAL�� 1500�̻� 3000������ ���, �̸�, �޿�
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL>=1500 AND SAL<=3000;

-- �ʵ�� BETWEEN A AND B, A���� B����(A, B����)
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL BETWEEN 1500 AND 3000;
    
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL NOT BETWEEN 1500 AND 3000;

-- 2) 82�⵵�� �Ի��� ������ ��� �ʵ� ���
SELECT * FROM EMP
    WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
    
SELECT * FROM EMP
    WHERE HIREDATE NOT BETWEEN '82/01/01' AND '82/12/31';

-- 3) ��� �̸��� 'B', 'C'�� �����ϴ� ����� ��� �ʵ� ���
SELECT * FROM EMP 
    WHERE ENAME BETWEEN 'B' AND 'D' AND ENAME != 'D';



-- 8-2 IN
--  1) �μ� ��ȣ�� 10�� 20��, 40�� �μ��� ����� ��� �ʵ� ���
SELECT * FROM EMP
    WHERE DEPTNO = 10 OR DEPTNO = 20 OR DEPTNO = 40;

SELECT * FROM EMP
    WHERE DEPTNO IN(10, 20, 40);

-- 2) �μ� ��ȣ�� 10��, 20��, 40���� �ƴ� ����� ��� �ʵ� ���

SELECT * FROM EMP
    WHERE DEPTNO NOT IN(10, 20, 40);
    
SELECT * FROM EMP
    WHERE DEPTNO != 10 AND DEPTNO != 20 AND DEPTNO != 30;

-- 3) ����� 7902, 7788, 7566�� ����� ��� �ʵ�

SELECT * FROM EMP
    WHERE EMPNO IN(7902, 7788, 7566);



-- 8-3 LIKE
--  1) �̸��� M���� �����ϴ� ����� ��� �ʵ� ���
--      %�� 0���� �̻��� ��Ÿ��
SELECT * FROM EMP
    WHERE ENAME LIKE 'M%';

--  2) �̸��� N�� ���� ����� ��� �ʵ� ���
SELECT * FROM EMP
    WHERE ENAME LIKE '%N%';

--  3) S�� ������ ����� ��� �ʵ� ���
SELECT * FROM EMP
    WHERE ENAME LIKE '%S';

-- 4) SAL�� 5�� ������ ����� ��� �ʵ� ���
SELECT * FROM EMP
    WHERE SAL LIKE '%5';

-- 5) 82�⵵�� �Ի��� ����� ��� �ʵ� ���
--      NOT LIKE�� �ϰ� �Ǹ� �� ���Ǹ� ����
SELECT * FROM EMP
    WHERE HIREDATE LIKE '82/%';

SELECT * FROM EMP
    WHERE HIREDATE NOT LIKE '82/%';
    
-- 6) 1���� �Ի��� ����� ��� �ʵ� ���
SELECT * FROM EMP
    WHERE HIREDATE LIKE '__/01/__';



-- 8-4 IS NULL
--  1) �󿩱��� ���� ����� ��� �ʵ带 ���
SELECT * FROM EMP
    WHERE COMM IS NULL OR COMM = 0;

--  2) �󿩱��� �ִ� ����� ��� �ʵ带 ���
SELECT * FROM EMP
    WHERE COMM IS NOT NULL AND COMM != 0;



-- �� ����
--  1) �������� ����
SELECT ENAME, SAL FROM EMP
    ORDER BY SAL;
    
SELECT ENAME, SAL FROM EMP
    ORDER BY SAL ASC;
    
--  2) �������� ����
SELECT ENAME, SAL FROM EMP
    ORDER BY SAL DESC;
    
--  3) ����(�ð�, ��¥, �̸�)�� ����
SELECT ENAME, SAL FROM EMP
    ORDER BY ENAME;
    
SELECT ENAME, SAL, HIREDATE FROM EMP
    ORDER BY HIREDATE DESC;

--  4) �̸�, ����(SAL*12+COMM)�� ���(������ ������, ������ ���� ��� �̸���)
SELECT ENAME �̸�, SAL*12+NVL(COMM, 0) ���� FROM EMP
    ORDER BY ���� DESC, �̸�;
    
-- 5) ���, �̸�, �޿�, �μ���ȣ ���(�μ���, �μ��� ������ �Ի��� ������ ���)
SELECT EMPNO ���, ENAME �̸�, SAL �޿�, DEPTNO �μ���ȣ FROM EMP
    ORDER BY DEPTNO, HIREDATE;



--  ��������
--1.	EMP ���̺��� sal�� 3000�̻��� ����� empno, ename, job, sal�� ���
SELECT EMPNO ���, ENAME �̸�, JOB ����, SAL �޿�
    FROM EMP
    WHERE SAL >= 3000;

--2.	EMP ���̺��� empno�� 7788�� ����� ename�� deptno�� ���
SELECT ENAME �̸�, DEPTNO �μ���ȣ 
    FROM EMP
    WHERE EMPNO = 7788;

--3.	������ 24000�̻��� ���, �̸�, �޿� ��� (�޿�������)
SELECT EMPNO ���, ENAME �̸�, SAL*12+NVL(COMM, 0) �޿� 
    FROM EMP
    WHERE SAL*12+NVL(COMM, 0) >= 24000
    ORDER BY �޿�;

--4.	EMP ���̺��� hiredate�� 1981�� 2�� 20�� 1981�� 5�� 1�� ���̿� �Ի��� ����� 
--ename,job,hiredate�� ����ϴ� SELECT ������ �ۼ� (�� hiredate ������ ���)
SELECT ENAME �̸�, JOB ����, HIREDATE �Ի���
    FROM EMP
    WHERE HIREDATE BETWEEN '81/02/20' AND '81/05/01'
    ORDER BY HIREDATE;

--TO_DATE(����EX)81/02/20, ����EX)'RR/MM/DD')�� ���ڸ� ��¥������ ��ȯ
--TO_CHAR(��¥��, ����)
SELECT ENAME �̸�, JOB ����, HIREDATE �Ի���
    FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('81/02/20', 'RR/MM/DD')
                                                    AND TO_DATE('1981/05/01', 'YYYY/MM/DD')
    ORDER BY HIREDATE;

--5.	EMP ���̺��� deptno�� 10,20�� ����� ��� ������ ��� (�� ename������ ����)
SELECT * 
    FROM EMP
    WHERE DEPTNO = 10 OR DEPTNO = 20
    ORDER BY ENAME;

--6.	EMP ���̺��� sal�� 1500�̻��̰� deptno�� 10,30�� ����� ename�� sal�� ���
-- (�� HEADING�� employee�� Monthly Salary�� ���)
SELECT ENAME "EMPLOYEE", SAL "MONTHLY SALARY"
    FROM EMP
    WHERE SAL>=1500 AND DEPTNO IN(10, 30);

--7.	EMP ���̺��� hiredate�� 1982���� ����� ��� ������ ���
SELECT *
    FROM EMP
    WHERE HIREDATE LIKE '82%';
    
SELECT *
    FROM EMP
    WHERE TO_CHAR (HIREDATE, 'YYYY') = 1982;

--8.	�̸��� ù�ڰ� C����  P�� �����ϴ� ����� �̸�, �޿� �̸��� ����
SELECT ENAME �̸�, SAL �޿�
    FROM EMP 
    WHERE (ENAME BETWEEN 'C' AND 'Q') AND ENAME != 'Q'
    ORDER BY �̸�;

--9.	EMP ���̺��� comm�� sal���� 10%�� ���� ��� ����� ���Ͽ� �̸�, �޿�, �󿩱��� 
--����ϴ� SELECT ���� �ۼ�
SELECT ENAME �̸�, SAL �޿�, COMM �󿩱�
    FROM EMP
    WHERE COMM > SAL+SAL*0.1;

--10.	EMP ���̺��� job�� CLERK�̰ų� ANALYST�̰� sal�� 1000,3000,5000�� �ƴ� ��� ����� ������ ���
SELECT * 
    FROM EMP
    WHERE JOB IN('CLERK', 'ANALYST') AND SAL NOT IN(1000, 3000, 5000);

--11.	EMP ���̺��� ename�� L�� �� �ڰ� �ְ� deptno�� 30�̰ų� �Ǵ� mgr�� 7782�� ����� 
--��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * 
    FROM EMP
     WHERE ENAME LIKE '%L%L%' AND (DEPTNO = 30 OR MGR = 7782);

--12.	��� ���̺��� �Ի����� 81�⵵�� ������ ���,�����, �Ի���, ����, �޿��� ���
SELECT EMPNO ���, ENAME �̸�, HIREDATE �Ի���, JOB ����, SAL �޿�
    FROM EMP
    WHERE HIREDATE BETWEEN '80/12/31' AND '82/01/01';

SELECT EMPNO ���, ENAME �̸�, HIREDATE �Ի���, JOB ����, SAL �޿�
    FROM EMP
    WHERE HIREDATE LIKE '81%';

SELECT EMPNO ���, ENAME �̸�, HIREDATE �Ի���, JOB ����, SAL �޿�
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'RR') = '81';
    
SELECT EMPNO ���, ENAME �̸�, HIREDATE �Ի���, JOB ����, SAL �޿�
    FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('81/01/01', 'RR/MM/DD') AND TO_DATE('81/12/31', 'RR/MM/DD');

--13.	��� ���̺��� �Ի�����81���̰� ������ 'SALESMAN'�� �ƴ� ������ ���, �����, �Ի���, 
-- ����, �޿��� �˻��Ͻÿ�.
SELECT EMPNO ���, ENAME �̸�, HIREDATE �Ի���, JOB ����, SAL �޿�
    FROM EMP
    WHERE HIREDATE LIKE '81/%' AND NOT JOB = 'SALESMAN';
    
SELECT EMPNO ���, ENAME �̸�, HIREDATE �Ի���, JOB ����, SAL �޿�
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'RR') = '81' AND NOT JOB = 'SALESMAN';

--14.	��� ���̺��� ���, �����, �Ի���, ����, �޿��� �޿��� ���� ������ �����ϰ�, 
-- �޿��� ������ �Ի����� ���� ������� �����Ͻÿ�.
SELECT EMPNO ���, ENAME �����, HIREDATE �Ի���, JOB ����, SAL �޿�
    FROM EMP
    ORDER BY SAL DESC, HIREDATE;

--15.	��� ���̺��� ������� �� ��° ���ĺ��� 'N'�� ����� ���, ������� �˻��Ͻÿ�
SELECT EMPNO ���, ENAME ���
    FROM EMP
    WHERE ENAME LIKE '__N%';

--16.	��� ���̺�������(SAL*12)�� 35000 �̻��� ���, �����, ������ �˻� �Ͻÿ�.
SELECT EMPNO ���, ENAME �����, SAL*12+NVL(COMM, 0) ����
    FROM EMP
    WHERE SAL*12+NVL(COMM, 0) >= 35000;
    
--17 �̸��� A�� �� ����� ��� �ʵ带 ���
SELECT* 
    FROM EMP
    WHERE ENAME LIKE '%A%';

--18 �̸��� %�� �� ����� ��� �ʵ带 ���
SELECT  *
    FROM EMP
    WHERE ENAME LIKE '%\%%' ESCAPE '\';
    
INSERT INTO EMP VALUES (9999, 'LISA%', NULL, NULL, NULL, 9000, 9900, 40);

SELECT *
    FROM EMP
    WHERE EMPNO = 9999;

ROLLBACK;