--   �� ������ �Լ�, ���� �Լ�
--          �Լ� = ������ �Լ� + �׷� �Լ�(���� �Լ�)
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY-MM-DD')
    FROM EMP;

SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY"��"MM"��"DD"��"')
    FROM EMP;

SELECT ENAME, INITCAP(ENAME)
    FROM EMP;
    
SELECT SUM(SAL) -- ���� �Լ�
    FROM EMP;

--  �μ���ȣ �� �հ�
SELECT DEPTNO, SUM(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    


--      ����, ����, ��¥, ����ȯ�Լ�, NVL 
--  1. ���� �Լ�
--      DUAL ���̺� : ����Ŭ���� �⺻������ ���� (1�� 1��)
--   1) ABS, FLOOR, TRUNC
SELECT *
    FROM DUAL;

SELECT ABS(-9)
    FROM DUAL;

SELECT  FLOOR(34.5678)
    FROM DUAL;

SELECT FLOOR(34.5678*100)/100
    FROM DUAL;
    
SELECT TRUNC(34.5678) -- �Ҽ��� ù° �ڸ����� ����, DEFAULT = 1
    FROM DUAL;

SELECT TRUNC(34.5678, 1) -- �Ҽ��� ��°�ڸ����� ����
    FROM DUAL;

SELECT TRUNC(34.5678, 2)
    FROM DUAL;

SELECT TRUNC(34.5678, -1)
    FROM DUAL;
    
--  EMP ���̺��� �̸�, �޿�(���� �ڸ����� ����) 
SELECT ENAME, SAL, TRUNC(SAL, -2)
    FROM EMP;
    
--  2) CEIL, ROUND
SELECT CEIL(34.5678) -- �Ҽ� ù°�ڸ����� �ø�
    FROM DUAL;
    
SELECT ROUND(34.5678) -- �Ҽ� ù°�ڸ����� �ݿø�
    FROM DUAL;
    
SELECT ROUND(34.5678, 2) -- �Ҽ� N+1�ڸ����� �ݿø�
    FROM DUAL;

SELECT ROUND(34.5678, -1) -- �����ڸ����� �ݿø�
    FROM DUAL;
    
--  3) MOD
SELECT MOD(9,2) -- ������ �������� ���
    FROM DUAL;
    
SELECT MOD('9',2)
    FROM DUAL;
    
--  Ȧ���⵵�� �Ի��� ����� ��� ����
SELECT *
    FROM EMP
    WHERE MOD(TO_CHAR(HIREDATE, 'RR'), 2) = 1;



--  2. ���� �Լ�
--   1) UPPER, LOWER, INITCAP
SELECT UPPER('acbcd')
    FROM DUAL;
    
SELECT LOWER('adsdfADFAD')
    FROM DUAL;
    
SELECT INITCAP('WELCOME') -- ù��° ���ڸ� �빮�ڷ�
    FROM DUAL;
    
--      JOB�� MANAGER�� ������ ��� �ʵ�
SELECT *
    FROM EMP
    WHERE UPPER(JOB) = 'MANAGER';
    
--      �̸��� SCOTT�� ������ ��� �ʵ�
SELECT *
    FROM EMP
    WHERE INITCAP(ENAME) = 'Scott';

--   2) CONCAT
--      CONCAT �ϳ��� �� ���ڿ����� ����
SELECT 'AB'||'CD'
    FROM DUAL;
    
SELECT CONCAT('AB','CD')
    FROM DUAL;

--      XXX�� XX��(SCOTT�� JOB�̴�)
SELECT ENAME||'��(��) '||JOB||'�̴�'
    FROM EMP;
    
SELECT CONCAT(CONCAT(ENAME, '��(��) '), CONCAT(JOB, '�̴�.'))
    FROM EMP;

--   3) SUBSTR(str, ������ġ, ������ ����), ù��° ��ġ�� 1, ������ġ�� ���� ����
--      SUBSTRB(str, ���۹���Ʈ��ġ, ���ڹ���Ʈ��)
SELECT SUBSTR('ORACLE', 3, 2)
    FROM DUAL;
    
SELECT SUBSTRB('ORACLE', 3, 2)
    FROM DUAL;
    
SELECT SUBSTR('�����ͺ��̽�', 4, 2)
    FROM DUAL;
--      �׹�° ���ں��� 2����Ʈ ����
--      ����� �ѱ��ڰ� 1����Ʈ, �ѱ��� 3����Ʈ
SELECT SUBSTRB('�����ͺ��̽�', 4, 6)
    FROM DUAL;    
    
SELECT SUBSTR('WECOME TO ORACLE', -6, 3)
    FROM DUAL;
    
SELECT SUBSTR(123, 2, 1)
    FROM DUAL;
    
