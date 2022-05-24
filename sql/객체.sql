--�� : �������̺�
--������ sql ������ ��� ����
/*
SELECT d.department_id, d.department_name, j.job_id,j.job_title, count(employee_id)
FROM employees e JOIN departments d ON (e.department_id=d.department_id)
                 JOIN jobs j ON (e.job_id=j.job_id)
WHERE salary >= 3000
GROUP BY d.department_id, d.department_name, j.job_id, j.job_title
HAVING count(employee_id)>=2
ORDER BY count(employee_id);
*/
CREATE VIEW a_view
AS
SELECT d.department_id, d.department_name, j.job_id,j.job_title,
       count(employee_id)employee_cnt --���� �Լ� ��Ī ������� ������ ���� ����
FROM employees e JOIN departments d ON (e.department_id=d.department_id)
                 JOIN jobs j ON (e.job_id=j.job_id)
WHERE salary >= 3000
GROUP BY d.department_id, d.department_name, j.job_id, j.job_title
HAVING count(employee_id)>=2
ORDER BY count(employee_id);
--
SELECT * FROM a_view;  --view �� �� ����

--������ sql������ ���������� ������ ���ɼ��� ������ view�� �����س��°��� ����
--���� department_id �� ��Ī�� did�� �������� ��� �˻��� ������ ��Ī���� �˻��������
--view�� ������ �����ִ� ���̹Ƿ� ������ ����(�ڷ��� ����,�߰�����)�̳� ���� ���� �� �� ������ ����,,�ϱ⵵ ������
--view�� alter�� ���̺� �������� �ȵ� 
--------view ���� or ���� ����--------------
CREATE OR REPLACE VIEW a_view  --������ ���� ����� ������ �����϶� (view ������� CREATE�� �������� ó������ create OR REPLACE VIEW�� ����)
AS
SELECT employee_id, first_name
FROM employees;

SELECT * FROM a_view;
---------view ����-------------------
DROP VIEW a_view; --view�� ���� ��ü�� ���� ������ alter�� ����

-------������-----------
--������ : �Ϸù�ȣ��
CREATE SEQUENCE a_seq; --������ ���� ���� ��쿡�� �⺻�� 1���� 1�� ����
CREATE SEQUENCE b_seq --4���� 2�� ����, �ִ밪30 ,�ּҰ�3(�ִ밪�� �����ϸ� �ּҰ����� ���ư��ų� ���������� ������ �� ����)
START WITH 4 --���۰� (���۰��� �ּҰ����� ũ�� �����ؾ��Ѵ�)
INCREMENT BY 2 --������ ����
MAXVALUE 50 --�ִ밪
CYCLE  --�ּҰ����� ���ư��� �ϴ� ����
MINVALUE 3; --�ּҰ��� 10���� 10���� ����
DROP SEQUENCE b_seq;  --drop sequence ������ ����
--������ �Ϸù�ȣ �� ���
SELECT b_seq.NEXTVAL FROM dual; --����ؼ� �����ϸ� ����� (�� ����)
SELECT b_seq.NEXTVAL FROM dual; --6
--:
SELECT b_seq.NEXTVAL FROM dual; --50
SELECT b_seq.NEXTVAL FROM dual; --3
SELECT b_seq.NEXTVAL FROM dual; --5

SELECT b_seq.CURRVAL FROM dual; -- ������ ���簪 Ȯ�� ����
 --�ֹ��� ��������ü--------------------
CREATE SEQUENCE order_seq;
INSERT INTO order_info(order_no,    order_id, order_dt)
            VALUES (order_seq.NEXTVAL, 'id1', SYSDATE);  SELECT b_seq.CURRVAL FROM dual;

INSERT INTO order_line(order_no,          order_prod_no, order_quantity)
                 VALUES (order_seq.CURRVAL, 'C0002',        7); 
                 
INSERT INTO order_line(order_no,          order_prod_no, order_quantity)
                 VALUES (order_seq.CURRVAL, 'C0001',        7); 
SELECT * FROM 
--���� �������� �� �� �� ����

