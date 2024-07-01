-- 관리자
USE snoflo;
-- 1. 사원정보
-- 사원의 개인정보와 입사정보를 한눈에 알 수 있도록 한다.
SELECT 
e.name, es.code, a.email, e.photo,
d.name department, p.name position, jt.name job_type,
es.status, es.hire_date, es.end_date
FROM employees e 
INNER JOIN employee_status es ON e.id = es.employee_id
INNER JOIN departments d ON es.department_id = d.id
INNER JOIN positions p ON es.position_id = p.id 
INNER JOIN job_types jt ON es.job_type_id = jt.id
INNER JOIN accounts a ON e.id = a.employee_id;


-- 2. 신입사원 입사시
-- employee 데이터 입력
-- employee_status 데이터 입력
-- accounts 입력