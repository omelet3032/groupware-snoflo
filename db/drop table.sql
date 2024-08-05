USE snoflo;

-- 출퇴근기록 테이블 삭제
DROP TABLE IF EXISTS attendance_record;

-- 휴가 관련 테이블 삭제
DROP TABLE IF EXISTS vacation_usage_history;
DROP TABLE IF EXISTS vacation_grant_history;
DROP TABLE IF EXISTS remaining_vacation_days;
DROP TABLE IF EXISTS vacation_types;

-- 휴직 관련 테이블 삭제
DROP TABLE IF EXISTS leave_of_absence_usage_history;
DROP TABLE IF EXISTS leave_of_absence_grant_history;
DROP TABLE IF EXISTS leave_of_absence_types;

-- 이력 관련 테이블 삭제
DROP TABLE IF EXISTS job_type_history;
DROP TABLE IF EXISTS position_history;
DROP TABLE IF EXISTS department_history;
DROP TABLE IF EXISTS employment_history;

-- 부서별 관리자 정보 테이블 삭제
DROP TABLE IF EXISTS department_managers;

-- 계정정보 테이블 삭제
DROP TABLE IF EXISTS accounts;

-- 개인정보 테이블 삭제
DROP TABLE IF EXISTS personal_information;

-- 사원정보 테이블 삭제
DROP TABLE IF EXISTS employees;

-- 기본 정보 테이블 삭제
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS job_types;