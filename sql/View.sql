--UPDATE ���� WHERE���� ���ٸ�, ��� ���� ������Ʈ �� 
--CAST (�ٲܰ� AS �������ڷ���)  �� ����ȯ�Լ� 
--RANK() ���� �ű�� �Լ� 
--CROSS JOIN  �� AISI ǥ�� ���ι� 

--�θ����̺��� �ຸ�� �ڽ����̺��� ���� �� ���� �����ؾ��� 
--DROP TABLE �θ� CASCADE CONSTRAIN; 
-- �������� ��� ��������� �����ض�

--�ܼ��� : ���̺�1���� �������̺� -DMLó������, DMLó���Ұ��ɰ�� ����
CREATE OR REPLACE VIEW ��1
AS SELECT a FROM a_tbl;

--���պ� : ���̺������� �������̺�-DMLó���Ұ��ɰ�� ����
CREATE OR REPLACE VIEW ��2
AS SELECT employee_id, department_name
FROM employees e JOIN departments d ON (e.department_id = d.department_id);

--DMLó���Ұ��� ��
CREATE OR REPLACE VIEW ��3
AS SELECT a FROM a_tbl
WITH READ ONLY;
--���Ǹ����ϴ� DMLó�������� ��
CREATE OR REPLACE VIEW ��3
AS SELECT a, b FROM b_tbl WHERE b=10;
--
SELECT * FROM ��1;
  SELECT * FROM ��2;
  INSERT INTO ��1(a) VALUES (999); --(o)
  INSERT INTO ��2(employee_id, department_name) VALUES (999, '�μ�1'); --(X)
  INSERT INTO ��3(a) VALUES (888); --(x)

  DELETE FROM b_tble;
  INSERT INTO b_tbl(a, b) VALUES (1, 10);
  INSERT INTO b_tbl(a, b) VALUES (2, 10);
  INSERT INTO b_tbl(a, b) VALUES (3, 90);
  SELECT * FROM ��3;
  --1 10
--WHERE ���Ǹ����ϴ� DMLó�������� ��
   CREATE OR REPLACE VIEW ��3
   AS SELECT a, b FROM b_tbl WHERE b=10
   WITH CHECK OPTION;
  
  DELETE FROM b_tbl;
  INSERT INTO b_tbl(a, b) VALUES (1, 10);
  INSERT INTO b_tbl(a, b) VALUES (2, 10);
  INSERT INTO b_tbl(a, b) VALUES (3, 90);
  SELECT * FROM ��3; 
  --1 10
  --2 10
  UPDATE ��3 SET b=70 WHERE b=10; --X
  INSERT INTO ��3(a,b) VALUES (4, 10);--0
  INSERT INTO ��3(a,b) VALUES (5, 20);--X
  
  SELECT * FROM ��3;