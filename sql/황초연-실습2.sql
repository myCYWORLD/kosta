--1. �޿��� 4000���� ���� ������� �μ��� �޿���ո� ����Ͻÿ�. �� �޿������ �Ҽ�������2�ڸ����� �ݿø��մϴ�.

SELECT department_id, ROUND(AVG(salary), 1)�޿����
FROM employees
WHERE salary > 4000    -- where������ �ɷ������Ұ� ���� ���͸��ϰ� �׷����ϴ°� ó���ӵ� �� ����
GROUP BY department_id
ORDER BY AVG(salary);  -- "�μ���"�̾ GROUP BY ����ؼ� �׷���

--2. �μ����� �μ���ȣ, ��ձ޿�, �ִ�޿�, �ּұ޿��� ����Ͻÿ�
--�� �μ����� ����� 30���μ����, 50���μ������ �����Ѵ�

SELECT department_id, AVG(salary), MAX(salary), MIN(salary)
FROM employees
WHERE department_id NOT IN (30,50) AND department_id IS NOT NULL  
GROUP BY department_id;
-- department_id <> null AND department_id <> 30 OR department_id <>50
-- NOT IN �����ڴ� <> �� ���Ƽ� NOT IN�� null�� �Բ� ����ϸ� ó�� ����� �� �൵ ������ ����
--null�� ��쿡 0���� �ٲ㼭 ����ϸ� NOT IN�� ��� ���� -> WHERE NVL(department_id,0) NOT IN (0,30,50)

--3. ������ ����  20���μ� �ѱ޿�, 50���μ� �ѱ޿�, 80���μ� �ѱ޿�, 90���μ� �ѱ޿�, ����� �ѱ޿���  ��Ÿ������ �׷��Լ��� DECODE�Լ��� ����Ͻÿ�.

SELECT SUM(DECODE(department_id, 20, salary)) "20���μ� �ѱ޿�", 
       SUM(DECODE(department_id, 50, salary)) "50���μ� �ѱ޿�",
	   SUM(DECODE(department_id, 80, salary)) "80���μ� �ѱ޿�",
	   SUM(DECODE(department_id, 90, salary)) "90���μ� �ѱ޿�",
       SUM(salary) "������ѱ޿�"
FROM employees;

--SUM�� �����Լ��̰� DECODE�� �Ϲ��Լ� (�Ϲ��Լ��� ������ ������� ������)
--SELECT SUM(DECODE(department_id, 20, salary),
--          (DECODE(department_id, 50, salary)
--FROM employees; --107
--SELECT salary
--FROM employees
--WHERE department_id IN(20,50) --20�� �μ� �� �� + 50�� �μ� �� ���� ����� ������


--4.������ ������ȣ(location_id), �μ����� ����Ͻÿ�. �μ����� 10�� �̻��� ������ ����Ѵ�

SELECT location_id, COUNT(department_id)
FROM departments
GROUP BY location_id
HAVING COUNT(department_id) >= 10;

--5.�⵵�� �Ի��ڼ��� ����Ͻÿ�, �� �ֱٳ⵵���� ����Ѵ�

SELECT TO_CHAR(hire_Date, 'YYYY')�Ի�⵵, COUNT(*)�Ի��ڼ�
FROM employees
GROUP BY TO_CHAR(hire_Date, 'YYYY')
ORDER BY 1 DESC;

--6. �Ϲݱ�(7~12��) ���� �Ի��ڼ��� ����Ͻÿ�.�Ի��ڼ��� 5���̻��� ��츸 ����Ѵ�

SELECT  TO_NUMBER(TO_CHAR(hire_Date, 'MM'))||'��', COUNT(*)||'��'
FROM employees
WHERE TO_NUMBER(TO_CHAR(hire_Date, 'MM'))>=7   
--TO CHAR�θ� �������� �� �������� ��ȯ�ϸ� 7=>07�� �ǰ� ���ڿ��� '07'�� ���ϴ� ���� ��
-- 7���� ó������ '07'�� �ᵵ ������
GROUP BY TO_CHAR(hire_Date, 'MM')
--����Ŭ���� �����ϴ� �Լ� EXTRACT ����� ���� ���� ex) EXTRACT(year FROM hire_date)
HAVING COUNT (*) >=5
ORDER BY TO_NUMBER(TO_CHAR(hire_Date, 'MM'));





