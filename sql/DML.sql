--DML (������ ����)
--������ �߰� (ISNERT INTO), ����(UPDATE), ����(DELETE)
-------------------------------------------------------
--�������߰�
INSERT INTO customer(id, pwd, name, address, status) VALUES ('id1','p1','n1','a1',1);
INSERT INTO customer                                 VALUES ('id2','p2','n2','a2',1); --�÷��� ���� ���ϸ� �÷� �ڷ������ ������� �ۼ��ؾ���
INSERT INTO customer(id, pwd, name)                  VALUES ('id3','p3','n3'); --address/status �⺻���� null => �������ҽÿ� �ڵ� null��
SELECT * FROM customer;  

INSERt INTO product(prod_no, prod_name, prod_price) VALUES ('C0001','�Ƹ޸�ī��',1000); 
INSERt INTO product                                 VALUES ('C0002','���̽��Ƹ޸�ī��',1000, null, '');
INSERt INTO product(prod_no, prod_name, prod_price,prod_mfd) 
            VALUES ('G0001',  '�Һ�',    3000,   '22/01/01'); --��¥Ÿ�� �ڵ� ����ȯ 
INSERt INTO product(prod_no, prod_name, prod_price,prod_mfd) 
            VALUES ('G0002',  '���̾',   4000,    SYSDATE);  --sysdate ���� ��¥�� �Է�
SELECT * FROM product;  

--�����ͺ���
--primary���� ������Ʈ X 
----------------------------------------
UPDATE customer SET name = 'Ȳ�ʿ�' WHERE id='id1';  --UPDATE������ ���̺�� SET������ ������ �÷���(=���氪) WHERE������ ����
UPDATE customer SET pwd = 'p22', name='�ѹ̷�' WHERE id='id2';
UPDATE customer SET status = 1; --WHERE ���� ������ ��� ���� �ݿ��Ǳ� ������ ����
SELECT * FROM customer;
------------------------------------------
UPDATE product SET prod_price = prod_price + (prod_price*0.1);--��� ��ǰ�� ������ 10%�λ�
SELECT * FROM product;
----------------------------------------------
DELETE FROM customer; -- delete�� ���̺� ������ �����ְ� �ڷḸ ���� /drop�� ���̺� ��ü�� ����
INSERT INTO customer(id, pwd, name, address, status) VALUES ('id1','p1','n1','a1',1);
INSERT INTO customer                                 VALUES ('id2','p2','n2','a2',1); 
INSERT INTO customer(id, pwd, name)                  VALUES ('id3','p3','n3');
SELECT * FROM customer;
----------------------------------------------
--WHERE������ �� ��� subquery Ȱ���� �� ����(DELETE FROM customer WHERE 'id='id1';)
--DDL = ��ü ���� ���� ����
