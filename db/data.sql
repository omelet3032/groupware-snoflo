USE snoflo;

INSERT INTO employees (name,phone, address, birth_date)
VALUES
('김경민', '010-1111-1111', '서울특별시 강남구', '1985-06-15'),
('박영훈', '010-2222-2222', '경기도 부천시', '1990-07-25'),
('이민영', '010-3333-3333', '경기도 성남시', '1993-03-12');

INSERT INTO accounts (employee_id, email, password, role)
VALUES
(1, 'omelet1@gmail.com', '1234', '관리자'),
(2, 'omelet2@gmail.com', '1235', '일반'),
(3, 'omelet3@gmail.com', '1236', '승인권자');

INSERT INTO departments (code, name, manager_id)
VALUES
(101, 'HR', 1),
(102, '개발팀', 2),
(103, '재무팀', 3);

INSERT INTO positions (code, name)
VALUES
(201, 'CEO'),
(202, '팀장'),
(203, '매니저');

INSERT INTO job_types (code, name)
VALUES
(301, '정규직'),
(302, '계약직'),
(303, '인턴');

INSERT INTO attendance_record (employee_id, clock_in, clock_out, work_hours)
VALUES
(1, '2024-06-01 08:00:00', null, null),
(2, null, '2024-03-01 18:00:00', null),
(3, '2024-06-01 08:30:00', '2024-03-01 17:30:00', '09:00:00');

INSERT INTO vacation_types (code, name)
VALUES
(401, '연차'),
(402, '생일반차'),
(403, '무급휴가');

INSERT INTO leave_of_absence_types (code, name)
VALUES
(501, '육아휴직'),
(502, '질병휴직'),
(503, '기타휴직');

--
INSERT INTO employee_status (code, employee_id, department_id, position_id, job_type_id, status, hire_date, end_date)
VALUES
(1001, 1, 1, 1, 1, '재직', '2010-01-15', NULL),
(1002, 2, 2, 2, 1, '재직', '2012-07-01', NULL),
(1003, 3, 3, 3, 3, '퇴사', '2015-03-20', '2020-08-30');

--
INSERT INTO job_history (employee_id, start_date, end_date, position_id, department_id, job_type_id, summary)
VALUES
(1, '2012-01-15', NULL, 3, 1, 1, '인턴->정규직'),
(2, '2012-07-01', NULL, 2, 2, 1, '승진'),
(3, '2015-03-20', '2020-08-30', 3, 3, 3, '퇴사');

-- 데이터 중복 입력됨
INSERT INTO remaining_vacation_days (employee_id, type_id, year, remaining_days)
VALUES
(1, 1, 2023, 15), 
(1, 2, 2023, 10),
(1, 1, 2022, 3),
(2, 2, 2022, 10),  
(3, 3, 2023, 5); 

--
INSERT INTO vacation_grant_history (employee_id, type_id, date, days, summary)
VALUES
(1, 1, '2023-01-01', 10, '연차휴가 지급'), 
(2, 2, '2023-01-15', 1, '생일휴가 지급');

--
INSERT INTO vacation_usage_history (employee_id, type_id, start_date, end_date, usage_days, summary)
VALUES
(1, 1, '2023-03-10', '2023-03-14', 5, '연차휴가 사용'),  
(2, 2, '2023-04-01', '2023-04-03', 1, '생일휴가 사용');
--
INSERT INTO leave_of_absence_grant_history (employee_id, type_id, date, days, summary)
VALUES
(1, 1, '2023-04-01', 30, '육아휴직 지급');

--
INSERT INTO leave_of_absence_usage_history (employee_id, type_id, start_date, end_date, usage_days, summary)
VALUES
(1, 1, '2023-04-01', '2023-06-30', 30, '육아휴직 사용');




