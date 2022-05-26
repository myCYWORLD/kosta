--UPDATE 사용시 WHERE절이 없다면, 모든 행이 업데이트 됨 
--CAST (바꿀값 AS 데이터자료형)  → 형변환함수 
--RANK() 순위 매기는 함수 
--CROSS JOIN  → AISI 표준 조인법 

--부모테이블의 행보다 자식테이블의 행을 더 먼저 삭제해야함 
--DROP TABLE 부모 CASCADE CONSTRAIN; 
-- 제약조건 모두 끊어버리고 삭제해라

--단순뷰 : 테이블1개의 가상테이블 -DML처리가능, DML처리불가능경우 많음
CREATE OR REPLACE VIEW 뷰1
AS SELECT a FROM a_tbl;

--복합뷰 : 테이블여러개의 가상테이블-DML처리불가능경우 많음
CREATE OR REPLACE VIEW 뷰2
AS SELECT employee_id, department_name
FROM employees e JOIN departments d ON (e.department_id = d.department_id);

--DML처리불가한 뷰
CREATE OR REPLACE VIEW 뷰3
AS SELECT a FROM a_tbl
WITH READ ONLY;
--조건만족하는 DML처리가능한 뷰
CREATE OR REPLACE VIEW 뷰3
AS SELECT a, b FROM b_tbl WHERE b=10;
--
SELECT * FROM 뷰1;
  SELECT * FROM 뷰2;
  INSERT INTO 뷰1(a) VALUES (999); --(o)
  INSERT INTO 뷰2(employee_id, department_name) VALUES (999, '부서1'); --(X)
  INSERT INTO 뷰3(a) VALUES (888); --(x)

  DELETE FROM b_tble;
  INSERT INTO b_tbl(a, b) VALUES (1, 10);
  INSERT INTO b_tbl(a, b) VALUES (2, 10);
  INSERT INTO b_tbl(a, b) VALUES (3, 90);
  SELECT * FROM 뷰3;
  --1 10
--WHERE 조건만족하는 DML처리가능한 뷰
   CREATE OR REPLACE VIEW 뷰3
   AS SELECT a, b FROM b_tbl WHERE b=10
   WITH CHECK OPTION;
  
  DELETE FROM b_tbl;
  INSERT INTO b_tbl(a, b) VALUES (1, 10);
  INSERT INTO b_tbl(a, b) VALUES (2, 10);
  INSERT INTO b_tbl(a, b) VALUES (3, 90);
  SELECT * FROM 뷰3; 
  --1 10
  --2 10
  UPDATE 뷰3 SET b=70 WHERE b=10; --X
  INSERT INTO 뷰3(a,b) VALUES (4, 10);--0
  INSERT INTO 뷰3(a,b) VALUES (5, 20);--X
  
  SELECT * FROM 뷰3;