--트리거 (trigger)--
CREATE TABLE point(
    point_id VARCHAR2(5) primary key,
    point_score NUMBER(3),
    CONSTRAINT point_id_fk FOREIGN KEY(point_id) REFERENCES customer(id)
);
--고객이 추가된 후 포인트행 자동추가
CREATE OR REPLACE TRIGGER point_trig --trigger가 이벤트를 감지해서 begin절에
AFTER insert ON customer   --이벤트타임 BEFORE(DML처리되기 직전), AFTER (DML처리된 직후)
FOR EACH ROW --행 단위로(각각의 행 별)
BEGIN --trigger가 할 일
    INSERT INTO point(point_id, point_score) VALUES (:NEW.id, 1); --트리거에서만 쓰이는 문법 :NEW_지금 추가된/:OLD_
END;
/
DELETE FROM order_line;
DELETE FROM order_info;
DELETE FROM customer;

INSERT INTO customer(id, pwd, name, address, status) VALUES ('id1','p1','n1','a1',1);
SELECT * FROM customer;
SELECT * FROM point;

--주문 1행이 추가된 후 포인트 1행의 점수가 자동 1점씩 증가
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
--고객이 삭제되기 직전 포인트행도 자동삭제
CREATE OR REPLACE TRIGGER point2_trig 
BEFORE delete ON customer
FOR EACH ROW 
BEGIN
    DELETE point WHERE point_id = :OLD.id;
END;
/
DELETE FROM order_info;   --order_info에서 order_id에 fk걸려있어서(customer) 먼저 삭제를 해줘야 customer삭제 가능
DELETE FROM customer WHERE id='id1';
commit;  --트랜잭션 완료

SELECT * FROM point;
DELETE FROM customer;
/
--트리거 주의 : 트랜잭션
--트랜잭션 자동시작(tx-1)
INSERT INTO customer(id, pwd, name, address, status)
       VALUES ('id1','p1','n1','a1',1);
        --> 트리거point_trig(tx-1)
--트랜잭션 자동완료 안됨
INSERT INTO customer (id,pwd,name) VALUES('id1','a','a');
commit;