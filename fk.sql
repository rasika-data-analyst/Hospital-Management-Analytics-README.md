SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'hospital_analytics'
ORDER BY TABLE_NAME, ORDINAL_POSITION;


SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hospital_analytics'
ORDER BY TABLE_NAME, CONSTRAINT_NAME, ORDINAL_POSITION;

USE hospital_analytics;

ALTER TABLE patients_mysql
ADD PRIMARY KEY (patient_id);

ALTER TABLE doctors
ADD PRIMARY KEY (doctor_id);

ALTER TABLE departments
ADD PRIMARY KEY (department_id);

ALTER TABLE rooms
ADD PRIMARY KEY (room_id);


USE hospital_analytics;

-- APPOINTMENTS
ALTER TABLE appointments
ADD CONSTRAINT fk_appointments_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients_mysql(patient_id);

ALTER TABLE appointments
ADD CONSTRAINT fk_appointments_doctor
    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id);

ALTER TABLE appointments
ADD CONSTRAINT fk_appointments_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id);


-- ADMISSIONS
ALTER TABLE admissions
ADD CONSTRAINT fk_admissions_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients_mysql(patient_id);

ALTER TABLE admissions
ADD CONSTRAINT fk_admissions_doctor
    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id);

ALTER TABLE admissions
ADD CONSTRAINT fk_admissions_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id);

ALTER TABLE admissions
ADD CONSTRAINT fk_admissions_room
    FOREIGN KEY (room_id)
    REFERENCES rooms(room_id);


-- BILLING
ALTER TABLE billing
ADD CONSTRAINT fk_billing_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients_mysql(patient_id);

ALTER TABLE billing
ADD CONSTRAINT fk_billing_appointment
    FOREIGN KEY (appointment_id)
    REFERENCES appointments(appointment_id);

ALTER TABLE billing
ADD CONSTRAINT fk_billing_admission
    FOREIGN KEY (admission_id)
    REFERENCES admissions(admission_id);


-- LAB TESTS
ALTER TABLE lab_tests
ADD CONSTRAINT fk_lab_tests_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients_mysql(patient_id);

ALTER TABLE lab_tests
ADD CONSTRAINT fk_lab_tests_doctor
    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id);

ALTER TABLE lab_tests
ADD CONSTRAINT fk_lab_tests_appointment
    FOREIGN KEY (appointment_id)
    REFERENCES appointments(appointment_id);

ALTER TABLE lab_tests
ADD CONSTRAINT fk_lab_tests_admission
    FOREIGN KEY (admission_id)
    REFERENCES admissions(admission_id);


-- PRESCRIPTIONS
ALTER TABLE prescriptions
ADD CONSTRAINT fk_prescriptions_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients_mysql(patient_id);

ALTER TABLE prescriptions
ADD CONSTRAINT fk_prescriptions_doctor
    FOREIGN KEY (doctor_id)
    REFERENCES doctors(doctor_id);

ALTER TABLE prescriptions
ADD CONSTRAINT fk_prescriptions_appointment
    FOREIGN KEY (appointment_id)
    REFERENCES appointments(appointment_id);

ALTER TABLE prescriptions
ADD CONSTRAINT fk_prescriptions_admission
    FOREIGN KEY (admission_id)
    REFERENCES admissions(admission_id);

ALTER TABLE prescriptions
ADD CONSTRAINT fk_prescriptions_medicine
    FOREIGN KEY (medicine_id)
    REFERENCES medicines(medicine_id);


-- DOCTORS
ALTER TABLE doctors
ADD CONSTRAINT fk_doctors_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id);


-- DEPARTMENTS
ALTER TABLE departments
ADD CONSTRAINT fk_departments_head_doctor
    FOREIGN KEY (head_doctor_id)
    REFERENCES doctors(doctor_id);

ALTER TABLE medicines
ADD PRIMARY KEY (medicine_id);

ALTER TABLE appointments
ADD PRIMARY KEY (appointment_id);

ALTER TABLE admissions
ADD PRIMARY KEY (admission_id);

ALTER TABLE billing
ADD PRIMARY KEY (bill_id);

ALTER TABLE lab_tests
ADD PRIMARY KEY (lab_test_id);

ALTER TABLE prescriptions
ADD PRIMARY KEY (prescription_id);
SELECT
    COUNT(*) AS total_foreign_keys
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hospital_analytics'
  AND REFERENCED_TABLE_NAME IS NOT NULL;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hospital_analytics'
  AND (
      CONSTRAINT_NAME = 'PRIMARY'
      OR REFERENCED_TABLE_NAME IS NOT NULL
  )
ORDER BY TABLE_NAME, CONSTRAINT_NAME, ORDINAL_POSITION;