--      9���� �Ի��� ����� ��� �ʵ� 81/09/01
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT *
    FROM EMP
    WHERE SUBSTR(HIREDATE, 4,2) = '09';

--      9�Ͽ� �Ի��� ����� ��� �ʵ�
SELECT *
    FROM EMP
    WHERE SUBSTR(HIREDATE, -2, 2) = '09';
    
--   4) LENGTH
SELECT LENGTH('ABCD')
    FROM DUAL;

SELECT LENGTHB('ABCD')
    FROM DUAL;

SELECT LENGTH('����Ŭ')
    FROM DUAL;

--      �� ���ڴ� 3����Ʈ
SELECT LENGTHB('����Ŭ')
    FROM DUAL;
    
--   5) INSTR(STR, ã�� ����), INSTR(STR, ã�� ����, ���� ��ġ)
--      STR���� ã�� ������ '��ġ = 5'�� ����
SELECT INSTR('ABCABC', 'B', 3)
    FROM DUAL;

--      ����° ������ġ���� �����ؼ� ó�������� B�� ��ġ
--      -3�̸� �ڿ��� ����° ���ں��� �����ؼ� ������ ã�ư�
SELECT INSTR('ABCABCABC', 'B', -3)
    FROM DUAL;
    
--      9���� �Ի��� ���(INSTR�� �̿�)
SELECT *
    FROM EMP
    WHERE INSTR(HIREDATE, '09', 4) = 4;
    
--      9�Ͽ� �Ի��� ���
SELECT *
    FROM EMP
    WHERE INSTR(HIREDATE, '09', 6) = 7;
    
--      9���� �ƴ� �ٸ� ���� �Ի��� ���
SELECT *
    FROM EMP
    WHERE INSTR(HIREDATE, '09', 6) = 0;
    
--   6) LPAD, RPAD
--      LPAD(STR, �ڸ�������, ä�﹮��) : STR�� �ڸ�����ŭ Ȯ���ϰ� ���� ���ڸ��� ä�﹮�� ���
SELECT LPAD('ORACLE', 10, '#')
    FROM DUAL;

SELECT ENAME, SAL
    FROM EMP;
    
SELECT ENAME, LPAD(SAL, 6, '*')
    FROM EMP;

--      EMP���̺��� ����� ���(S****, �̸��� �� �ѱ��ڸ� ���)
--      WARD�� W*** (RAPD, SUBSTR, LENGTH)
SELECT EMPNO, RPAD(SUBSTR(ENAME, 1, 1), 5, '*') ENAME
    FROM EMP;

