-- 관리자

-- 1. 사원정보
-- 사원의 개인정보와 입사정보를 한눈에 알 수 있도록 한다.
-- employee 사번 이름 이메일 연락처 생일 증명사진 
-- employ_status 부서 직급 고용형태 재직여부 입사일자
SELECT 
e.code, e.name, e.email, e.phone, e.birth_date, e.photo,
d.name, p.name, jt.name,
es.department_id, es.position_id, es.job_type_id, es.status, es.hire_date
FROM employees e 
INNER JOIN employee_status es ON e.id = es.employee_id
INNER JOIN departments d ON es.department_id = d.id
INNER JOIN positions p ON es.position_id = p.id
INNER JOIN job_types jt ON es.job_type_id = jt.id;


-- 1-1. 사원정보 list
-- 홈페이지에서 사원들으르 list 형식으로 조회할 수 있게끔 한다.
-- 모든 정보가 아닌 핵심 정보만 조회한다.
-- 사번 이름 부서 직급 고용형태 (default = 재직)

