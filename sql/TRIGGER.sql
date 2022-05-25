--Ʈ���� (trigger)--
CREATE TABLE point(
    point_id VARCHAR2(5) primary key,
    point_score NUMBER(3),
    CONSTRAINT point_id_fk FOREIGN KEY(point_id) REFERENCES customer(id)
);
--���� �߰��� �� ����Ʈ�� �ڵ��߰�
CREATE OR REPLACE TRIGGER point_trig --trigger�� �̺�Ʈ�� �����ؼ� begin����
AFTER insert ON customer   --�̺�ƮŸ�� BEFORE(DMLó���Ǳ� ����), AFTER (DMLó���� ����)
FOR EACH ROW --�� ������(������ �� ��)
BEGIN --trigger�� �� ��
    INSERT INTO point(point_id, point_score) VALUES (:NEW.id, 1); --Ʈ���ſ����� ���̴� ���� :NEW_���� �߰���/:OLD_
END;
/
DELETE FROM order_line;
DELETE FROM order_info;
DELETE FROM customer;

INSERT INTO customer(id, pwd, name, address, status) VALUES ('id1','p1','n1','a1',1);
SELECT * FROM customer;
SELECT * FROM point;

--�ֹ� 1���� �߰��� �� ����Ʈ 1���� ������ �ڵ� 1���� ����
CREATE OR REPLACE TRIGGER point1_trig 
AFTER insert ON order_info
FOR EACH ROW 
BEGIN
    UPDATE point SET point_score=point_score+1 WHERE point_id = :NEW.order_id;
END;
/
INSERT INTO order_info(order_no, order_id, order_dt)
       VALUES (order_seq.NEXTVAL, 'id1',    SYSDATE);
SELECT * FROM order_info;
SELECT * FROM point;
/
--���� �����Ǳ� ���� ����Ʈ�൵ �ڵ�����
CREATE OR REPLACE TRIGGER point2_trig 
BEFORE delete ON customer
FOR EACH ROW 
BEGIN
    DELETE point WHERE point_id = :OLD.id;
END;
/
DELETE FROM order_info;   --order_info���� order_id�� fk�ɷ��־(customer) ���� ������ ����� customer���� ����
DELETE FROM customer WHERE id='id1';
commit;  --Ʈ����� �Ϸ�

SELECT * FROM point;
DELETE FROM customer;
/
--Ʈ���� ���� : Ʈ�����
--Ʈ����� �ڵ�����(tx-1)
INSERT INTO customer(id, pwd, name, address, status)
       VALUES ('id1','p1','n1','a1',1);
        --> Ʈ����point_trig(tx-1)
--Ʈ����� �ڵ��Ϸ� �ȵ�
INSERT INTO customer (id,pwd,name) VALUES('id1','a','a');
commit;