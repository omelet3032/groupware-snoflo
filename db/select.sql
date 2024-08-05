USE snoflo;


UPDATE employee SET manager_code = 0 WHERE manager_code IS NULL;

SELECT * FROM employee;
SELECT * FROM personal_information;
SELECT * FROM account;
SELECT * FROM department;
SELECT * FROM department_manager;
SELECT * FROM job_position;
SELECT * FROM job_type;
SELECT * FROM department_history;
SELECT * FROM job_position_history;
SELECT * FROM job_type_history;
SELECT * FROM attendance_record;
SELECT * FROM remaining_vacation_day;
SELECT * FROM vacation_type;
SELECT * FROM vacation_grant_history;
SELECT * FROM vacation_usage_history;
SELECT * FROM leave_of_absence_type;
SELECT * FROM leave_of_absence_grant_history;
SELECT * FROM leave_of_absence_usage_history;