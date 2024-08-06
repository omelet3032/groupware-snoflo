USE snoflo;

-- 직급정보
INSERT INTO job_position (id, code, name)
VALUES
(1, 201, 'CEO'),
(2, 202, '팀장'),
(3, 203, '매니저');

-- 계약형태정보
INSERT INTO job_type (id, code, name)
VALUES
(1, 301, '정규직'),
(2, 302, '계약직'),
(3, 303, '인턴');

-- 부서정보
INSERT INTO department (id, code, name)
VALUES
(1, 101, 'HR'),
(2, 102, '개발팀'),
(3, 103, '재무팀');

-- 사원정보
INSERT INTO employee (id, code, name, department_code, job_position_code, job_type_code, manager_code, status)
VALUES
(1, 1001, '김경민', 101, 201, 301, 0, '재직'),
(2, 1002, '박영훈', 102, 202, 301, 0, '재직'),
(3, 1003, '이민영', 103, 203, 301, 0, '퇴사'),
(4, 1004, '정수진', 101, 203, 301, 0, '재직'),
(5, 1005, '송미라', 102, 203, 301, 1002, '재직'),
(6, 1006, '홍길동', 103, 203, 301, 0, '재직'),
(7, 1007, '김철수', 101, 203, 301, 0, '퇴사'),
(8, 1008, '이영희', 102, 203, 301, 1002, '재직'),
(9, 1009, '박지성', 103, 203, 301, 0, '재직'),
(10, 1010, '최민수', 101, 203, 301, 0, '재직'),
(11, 1011, '강다혜', 102, 203, 301, 1002, '퇴사'),
(12, 1012, '임성준', 103, 203, 301, 0, '재직'),
(13, 1013, '윤지원', 101, 203, 301, 0, '재직');

-- 개인정보
INSERT INTO personal_information (employee_code, phone, birth_date, photo)
VALUES
(1001, '010-1111-1111', '1985-06-15', NULL),
(1002, '010-2222-2222', '1990-07-25', NULL),
(1003, '010-3333-3333', '1993-03-12', NULL),
(1004, '010-4444-4444', '1988-11-03', NULL),
(1005, '010-5555-5555', '1992-09-21', NULL),
(1006, '010-6666-6666', '1987-04-30', NULL),
(1007, '010-7777-7777', '1995-12-18', NULL),
(1008, '010-8888-8888', '1991-02-14', NULL),
(1009, '010-9999-9999', '1989-08-07', NULL),
(1010, '010-1010-1010', '1993-05-25', NULL),
(1011, '010-1212-1212', '1986-10-11', NULL),
(1012, '010-1313-1313', '1994-07-09', NULL),
(1013, '010-1414-1414', '1990-01-23', NULL);

-- 계정정보
INSERT INTO account (employee_code, email, password, role)
VALUES
(1001, 'omelet1@gmail.com', '1234', '관리자'),
(1002, 'omelet2@gmail.com', '1235', '사원'),
(1003, 'omelet3@gmail.com', '1236', '승인권자');

INSERT INTO employment_history (employee_code, hire_date, hire_summary)
VALUES
(1001, '2024-08-05', '경력');
-- 부서이력
INSERT INTO department_history (employee_code, start_date, end_date, department_code, summary)
VALUES
(1001, '2020-01-01', '2021-06-30', 101,'부서이동'),
(1002, '2021-07-01', NULL, 102, '조직개편'),
(1003, '2019-03-15', '2020-08-30', 103, '부서이동'),
(1004, '2022-01-01', NULL, 101, '조직개편'),
(1005, '2021-09-01', '2022-12-31', 102, '부서이동');

-- 직급이력
INSERT INTO job_position_history (employee_code, start_date, end_date, job_position_code, summary)
VALUES
(1001, '2020-01-01', NULL, 201, '진급'),
(1002, '2021-07-01', NULL, 202, '진급'),
(1003, '2019-03-15', '2020-08-30', 203, '정규직 전환'),
(1004, '2022-01-01', NULL, 203, '정규직 전환'),
(1005, '2021-09-01', NULL, 202, '진급');

-- 계약형태이력
INSERT INTO job_type_history (employee_code, start_date, end_date, job_type_code, summary)
VALUES
(1001, '2019-01-01', '2019-12-31', 302, '계약연장'),
(1002, '2020-01-01', NULL, 301, '정규직 전환'),
(1003, '2018-03-15', '2019-03-14', 303, '계약연장'),
(1004, '2021-01-01', NULL, 301, '정규직 전환'),
(1005, '2020-09-01', '2021-08-31', 302, '계약연장');

-- 출퇴근기록
INSERT INTO attendance_record (employee_code, clock_in, clock_out, work_hours)
VALUES
(1001, '2024-06-01 08:00:00', null, null),
(1002, null, '2024-03-01 18:00:00', null),
(1003, '2024-06-01 08:30:00', '2024-03-01 17:30:00', '09:00:00');

-- 휴가정보
INSERT INTO vacation_type (id, code, name)
VALUES
(1, 401, '연차'),
(2, 402, '생일반차'),
(3, 403, '무급휴가');

-- 휴직정보
INSERT INTO leave_of_absence_type (id, code, name)
VALUES
(1, 501, '육아휴직'),
(2, 502, '질병휴직'),
(3, 503, '기타휴직');

-- 잔여휴가일수
INSERT INTO remaining_vacation_day (employee_code, vacation_code, year, remaining_days)
VALUES
(1001, 401, 2023, 15),
(1001, 402, 2023, 10),
(1001, 401, 2022, 3),
(1002, 402, 2022, 10),
(1003, 403, 2023, 5);

-- 휴가부여내역
INSERT INTO vacation_grant_history (employee_code, vacation_code, date, grant_days, summary)
VALUES
(1001, 401, '2023-01-01', 10, '연차휴가 지급'),
(1002, 402, '2023-01-15', 1, '생일휴가 지급');

-- 휴가사용내역
INSERT INTO vacation_usage_history (employee_code, vacation_code, start_date, end_date, usage_days, summary)
VALUES
(1001, 401, '2023-03-10', '2023-03-14', 5, '연차휴가 사용'),
(1002, 402, '2023-04-01', '2023-04-03', 1, '생일휴가 사용');

-- 휴직부여내역
INSERT INTO leave_of_absence_grant_history (employee_code, absence_code, date, grant_days, summary)
VALUES
(1001, 501, '2023-04-01', 30, '육아휴직 지급');

-- 휴직사용내역
INSERT INTO leave_of_absence_usage_history (employee_code, absence_code, start_date, end_date, usage_days, summary)
VALUES
(1001, 501, '2023-04-01', '2023-06-30', 30, '육아휴직 사용');