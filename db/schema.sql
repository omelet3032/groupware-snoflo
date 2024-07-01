USE snoflo;

-- 사원정보 (개인정보)
CREATE TABLE employees_personal_infomation (
    id INTEGER UNSIGNED AUTO_INCREMENT, -- 일련번호 기본키
    name VARCHAR(20) NOT NULL, -- 이름
    phone VARCHAR(20) NOT NULL, -- 연락처
    address VARCHAR(100) NOT NULL , -- 주소
    birth_date DATE NOT NULL, -- 생년월일
    photo VARCHAR(255), -- 증명사진
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- 계정정보
CREATE TABLE accounts (
		 id INTEGER UNSIGNED AUTO_INCREMENT,
		 employee_id INTEGER UNSIGNED NOT NULL, -- 최고관리자 계정은 ceo / 승인권자는 팀장, 경영지원팀
    email VARCHAR(50) NOT NULL, -- 이메일 (아이디)
    password VARCHAR(50) NOT NULL, -- 비밀번호
    role VARCHAR(20) NOT NULL, -- 역할 (관리자	, 승인권자, 일반)
    UNIQUE (email),
    PRIMARY KEY (id),	
    FOREIGN KEY (employee_id) REFERENCES employees(id)
) ENGINE=InnoDB;

-- 부서정보
CREATE TABLE departments ( 
		 id INTEGER UNSIGNED AUTO_INCREMENT,
    code INTEGER UNSIGNED NOT NULL, -- 부서코드
    name VARCHAR(20) NOT NULL, -- 부서이름
    manager_id INTEGER UNSIGNED,-- 관리자 이름 
    UNIQUE (code),
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES employees(id)
) ENGINE=InnoDB;

-- 직급정보
CREATE TABLE positions (
	id INTEGER UNSIGNED AUTO_INCREMENT,
    code INTEGER UNSIGNED NOT NULL, -- 직급코드
    name VARCHAR(20) NOT NULL, -- 직급이름
    UNIQUE (code),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- 고용형태 정보
CREATE TABLE job_types (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    code INTEGER UNSIGNED NOT NULL, -- 직급코드
    name VARCHAR(20) NOT NULL, -- 직급이름
    UNIQUE (code),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- 사원정보 (사내정보)
CREATE TABLE employee_company_information (
    id INTEGER UNSIGNED AUTO_INCREMENT,        
    code INTEGER UNSIGNED NOT NULL, -- 사원코드 
    employee_id INTEGER UNSIGNED NOT NULL, -- 사번 / employees 테이블 참조 외래키
    department_id INTEGER UNSIGNED NOT NULL, -- 부서코드 / departments 테이블 참조 외래키
    position_id INTEGER UNSIGNED NOT NULL, -- 직급코드 / positions 테이블 참조 외래키
    job_type_id INTEGER UNSIGNED NOT NULL, -- 고용형태코드 / job_types 테이블 참조 외래키
    status VARCHAR(20) NOT NULL, -- 재직상태 (예: 재직, 퇴사 등)
    hire_date DATE NOT NULL, -- 상태 시작일
    end_date DATE, -- 상태 종료일 (현재 재직 중인 경우 NULL)
    UNIQUE(code),
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (position_id) REFERENCES positions(id),
    FOREIGN KEY (job_type_id) REFERENCES job_types(id)
) ENGINE=InnoDB;

-- 인사이동 기록 (부서이동, 승진, 고용형태 변경)
CREATE TABLE job_history (
		 id INTEGER UNSIGNED AUTO_INCREMENT,
		 employee_id INTEGER UNSIGNED, -- 사번 / employee 참조 외래키
    start_date DATE NOT NULL, -- 시작일자 (입사, 승진, 부서이동 등)
    end_date DATE, -- 마감일자? (퇴사, 이전 부서 근무기간 등)
    position_id INTEGER UNSIGNED NOT NULL, -- 직급코드 / positions 참조 외래키
    department_id INTEGER UNSIGNED NOT NULL, -- 부서코드 / departments 참조 외래키
    job_type_id INTEGER UNSIGNED NOT NULL, -- 고용형태코드 / employment_types 참조 외래키
    summary VARCHAR(50), -- 부서이동 및 승진 관련 메모 ex. 부서이동, 팀장으로 승진
    UNIQUE(employee_id, start_date),
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (position_id) REFERENCES positions(id),
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (job_type_id) REFERENCES job_types(id)
) ENGINE=InnoDB;

-- 출퇴근 기록
CREATE TABLE attendance_record (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    employee_id INTEGER UNSIGNED NOT NULL, -- 사번
    clock_in DATETIME, -- 출근일시
    clock_out DATETIME, -- 퇴근일시
    work_hours TIME, -- 근무시간 (INSERT INTO ~ timediff 함수)
    UNIQUE (employee_id, clock_in),
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
) ENGINE=InnoDB;

-- 휴가 종류 (명명 규칙 가독성을 고려하여 vacation_code만으로 의미가 명확하다고 판단, type 제거함)
CREATE TABLE vacation_types (
	id INTEGER UNSIGNED AUTO_INCREMENT,
    code INTEGER UNSIGNED, -- 휴가 코드
    name VARCHAR(20) NOT NULL, -- 휴가 타입 (연차, 휴직 등)
    UNIQUE (code),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- 직원별 휴가내역
-- 추후 연차수당 지급을 위한 연도별 남은 연차 관리가 필요하다
CREATE TABLE remaining_vacation_days (
    employee_id INTEGER UNSIGNED NOT NULL,
    type_id INTEGER UNSIGNED NOT NULL,
    year YEAR NOT NULL, -- 연도
    remaining_days INTEGER NOT NULL,
    UNIQUE(employee_id, type_id, year),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (type_id) REFERENCES vacation_types(id)
) ENGINE=InnoDB;

-- 휴가 지급내역
CREATE TABLE vacation_grant_history (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    employee_id INTEGER UNSIGNED NOT NULL, -- 사번
    type_id INTEGER UNSIGNED NOT NULL, -- 휴가종류 / vacation_types 외래키
    date DATE NOT NULL, -- 휴가 지급 일자
    days INTEGER NOT NULL, -- 휴가 지급일수
    summary VARCHAR(50), -- 휴가/휴직 지급 관련 메모
    UNIQUE(employee_id, type_id, date),
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
	FOREIGN KEY (type_id) REFERENCES vacation_types(id)
) ENGINE=InnoDB;

-- 휴가 사용내역
CREATE TABLE vacation_usage_history (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    employee_id INTEGER UNSIGNED NOT NULL, -- 사번
    type_id INTEGER UNSIGNED NOT NULL, -- 사용한 휴가 종류
    start_date DATE NOT NULL, -- 시작일자
    end_date DATE NOT NULL, -- 종료일자
    usage_days INTEGER UNSIGNED NOT NULL, -- 사용일수
    summary VARCHAR(50), -- 휴가/휴직 지급 관련 메모
    UNIQUE(employee_id, start_date),
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
	FOREIGN KEY (type_id) REFERENCES vacation_types(id)
) ENGINE=InnoDB;

-- 휴직 종류
CREATE TABLE leave_of_absence_types (
	id INTEGER UNSIGNED AUTO_INCREMENT,
    code INTEGER UNSIGNED, -- 휴가 코드
    name VARCHAR(20) NOT NULL, -- 휴가 타입 (연차, 휴직 등)
    UNIQUE (code),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- 휴직 지급내역
CREATE TABLE leave_of_absence_grant_history (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    employee_id INTEGER UNSIGNED NOT NULL, -- 사번
    type_id INTEGER UNSIGNED NOT NULL, -- 휴가종류 / vacation_types 외래키
	date DATE NOT NULL, -- 지급일자
    days INTEGER, -- 휴직 지급일수
    summary VARCHAR(50), -- 휴가/휴직 지급 관련 메모
    PRIMARY KEY (id),
    UNIQUE(employee_id, type_id, date),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
	FOREIGN KEY (type_id) REFERENCES leave_of_absence_types(id)
) ENGINE=InnoDB;

-- 휴직 사용내역
CREATE TABLE leave_of_absence_usage_history (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    employee_id INTEGER UNSIGNED NOT NULL, -- 사번
    type_id INTEGER UNSIGNED NOT NULL, -- 사용한 휴직 종류
    start_date DATE NOT NULL, -- 시작일자
    end_date DATE, -- 종료일자   추후 업데이트 가능성으로 인한 not null 조건 해제
    usage_days INTEGER UNSIGNED, -- 사용일수 // 추후 업데이트 가능성으로 인한 not null 조건 해제
    summary VARCHAR(50), -- 휴가/휴직 지급 관련 메모
    UNIQUE(employee_id, start_date),
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
	FOREIGN KEY (type_id) REFERENCES  leave_of_absence_types(id)
) ENGINE=InnoDB;

-- INDEX
-- departments
ALTER TABLE departments ADD INDEX (manager_id);

