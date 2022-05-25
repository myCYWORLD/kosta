--FUNCTION
CREATE OR REPLACE FUNCTION a_func(num1 number, num2 number) --�Ű������� ������ ��ȣ �Ƚᵵ ��
RETURN number --���Ͻ� �ڷ����� �����ϰ� ���� �����ϴ� ���� �ƴϱ� ������ �����ݷ�X
IS            --�������� ����
    num3 number;
BEGIN
    num3 := num1 + num2;
    RETURN num3;
END;
/
SELECT a_func(1,2)
FROM dual;
/
CREATE OR REPLACE FUNCTION start_row( current_page number, cnt_per_page number) --���� �� ���� �����ϸ�
RETURN number
IS  
    current_num number;
BEGIN
    current_num := (current_page -1)*cnt_per_page + 1;
    RETURN current_num;
END;
/ 
SELECT start_row(1, 10) --1
      ,start_row(2, 10) --11
      ,start_row(2, 4)  --5
      ,start_row(3, 4)  --9   1 5 9  1 11 21
FROM dual;
/
CREATE OR REPLACE FUNCTION end_row(current_page number, cnt_per_page number)
RETURN number
IS      current_end_num number;
BEGIN
    current_end_num := (cnt_per_page) * (current_page);
    RETURN current_end_num;
END;
/
SELECT end_row(1, 10) --10
      ,end_row(2, 10) --20
      ,end_row(2, 4)  -- 8
      ,end_row(3, 4)  -- 12
FROM dual;
/
