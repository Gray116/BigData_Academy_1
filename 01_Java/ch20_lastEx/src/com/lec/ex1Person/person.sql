DROP TABLE PERSON;
DROP TABLE JOB;

--  �� ���̺� �� ������ ����
CREATE TABLE JOB (
    JNO NUMBER(2) PRIMARY KEY,
    JNAME VARCHAR2(30) NOT NULL
);

CREATE TABLE PERSON (
    NO NUMBER(8) PRIMARY KEY,
    JNO NUMBER(2) REFERENCES JOB (JNO) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    KOR NUMBER(3),
    ENG NUMBER(3),
    MAT NUMBER(3)
);

DROP SEQUENCE PERSON_NO_SEQ;
CREATE SEQUENCE PERSON_NO_SEQ
    MAXVALUE 99999999
    NOCYCLE
    NOCACHE;

--  �� 1�� ���� (�̸�, ������, ��, ��, ���� �����͸� �Է¹ޱ�)
INSERT INTO JOB
    VALUES (10, '���');
    
INSERT INTO JOB
    VALUES (20, '����');
    
INSERT INTO JOB
    VALUES (30, 'MC');

SELECT *
    FROM PERSON;

INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '���'),
                'ȫ�浿', 100, 100, 100);

INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '���'),
                '���켺', 90, 80, 81);

INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '���'),
                '�ڼ���', 80, 90, 80);

INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '����'),
                '�����', 20, 90, 90);
        
INSERT INTO PERSON
    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = '����'),
                '����', 95, 95, 95);
                
COMMIT;

--  �� 2�� ���� (�ش��������� ���, �̸�, ������, ��, ��, ��, ������ ū �� ����)
--  INLINE VIEW ��������
SELECT NAME || '('||NO||'��)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM
    FROM PERSON P, JOB J
    WHERE P.JNO = J.JNO AND JNAME = '���'
    ORDER BY SUM DESC;

--  ROWNUM ( JAVA���� �� ���� )
SELECT ROWNUM RANK, S.*
    FROM (SELECT NAME || '('||NO||'��)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM
                FROM PERSON P, JOB J
                WHERE P.JNO = J.JNO AND JNAME = '���'
                ORDER BY SUM DESC) S;
    
--  �� 3�� ���� (��ü �Էµ� ����� ���, �̸�, ������, ��, ��, ��, ����, ������ ū �� ����)
--  INLINE VIEW ��������
SELECT NAME || '('||NO||'��)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM
    FROM PERSON P, JOB J
    WHERE P.JNO = J.JNO
    ORDER BY SUM DESC;

--  ROWNUM ( JAVA���� �� ���� )
SELECT ROWNUM RANK, S.*
    FROM (SELECT NAME || '('||NO||'��)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM
                FROM PERSON P, JOB J
                WHERE P.JNO = J.JNO
                ORDER BY SUM DESC) S;

--  �� ������ ����Ʈ ��������
SELECT JNAME
    FROM JOB
    ORDER BY JNO;











