--1. �޿��� 10000�̰ų�  14000�� ������� ���, �̸�(first_name), �޿��� �˻��Ͻÿ�.

SELECT employee_id, first_name, salary
FROM employees
WHERE salary = 10000 OR salary = 14000;
--WHERE salary IN(10000, 14000);

--2. first_name�� ��ҹ��ڱ�������('e', 'E')�� �����ϴ� ��� ����� �˻��Ͻÿ�

SELECT first_name
FROM employees
WHERE UPPER (first_name)LIKE '%E%';
--WHERE first_name LIKE '%e%' OR first_name LIKE '%E%';
--WHERE INSTR(UPPER(first_name), 'E') >0;

--3. first_name�� 'J���� �����ϰ� n���ڸ� �����ϴ� ����� ���, �̸��� �˻��Ͻÿ�. 

SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'J%' AND first_name LIKE '%n%';
-- WHERE first_name LIKE 'J%N%';

--4.����� ���, �̸�, �����ڹ�ȣ(manager_id),  �����ڿ��θ� ����Ͻÿ�.

SELECT employee_id, first_name, manager_id, 
       NVL2(manager_id, '����������', '�����ھ���')
--     DECODE(manager_id, null, 'X', 'O')"������ Ȯ��"
FROM employees
ORDER BY 3;

--5.�޿��� 10000�̻��� ����� ���, �μ���ȣ, �̸�, �޿�, ������ ����Ͻÿ�.��, �μ���ȣ�� 30���μ��̰ų� 90���� ����� �˻��Ѵ�.

SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE department_id IN(30, 90) AND salary >= 10000 ;

--6.�޿��� 10000�̻��� ����� ���, �μ���ȣ, �̸�, �޿�, ������ ����Ͻÿ�.��, �μ���ȣ�� 30��,60��, 90���� �μ��� �����ϰ� ����� �˻��Ѵ�.

SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE department_id NOT IN(30, 60, 90) AND salary >= 10000;


--7. �� ����� ����� �ٹ������ ����Ͻÿ�. ��, �ٹ������ �Ҽ��������ڸ��� ������ ��� �ټ��ں��� ����Ͻÿ�.

SELECT employee_id, TRUNC((SYSDATE - hire_Date)/365, 0)�ٹ����
--     TRUNC(MONTHS_BETEWWEN(SYSDATE, hire_Date)/12
FROM employees
ORDER BY 2 DESC;
