USE snoflo;

ALTER TABLE accounts DROP FOREIGN KEY accounts_ibfk_1;
ALTER TABLE departments DROP FOREIGN KEY departments_ibfk_1;
ALTER TABLE employee_status DROP FOREIGN KEY employee_status_ibfk_1;
ALTER TABLE employee_status DROP FOREIGN KEY employee_status_ibfk_2;
ALTER TABLE employee_status DROP FOREIGN KEY employee_status_ibfk_3;
ALTER TABLE employee_status DROP FOREIGN KEY employee_status_ibfk_4;
ALTER TABLE job_history DROP FOREIGN KEY job_history_ibfk_1;
ALTER TABLE job_history DROP FOREIGN KEY job_history_ibfk_2;
ALTER TABLE job_history DROP FOREIGN KEY job_history_ibfk_3;
ALTER TABLE job_history DROP FOREIGN KEY job_history_ibfk_4;
ALTER TABLE attendance_record DROP FOREIGN KEY attendance_record_ibfk_1;
ALTER TABLE remaining_vacation_days DROP FOREIGN KEY remaining_vacation_days_ibfk_1;
ALTER TABLE remaining_vacation_days DROP FOREIGN KEY remaining_vacation_days_ibfk_2;
ALTER TABLE vacation_grant_history DROP FOREIGN KEY vacation_grant_history_ibfk_1;
ALTER TABLE vacation_grant_history DROP FOREIGN KEY vacation_grant_history_ibfk_2;
ALTER TABLE vacation_usage_history DROP FOREIGN KEY vacation_usage_history_ibfk_1;
ALTER TABLE vacation_usage_history DROP FOREIGN KEY vacation_usage_history_ibfk_2;
ALTER TABLE leave_of_absence_grant_history DROP FOREIGN KEY leave_of_absence_grant_history_ibfk_1;
ALTER TABLE leave_of_absence_grant_history DROP FOREIGN KEY leave_of_absence_grant_history_ibfk_2;
ALTER TABLE leave_of_absence_usage_history DROP FOREIGN KEY leave_of_absence_usage_history_ibfk_1;
ALTER TABLE leave_of_absence_usage_history DROP FOREIGN KEY leave_of_absence_usage_history_ibfk_2;


--
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employee_status;
DROP TABLE IF EXISTS job_history;
DROP TABLE IF EXISTS attendance_record;
DROP TABLE IF EXISTS remaining_vacation_days;
DROP TABLE IF EXISTS vacation_grant_history;
DROP TABLE IF EXISTS vacation_usage_history;
DROP TABLE IF EXISTS leave_of_absence_grant_history;
DROP TABLE IF EXISTS leave_of_absence_usage_history;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS job_types;
DROP TABLE IF EXISTS vacation_types;
DROP TABLE IF EXISTS leave_of_absence_types;
