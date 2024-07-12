-- 부서정보 
CREATE TABLE departments (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL,
) ENGINE=InnoDB;

-- 직급정보
CREATE TABLE positions (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- 계약형태정보
CREATE TABLE job_types (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- 사원정보
CREATE TABLE employees (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    birth_date DATE NOT NULL,
    photo VARCHAR(255),
    department_id INTEGER UNSIGNED NOT NULL,
    position_id INTEGER UNSIGNED NOT NULL,
    job_type_id INTEGER UNSIGNED NOT NULL,
    status VARCHAR(20) NOT NULL,
    hire_date DATE NOT NULL,
    end_date DATE, 
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (position_id) REFERENCES positions(id),
    FOREIGN KEY (job_type_id) REFERENCES job_types(id);
) ENGINE=InnoDB;

-- 부서장 정보 테이블
CREATE TABLE department_managers (
		 manager_id INTEGER UNSIGNED NOT NULL,
	  department_id INTEGER UNSIGNED NOT NULL,
	  UNIQUE (manager_id, department_id),
	  FOREIGN KEY (manager_id) REFERENCES employees(id),
	  FOREIGN KEY (department_id) REFERENCES departments(id)
)

-- 계정정보
CREATE TABLE accounts (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id INTEGER UNSIGNED NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
) ENGINE=InnoDB;


-- 직무이력
CREATE TABLE job_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id INTEGER UNSIGNED,
    start_date DATE NOT NULL,
    end_date DATE,
    position_id INTEGER UNSIGNED NOT NULL,
    department_id INTEGER UNSIGNED NOT NULL,
    job_type_id INTEGER UNSIGNED NOT NULL,
    summary VARCHAR(50),
    UNIQUE(employee_id, start_date),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (position_id) REFERENCES positions(id),
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (job_type_id) REFERENCES job_types(id)
) ENGINE=InnoDB;

-- 출퇴근기록
CREATE TABLE attendance_record (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id INTEGER UNSIGNED NOT NULL,
    clock_in DATETIME,
    clock_out DATETIME,
    work_hours TIME,
    UNIQUE (employee_id, clock_in),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
) ENGINE=InnoDB;

-- 휴가정보
CREATE TABLE vacation_types (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED UNIQUE,
    name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- 휴직정보 
CREATE TABLE leave_of_absence_types (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code INTEGER UNSIGNED UNIQUE,
    name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- 잔여휴가일수
CREATE TABLE remaining_vacation_days (
    employee_id INTEGER UNSIGNED NOT NULL,
    type_id INTEGER UNSIGNED NOT NULL,
    year YEAR NOT NULL,
    remaining_days INTEGER NOT NULL,
    UNIQUE(employee_id, type_id, year),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (type_id) REFERENCES vacation_types(id)
) ENGINE=InnoDB;

-- 휴가부여내역
CREATE TABLE vacation_grant_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id INTEGER UNSIGNED NOT NULL,
    type_id INTEGER UNSIGNED NOT NULL,
    date DATE NOT NULL,
    grant_days INTEGER NOT NULL,
    summary VARCHAR(50),
    UNIQUE(employee_id, type_id, date),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (type_id) REFERENCES vacation_types(id)
) ENGINE=InnoDB;

-- 휴가사용내역
CREATE TABLE vacation_usage_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id INTEGER UNSIGNED NOT NULL,
    type_id INTEGER UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    usage_days INTEGER UNSIGNED NOT NULL,
    summary VARCHAR(50),
    UNIQUE(employee_id, start_date),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (type_id) REFERENCES vacation_types(id)
) ENGINE=InnoDB;

-- 휴직부여내역
CREATE TABLE leave_of_absence_grant_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id INTEGER UNSIGNED NOT NULL,
    type_id INTEGER UNSIGNED NOT NULL,
    date DATE NOT NULL,
    grnat_days INTEGER,
    summary VARCHAR(50),
    UNIQUE(employee_id, type_id, date),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (type_id) REFERENCES leave_of_absence_types(id)
) ENGINE=InnoDB;

-- 휴직사용내역
CREATE TABLE leave_of_absence_usage_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id INTEGER UNSIGNED NOT NULL,
    type_id INTEGER UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    usage_days INTEGER UNSIGNED,
    summary VARCHAR(50),
    UNIQUE(employee_id, start_date),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (type_id) REFERENCES leave_of_absence_types(id)
) ENGINE=InnoDB;


