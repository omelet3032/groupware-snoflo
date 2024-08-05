USE snoflo;

SELECT *
FROM account;

-- 입력한 email과  password에 해당하는 employeeCode 확인
SELECT employee_code
FROM account 
WHERE email = 'omelet1@gmail.com' AND password = '1234'

--  login시 role이 관리자인지 확인
SELECT employee_code
FROM account
WHERE ROLE = '관리자'  AND email = 'omelet1@gmail.com';


SELECT role
FROM account 
WHE
RE email = 'omelet1@gmail.com' AND password = '1234'


SELECT e.code, e.name, d.name AS department_name, jp.name AS job_position_name, jt.name AS job_type_name, e.manager_code, e.status
                FROM employee e
                JOIN department d ON d.code = e.department_code
                JOIN job_position jp ON jp.code = e.job_position_code
                JOIN job_type jt ON jt.code = e.job_type_code
                WHERE e.name = :name
                ORDER BY e.code ASC;
              
               SELECT *
               FROM account;

              
      
            
             
              -- 트리거를 작성해보자
              

