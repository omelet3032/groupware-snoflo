USE snoflo;
-- 부서정보 
CREATE TABLE department (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- 직급정보
CREATE TABLE job_position (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- 계약형태정보
CREATE TABLE job_type (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- 사원정보
CREATE TABLE employee (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL,
    department_code INTEGER UNSIGNED NOT NULL,
    job_position_code INTEGER UNSIGNED NOT NULL,
    job_type_code INTEGER UNSIGNED NOT NULL,
    -- manager_code INTEGER UNSIGNED NOT NULL DEFAULT 0,
    status VARCHAR(20) NOT NULL CHECK (status IN ('재직', '휴직', '퇴사')),
    FOREIGN KEY (department_code) REFERENCES department(code),
    FOREIGN KEY (job_position_code) REFERENCES job_position(code),
    FOREIGN KEY (job_type_code) REFERENCES job_type(code)
) ENGINE=InnoDB;

-- 개인정보
CREATE TABLE personal_information (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    birth_date DATE NOT NULL,
    photo VARCHAR(255),
    FOREIGN KEY (employee_code) REFERENCES employee(code)
) ENGINE=InnoDB;

-- 계정정보
CREATE TABLE account (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('관리자', '승인권자', '사원')),
    FOREIGN KEY (employee_code) REFERENCES employee(code)
) ENGINE=InnoDB;

-- 고용이력
CREATE TABLE employment_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    hire_date DATE NOT NULL,
    end_date DATE,
    hire_summary VARCHAR(50) NOT NULL CHECK (hire_summary IN ('신입', '경력')),
    end_summary VARCHAR(50) CHECK (end_summary IN ('자진퇴사', '권고사직', '계약종료')),
    UNIQUE(employee_code, hire_date),
    FOREIGN KEY (employee_code) REFERENCES employee(code)
) ENGINE=InnoDB;

-- 부서별 관리자 정보
CREATE TABLE department_manager (
    department_code INTEGER UNSIGNED NOT NULL,
    manager_code INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY (department_code, manager_code),
    FOREIGN KEY (department_code) REFERENCES department(code),
    FOREIGN KEY (manager_code) REFERENCES employee(code)
) ENGINE=InnoDB;

-- 부서이력
CREATE TABLE department_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    department_code INTEGER UNSIGNED NOT NULL,
    summary VARCHAR(50) NOT NULL CHECK (summary IN ('부서이동', '조직개편')),
 		 UNIQUE (employee_code, start_date),
    FOREIGN KEY (employee_code) REFERENCES employee(code),
    FOREIGN KEY (department_code) REFERENCES department(code)
) ENGINE=InnoDB;

-- 직급이력
CREATE TABLE job_position_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    job_position_code INTEGER UNSIGNED NOT NULL,
    summary VARCHAR(50) NOT NULL CHECK (summary IN ('진급', '정규직 전환')),
    UNIQUE (employee_code, start_date),
    FOREIGN KEY (employee_code) REFERENCES employee(code),
    FOREIGN KEY (job_position_code) REFERENCES job_position(code)
) ENGINE=InnoDB;

-- 계약형태이력
CREATE TABLE job_type_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    job_type_code INTEGER UNSIGNED NOT NULL,
    summary VARCHAR(50) NOT NULL CHECK (summary IN ('정규직 전환', '계약연장')),
    UNIQUE (employee_code, start_date),
    FOREIGN KEY (employee_code) REFERENCES employee(code),
    FOREIGN KEY (job_type_code) REFERENCES job_type(code)
) ENGINE=InnoDB;

-- 출퇴근기록
CREATE TABLE attendance_record (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    clock_in DATETIME,
    clock_out DATETIME,
    work_hours TIME,
    UNIQUE (employee_code, clock_in),
    FOREIGN KEY (employee_code) REFERENCES employee(code)
) ENGINE=InnoDB;

-- 휴가정보
CREATE TABLE vacation_type (
    id INTEGER UNSIGNED PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- 휴직정보 
CREATE TABLE leave_of_absence_type (
    id INTEGER UNSIGNED PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- 잔여휴가일수
CREATE TABLE remaining_vacation_day (
    employee_code INTEGER UNSIGNED NOT NULL,
    vacation_code INTEGER UNSIGNED NOT NULL,
    year YEAR NOT NULL,
    remaining_days INTEGER NOT NULL,
    PRIMARY KEY (employee_code, vacation_code, year),
    FOREIGN KEY (employee_code) REFERENCES employee(code),
    FOREIGN KEY (vacation_code) REFERENCES vacation_type(code)
) ENGINE=InnoDB;

-- 휴가부여내역
CREATE TABLE vacation_grant_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    vacation_code INTEGER UNSIGNED NOT NULL,
    date DATE NOT NULL,
    grant_days INTEGER NOT NULL,
    summary VARCHAR(50),
    UNIQUE(employee_code, vacation_code, date),
    FOREIGN KEY (employee_code) REFERENCES employee(code),
    FOREIGN KEY (vacation_code) REFERENCES vacation_type(code)
) ENGINE=InnoDB;

-- 휴가사용내역
CREATE TABLE vacation_usage_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    vacation_code INTEGER UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    usage_days INTEGER UNSIGNED NOT NULL,
    summary VARCHAR(50),
    UNIQUE(employee_code, start_date),
    FOREIGN KEY (employee_code) REFERENCES employee(code),
    FOREIGN KEY (vacation_code) REFERENCES vacation_type(code)
) ENGINE=InnoDB;

-- 휴직부여내역
CREATE TABLE leave_of_absence_grant_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    absence_code INTEGER UNSIGNED NOT NULL,
    date DATE NOT NULL,
    grant_days INTEGER,
    summary VARCHAR(50),
    UNIQUE(employee_code, absence_code, date),
    FOREIGN KEY (employee_code) REFERENCES employee(code),
    FOREIGN KEY (absence_code) REFERENCES leave_of_absence_type(code)
) ENGINE=InnoDB;

-- 휴직사용내역
CREATE TABLE leave_of_absence_usage_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    absence_code INTEGER UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    usage_days INTEGER UNSIGNED,
    summary VARCHAR(50),
    UNIQUE(employee_code, start_date),
    FOREIGN KEY (employee_code) REFERENCES employee(code),
    FOREIGN KEY (absence_code) REFERENCES leave_of_absence_type(code)
) ENGINE=InnoDB;