--      7499    _****H  80/12/** �� ��� 
--      7521    __***D  81/01/**
SELECT EMPNO, LPAD(LPAD(SUBSTR(ENAME, -1, 1), LENGTH(ENAME), '*'), 10, ' ') ENAME,
    RPAD(SUBSTR(HIREDATE, 1, 6), LENGTH(HIREDATE), '*') HIREDATE
    FROM EMP;
    
--      �̸��� ����° �ڸ��� R�� ����� ��� �ʵ�(LIKE, INSTR, SUBSTR)
SELECT *
    FROM EMP
    WHERE ENAME LIKE '__R%';
    
SELECT *
    FROM EMP
    WHERE INSTR(ENAME, 'R', 3) = 3;

SELECT *
    FROM EMP
    WHERE SUBSTR(ENAME, 3, 1) = 'R';

--  7) TRIM
SELECT TRIM('       ORACLE DB           ') MSG
    FROM DUAL;

SELECT LTRIM('       ORACLE DB           ') MSG
    FROM DUAL;

SELECT RTRIM('       ORACLE DB           ') MSG
    FROM DUAL;
    
--   8) REPLACE
--      ��� A�� XX�� ġȯ
SELECT REPLACE(ENAME, 'A', 'XX')
    FROM EMP;

SELECT REPLACE(HIREDATE, '0', 'XX')
    FROM EMP;    

    
    
--  3. ��¥ ���� �Լ� �� �����
--   1) SYSDATE : ����
SELECT SYSDATE
    FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD DY HH24:MI';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD HH24:MI:SS')
    FROM DUAL;

--      ����Ŭ Ÿ�� : ����, ����, ��¥ (����, ��¥�� ���� ����)
SELECT SYSDATE-1, SYSDATE, SYSDATE+1
    FROM DUAL;
    
--      EMP ���̺��� �̸�, �Ի���, �ٹ��� ��¥�� ���
SELECT ENAME, HIREDATE, FLOOR((SYSDATE - HIREDATE)) "WORKINGDAY"
    FROM EMP
    ORDER BY WORKINGDAY DESC;
    
SELECT ENAME, HIREDATE, TRUNC((SYSDATE - HIREDATE)) "WORKINGDAY"
    FROM EMP
    ORDER BY WORKINGDAY DESC;
    
--      �̸�, �Ի���, �ٹ� �ּ�, �ٹ� ���
SELECT ENAME, HIREDATE, FLOOR((SYSDATE-HIREDATE) / 7) "WORKINGWEEKS",
    FLOOR((SYSDATE-HIREDATE) / 365) "WORKINGYEARS"
    FROM EMP;

--      �̸�, �Ի���, �ٹ� ����(MONTHS_BETWEEN() �Լ��� �̿�)
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "WORKINGMONTHS"
    FROM EMP;
    
--      �̸�, �Ի���, �����������(ADD_MONTHS() �Լ��� �̿�)
--      ADD_MONTHS(Ư������, �� ���� ��) : Ư���������� �� ���� ���� ��¥�� ��ȯ
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 3)
    FROM EMP;
    
--      �̸�, �Ի��� ���� ���� �޿� + ��(�޿��� �Ŵ� SAL�� �ް�, �󿩴� �ι� COMM�� ����)
SELECT ENAME, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) * SAL +
            TRUNC((SYSDATE - HIREDATE)/365) *2 * NVL(COMM,0) COST
    FROM EMP;
    
--   2) Ư����¥�κ��� ó�� ���� ������ NEXT_DAY(Ư����¥, '��')
SELECT NEXT_DAY(SYSDATE, '��')
    FROM DUAL;
    
--   3) Ư����¥�� ���� ���� LAST_DAY(Ư����¥)
SELECT LAST_DAY(SYSDATE)
    FROM DUAL;

--      EMP ���̺��� �̸�, �Ի��� ���޳�(IF ���޳� =  ����)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE)
    FROM EMP;

--   4) ��¥ �ݿø� ROUND, ��¥ ���� TRUNC
--      MONTH�� �ش������ ����� 1��(1~15�ϱ���), �Ѿ�� ������ 1��
--      YEAR�� ����� 1�� 1��
--      DAY�� ����� �Ͽ���
SELECT ROUND(SYSDATE, 'YEAR')
    FROM DUAL;

SELECT ROUND(SYSDATE, 'MONTH')
    FROM DUAL;
    
SELECT ROUND(SYSDATE, 'DAY')
    FROM DUAL;

SELECT ROUND(SYSDATE)
    FROM DUAL;
    
SELECT TRUNC(SYSDATE, 'YEAR')
    FROM DUAL;

SELECT TRUNC(SYSDATE, 'MONTH')
    FROM DUAL;
    
SELECT TRUNC(SYSDATE, 'DAY')
    FROM DUAL;

SELECT TRUNC(SYSDATE)
    FROM DUAL;
    
--      EMP ���̺��� �̸�, �Ի���, �Ի��� ���� 2�� �� ���
SELECT ENAME, HIREDATE, TRUNC(HIREDATE, 'MONTH')+1 "�Ի��� ���� 2��"
    FROM EMP;
    
--      EMP ���̺��� �̸�, �Ի���, ���޳�(5��)
--      15~16�� ������ 4~5�� �������� �ٲ�� ��
SELECT ENAME, HIREDATE, ROUND(HIREDATE+11, 'MONTH')+4 "���޳�(5�� ����)"
    FROM EMP;
    
--      EMP ���̺��� �̸�, �Ի���, ���޳�(15��)    
SELECT ENAME, HIREDATE, ROUND(HIREDATE+1, 'MONTH')+14 "���޳�(15�� ����)"
    FROM EMP;

--      EMP ���̺��� �̸�, �Ի���, ���޳�(25��)    
SELECT ENAME, HIREDATE, ROUND(HIREDATE-9, 'MONTH')+24 "���޳�(25�� ����)"
    FROM EMP; 
    
    
    
--  4. ����ȯ �Լ�
--   1) TO_CHAR() = ���ڷ� �� ��ȯ
--      YYYY �⵵ 4�ڸ� / YY �⵵ 2�ڸ� / RR �⵵ 2�ڸ�
--      MM �� / DD �� / DY ����
--      HH24 24�ð� / HH12 12�ð�/ AM / PM
SELECT TO_CHAR(SYSDATE, 'YYYY"��"/MM"��"/DD"��"/DY"����"/HH24:MI:SS')
    FROM DUAL;
    
SELECT ENAME, TO_CHAR(HIREDATE, 'YY/MM/DD DY HH12:MI:SS') TIME
    FROM EMP;
    
--   1-1) TO_CHAR(���ڵ�����, '�������') = ���ڵ����͸� ���ڷ� ��ȯ
--      0�� �ڸ����� ������ 0���� ä���, 9�� ���ڸ�ŭ�� ����ϰ� ��
--      ','�� ���ڸ����� ����, '.'�� �Ҽ���
--      L�� ������ȭ ����, $�� �տ� ���� �� ����
SELECT TO_CHAR(12345678, '999,999,999')
    FROM DUAL;

SELECT TO_CHAR(12345678, '000,000,000')
    FROM DUAL;

SELECT TO_CHAR(1234, 'L9,999')
    FROM DUAL;

SELECT ENAME, SAL, TO_CHAR(SAL, '$99,999')
    FROM EMP;

--   2) TO_DATE(����, '����') = ��¥�� �� ��ȯ
SELECT TO_DATE('19810101', 'YYYYMMDD')
    FROM DUAL;

--      81�� 5�� 1�Ϻ��� 83�� 5�� 1�� ���̿� �Ի��� ������ ��� �ʵ� ���
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';

SELECT *
    FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('810501', 'RRMMDD') AND
        TO_DATE(830501, 'RRMMDD');
    
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    
--   3) TO_NUMBER(����, ����)
SELECT TO_NUMBER('3,456.78', '9,999.999')
    FROM DUAL;

SELECT '3456.78'+1
    FROM DUAL;
    
SELECT '3,456.78'+1
    FROM DUAL;    
    
--   4) NVL(NULL�ϼ��� �ִ� ������, NULL�� ��� �� ��) : �Ű������� Ÿ���� ���ƾ� ��
--      �̸�, ����� ����� ��� (��, ���ӻ�簡 ���� ��� 'CEO'��� ǥ��)
SELECT ENAME, NVL(TO_CHAR(MGR), 'CEO') ����ǻ��
    FROM EMP;
    
--   5) ETC
--   5-1) EXTRACT : ������ ���� �����ϰ��� �� ��
SELECT EXTRACT(YEAR FROM SYSDATE)
    FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY')
    FROM DUAL;

SELECT EXTRACT(MONTH FROM SYSDATE)
    FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'MM')
    FROM DUAL;
    
--      81�⵵�� �Ի��� ���� ����
SELECT *
    FROM EMP
    WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;
    
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'YY') = '81';
 
 SELECT *
    FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('19810101', 'YYYY-MM-DD')
        AND TO_DATE('1981-12-31', 'YYYY-MM-DD');
        
--   5-2) LEVEL : START WITH ����, CONNECT BY PRIOR ����
SELECT LEVEL, LPAD(' ', LEVEL*2)||ENAME
    FROM EMP
    START WITH MGR IS NULL
    CONNECT BY PRIOR EMPNO = MGR;
    
    

-- <�� ��������>
-- 1. ���� ��¥�� ����ϰ� TITLE�� ��Current Date���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE "Current Date"
    FROM DUAL;

-- 2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� ����Ͽ�,
-- �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ����
SELECT ENAME, JOB, SAL, (SAL+SAL*0.15) "New Salary", (SAL*0.15) "Increase"
    FROM EMP;

--3. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 6), '������') MONTHS
    FROM EMP;

--4. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ������, �޿�, �Ի��Ϻ��� ��������� ���� �޿��� �Ѱ踦 ���
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "Months",
    SAL, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) * SAL "Sal Sal"
    FROM EMP;

--5. ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ���
SELECT ENAME, LPAD(SAL, 15, '*') SAL
    FROM EMP;

--6. ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DAY') WORKINGDAY
    FROM EMP;
    
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DY"����"') WORKINGDAY
    FROM EMP;

--7. �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ���
SELECT ENAME, LENGTH(ENAME) WORDS, JOB
    FROM EMP
    WHERE LENGTH(ENAME) >= 6;

--8. ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ���
SELECT ENAME, JOB, SAL, NVL(COMM, 0) BONUS, SAL+NVL(COMM, 0) SALSAL
    FROM EMP;

-- 9.��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT SUBSTR(ENAME, 2, 3)
    FROM EMP;

--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�. 
--  �ý��ۿ� ���� DATEFORMAT �ٸ� �� �����Ƿ� �Ʒ��� ����� �˾ƺ���
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'MM') = '12';

--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO		ENAME		�޿�
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--����. 
SELECT EMPNO, ENAME, LPAD(LPAD(SAL, LENGTH(SAL), ' '), 10, '*') SAL
    FROM EMP;

-- 12. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
-- EMPNO	 ENAME 	�Ի���
-- 7369	  SMITH		1980-12-17
-- ��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') HIREDATE
    FROM EMP;

--13. ��� ���̺��� �μ� ��ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�.
    --(�޿��� �տ� $�� �����ϰ�3�ڸ����� ,�� ����Ѵ�)  
SELECT E.EMPNO, ENAME, JOB, TO_CHAR(SAL, '$9,999') SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 20;