--1. �޿��� 4000 ���� ���� ������� �μ��� �޿���ո� ����Ͻÿ�. �� �޿������
--�Ҽ������� 2 �ڸ����� �ݿø��մϴ�.

SELECT d.department_id, ROUND(AVG(salary),1)
FROM departments d JOIN employees e ON (d.department_id = e.department_id)
WHERE salary > 4000
GROUP BY d.department_id;

--SELECT department_id, ROUND(AVG(salary),1)
--FROM employees
--WHERE salary > 4000
--GROUP BY department_id;

--2. �μ���ġ�� ���� ���� ����� �����ϰ� �μ��� �޿������ ����Ͻÿ�.�� �޿������
--�Ҽ������� 2 �ڸ����� �ݿø��մϴ�.

SELECT d.department_id, ROUND(AVG(salary), 1)
FROM departments d JOIN employees e ON (d.department_id = e.department_id)
GROUP BY d.department_id;

--SELECT department_id, ROUND(AVG(salary),1)
--FROM demployees
--WHERE department_id IS NOT NULL
--GROUP BY department_id;

--3. �μ���ġ�� ���� ���� ����� �����ϰ� �޿������ 10000 �̻��� �μ��� �޿������
--����Ͻÿ�.�� �޿������ �Ҽ������� 2 �ڸ����� �ݿø��մϴ�.

SELECT d.department_id �μ�, ROUND(AVG(salary),1)�޿����
FROM departments d JOIN employees e ON (d.department_id = e.department_id)
WHERE salary > 10000
GROUP BY d.department_id;

SELECT department_id, ROUND(AVG(salary),1)
FROM emplyoees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING AVG(salary)>=10000;

--4. ��å(job_title)�� 'President'�� ����� ���, �̸��� ����Ͻÿ�: (NaturalJOIN ���� ǥ��)

SELECT employee_id, first_name, job_title
FROM employees NATURAL JOIN jobs 
WHERE job_title = 'President'; 

--5. ��å(job_title)�� 'President'�� �ƴ� ����� ���, �̸��� ����Ͻÿ�(JOIN USING ���� ǥ��)
SELECT employee_id, first_name
FROM employees JOIN jobs USING(job_id)
WHERE job_title <> 'President'
ORDER BY 1;

--6. ��å(job_title)�� 'President'�� �ƴ� ����� ���, �̸��� ����Ͻÿ� (SubQuery ���)

SELECT employee_id ���, first_name �̸�
FROM employees
WHERE job_id NOT IN(SELECT job_id FROM jobs WHERE job_title = 'President')
ORDER BY 1;

--7. �μ���ȣ, �μ���, �μ��� �޿��Ѿװ� ��ձ޿��� ����Ͻÿ�.
--�μ����� ����� ��� ����Ͻÿ�.
--��, �޿��Ѿ��� ���� ������ �����ϰ�,
--��ձ޿��� �Ҽ��� ���� 1 �ڸ����� ��Ÿ������ �ݿø��ؾ� �Ѵ� (JOIN ���)

SELECT e.department_id �μ���ȣ, d.department_name �μ���, SUM(salary) �޿��Ѿ�, ROUND(AVG(salary), 1)��ձ޿�
FROM departments d Right OUTER JOIN employees e ON(d.department_id = e.department_id)
GROUP BY e.department_id,d.department_name
ORDER BY 3;

--8. �μ���ȣ, �μ���, �μ��� �޿��Ѿװ� ��ձ޿��� ����Ͻÿ�. (Scalar Query ���)
--��, �޿��Ѿ��� ���� ������ �����ϰ�,
--��ձ޿��� �Ҽ��� ���� 1 �ڸ����� ��Ÿ������ �ݿø��ؾ� �Ѵ�.

SELECT department_id �μ���ȣ, SUM(salary) �޿��Ѿ�, ROUND(AVG(salary), 1) ��ձ޿�, 
      (SELECT department_name
       FROM departments d
       WHERE d.department_id = e.department_id) �μ���
FROM employees e
GROUP BY department_id
ORDER BY 2;

--9. 'Seattle'�� 'Toronto'���ÿ� �ٹ��ϴ�
--������� ���, �̸�, �μ�ID, �μ����� ����Ͻÿ�

SELECT e.employee_id ���, e.first_name �̸�, e.department_id �μ�ID, d.department_name �μ���
FROM employees e, departments d
WHERE e.department_id IN(SELECT d.department_id FROM departments WHERE d.location_id 
                      IN(SELECT location_id FROM locations WHERE city = 'Seattle' or city = 'Toronto'));
                       
SELECT employee_id ���, first_name �̸�, e.department_id �μ�ID, department_name �μ���
FROM employees e JOIN departments d ON(e.department_id = d.department_id)
                 JOIN locations l ON(d.location_id = l.location_id) 
WHERE city IN('Seattle', 'Toronto');

--10.���� 'Davies'�� ����� ���� �μ��� �ٹ��ϴ� ������� ���, ��, �̸��� ����Ͻÿ�(SUBQUERY)

SELECT employee_id ���, last_name ��, first_name �̸�
FROM employees
WHERE department_id IN(SELECT department_id FROM employees 
                    WHERE last_name = 'Davies');
--AND last_name <> 'Davies'; 
-- and���� �־�� davies�� ���Ե��� �ʰ� ��µ�   
                    
--11.���� 'Davies'�� ����� ���� �μ��� �ٹ��ϸ鼭 �μ���ձ޿�����
--���� �޿��� �޴»���� ���, ��, �̸�, �޿��� ����Ͻÿ�(SUBQUERY)   --13

SELECT employee_id ���, last_name ��, first_name �̸�, salary �޿� 
FROM employees
WHERE department_id =(SELECT department_id FROM employees WHERE last_name = 'Davies')
                     AND salary > ANY(SELECT AVG(salary) FROM employees GROUP BY department_id)
ORDER BY salary;
