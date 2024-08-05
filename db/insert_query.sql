USE snoflo;

-- 트리거를 실행해보자

INSERT INTO employee (code, name, department_code, job_position_code, job_type_code, manager_code, status)
VALUES
(1014, '김경민', 101, 201, 301, 0, '재직');


INSERT INTO account (employee_code, email, password, role)
VALUES
(1014, 'kyungmin.kim@gmail.com', '1234', '사원');


SELECT * FROM employee;

/*-- 고용이력
CREATE TABLE employment_history (
    id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code INTEGER UNSIGNED NOT NULL,
    hire_date DATE NOT NULL,
    end_date DATE,
    summary VARCHAR(50)  CHECK (summary IN ('자진퇴사', '권고사직', '계약종료')),
    UNIQUE(employee_code, hire_date),
    FOREIGN KEY (employee_code) REFERENCES employee(code)
) ENGINE=InnoDB;*/

INSERT INTO (employee_code, hire_date, end_date, )



