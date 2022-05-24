--���տ�����
--������������
SELECT *
FROM job_history
ORDER BY employee_id, start_date;
--102 01/01/13/ 06/07/24 IT_PROG 60

--������������
SELECT employee_id, job_id
FROM employees
ORDER BY employee_id;
-- 102 AD_VP

--����� ���� ������ ���� ������ ��� ����Ͻÿ� --115�� ���

--ù��° �÷� ���̺� �ڷ����� �ι�° �÷� �ڷ����� ���ƾ���
SELECT employee_id, job_id
FROM job_history
UNION
SELECT employee_id, job_id
FROM employees;

--����� ���������� ���������� ��� ����Ͻÿ� --117�� ���
SELECT employee_id, job_id
FROM job_history
UNION ALL
SELECT employee_id, job_id
FROM employees;

--ù��° SELECT�� �ι�° SELECT�� �÷� ���� ���ƾ���
SELECT employee_id, job_id, start_date, end_date
FROM job_history
UNION ALL
SELECT employee_id, job_id, null, null
FROM employees
ORDER BY ���, start_date;
--ORDER BY ���� �÷��� ����
SELECT employee_id ���, job_id, start_date, end_date
FROM job_history
UNION ALL
SELECT employee_id, job_id, null, null
FROM employees
ORDER BY ���, start_date;
--ù��° �ι�° �÷� �ڷ��� �����ϰ�
SELECT employee_id ���, job_id, TO_CHAR(start_date), end_date
FROM job_history
UNION ALL
SELECT employee_id, job_id, '��������', null
FROM employees
ORDER BY ���, 3;

--���� ������ ���������� ����ϴ� ������� ����Ͻÿ�
--������
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

--�Ի� �� ������ ������� ���� ������� ����Ͻÿ�
--������
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;
--����� ���� �μ���ȣ�� ����Ͻÿ�
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;
--subquery
SELECT * 
FROM departments
WHERE NOT EXISTS
(SELECT * FROM employees
 WHERE department_id = departments.department_id);

