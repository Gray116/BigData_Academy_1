--  �� ���̺�, ������ ���� ���� Ȯ��
DROP TABLE CUSTOMER;
DROP SEQUENCE CUSTOMER_ID_SEQ;

--  �� ���̺� �� ������ ����
CREATE TABLE CUSTOMER (
    CNO NUMBER(8) PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    TEL VARCHAR2(30),
    POINT NUMBER(8) DEFAULT 1000
);

CREATE SEQUENCE CUSTOMER_ID_SEQ
    MAXVALUE 99999999
    NOCACHE
    NOCYCLE;

--  �� ���̺� ������ ���� �⺻ ������ �Է�
SELECT *
    FROM CUSTOMER;
    
INSERT INTO CUSTOMER
    VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'ȫ�浿', '010-1234-5678', 1200);
    
INSERT INTO CUSTOMER
    VALUES (CUSTOMER_ID_SEQ.NEXTVAL, '��ö��', '010-4555-8978', 2200);
    
INSERT INTO CUSTOMER
    VALUES (CUSTOMER_ID_SEQ.NEXTVAL, '�迵��', '010-7777-5178', 1900);
    
--  �� ��ȭ��ȣ ��ȸ ( �� 4�ڸ��� ��ȭ��ȣ ��ü ��ȸ )
SELECT *
    FROM CUSTOMER WHERE TEL LIKE '%' || '5178';

--  �� ����Ʈ�� ���� ������ ���
SELECT *
    FROM CUSTOMER
    ORDER BY POINT DESC;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
