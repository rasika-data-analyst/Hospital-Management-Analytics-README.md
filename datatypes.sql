SHOW CREATE TABLE patients_mysql;
SHOW CREATE TABLE appointments;
SHOW CREATE TABLE admissions;
SHOW CREATE TABLE billing;
SHOW CREATE TABLE lab_tests;
SHOW CREATE TABLE prescriptions;
SHOW CREATE TABLE doctors;
SHOW CREATE TABLE departments;
SHOW CREATE TABLE rooms;
SHOW CREATE TABLE medicines;


ALTER TABLE lab_tests
MODIFY lab_test_id VARCHAR(20),
MODIFY patient_id VARCHAR(20),
MODIFY doctor_id VARCHAR(20),
MODIFY appointment_id VARCHAR(20),
MODIFY admission_id VARCHAR(20),
MODIFY test_name VARCHAR(150),
MODIFY test_category VARCHAR(100),
MODIFY test_date DATE,
MODIFY result_status VARCHAR(50);

SET SQL_SAFE_UPDATES = 0;

UPDATE lab_tests
SET test_date = NULL
WHERE TRIM(test_date) IN ('', '0.0', '0');

SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE lab_tests
SET test_date = NULL
WHERE TRIM(test_date) = ''
   OR TRIM(test_date) IN ('0', '0.0')
   OR TRIM(test_date) NOT REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

SET SQL_SAFE_UPDATES = 1;


ALTER TABLE lab_tests
MODIFY lab_test_id VARCHAR(20),
MODIFY patient_id VARCHAR(20),
MODIFY doctor_id VARCHAR(20),
MODIFY appointment_id VARCHAR(20),
MODIFY admission_id VARCHAR(20),
MODIFY test_name VARCHAR(150),
MODIFY test_category VARCHAR(100),
MODIFY test_date DATE,
MODIFY result_status VARCHAR(50);

ALTER TABLE medicines
MODIFY medicine_id VARCHAR(20),
MODIFY medicine_name VARCHAR(150),
MODIFY category VARCHAR(100),
MODIFY manufacturer VARCHAR(150);


ALTER TABLE patients_mysql
MODIFY patient_id VARCHAR(20),
MODIFY first_name VARCHAR(100),
MODIFY last_name VARCHAR(100),
MODIFY gender VARCHAR(20),
MODIFY date_of_birth DATE,
MODIFY blood_group VARCHAR(10),
MODIFY marital_status VARCHAR(30),
MODIFY city VARCHAR(100),
MODIFY state VARCHAR(100),
MODIFY phone VARCHAR(20),
MODIFY email VARCHAR(150),
MODIFY insurance_provider VARCHAR(100),
MODIFY registration_date DATE;


ALTER TABLE prescriptions
MODIFY prescription_id VARCHAR(20),
MODIFY patient_id VARCHAR(20),
MODIFY doctor_id VARCHAR(20),
MODIFY appointment_id VARCHAR(20),
MODIFY admission_id VARCHAR(20),
MODIFY medicine_id VARCHAR(20),
MODIFY dosage VARCHAR(100),
MODIFY frequency VARCHAR(100),
MODIFY prescribed_date DATE;

ALTER TABLE rooms
MODIFY room_id VARCHAR(20),
MODIFY room_type VARCHAR(50);