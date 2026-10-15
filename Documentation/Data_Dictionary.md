# Hospital Management Analytics — Data Dictionary

## Purpose
This document describes the main tables and business fields used in the Hospital Management Analytics project. Verify the exact column names and data types against the final Power BI model.

## 1. Patients — `patients_clean`

| Column | Business meaning |
|---|---|
| `patient_id` | Unique patient identifier |
| `first_name`, `last_name` | Patient name fields; do not publish identifiable values |
| `gender` | Recorded gender |
| `date_of_birth` | Patient date of birth; sensitive information |
| `age` | Patient age |
| `blood_group` | Recorded blood group |
| `marital_status` | Recorded marital status |
| `city` | Patient city |
| `registration_date` | Patient registration date |

## 2. Appointments — `appointments_clean`

| Column | Business meaning |
|---|---|
| `appointment_id` | Appointment identifier |
| `patient_id` | Patient associated with the appointment |
| `appointment_date` | Scheduled appointment date |
| `status` | Appointment outcome or status |
| `wait_time_min` | Recorded waiting time in minutes |
| `satisfaction_rating` | Recorded patient satisfaction score |
| `department_id` | Department associated with the appointment, if present |
| `appointment_type` | Appointment category, if present |

## 3. Admissions — `admissions_clean`

| Column | Business meaning |
|---|---|
| `admission_id` | Admission identifier |
| `patient_id` | Patient associated with the admission |
| `admission_date` | Admission date |
| `discharge_date` | Discharge date, if recorded |
| `department_id` | Associated department identifier |
| `length_of_stay` | Recorded length of stay |
| `discharge_status` | Recorded discharge outcome |
| `readmitted_within_30d` | Recorded 30-day readmission indicator |
| `admission_type` | Admission category, if present |
| `room_id` | Associated room identifier, if present |

## 4. Billing — `billing_clean`

| Column | Business meaning |
|---|---|
| `bill_id` | Bill identifier; uniqueness must be validated |
| `bill_date` | Billing date |
| `total_amount` | Recorded billing amount |
| `bill_type` | Bill category, such as OPD or IPD, if present |
| `payment_status` | Payment status, if present |
| `payment_method` | Payment method, if present |

## 5. Laboratory Tests — `lab_tests_clean`

Contains laboratory test records. Relevant fields may include test identifiers, patient identifiers, test dates, test categories, costs, and turnaround times. Confirm the exact columns in the model.

## 6. Prescriptions — `prescriptions_clean`

Contains prescription records. Relevant fields may include prescription identifiers, patient identifiers, prescribed dates, and medicine references. Confirm identifier uniqueness and exact column names.

## 7. Doctors — `doctors_clean`

Contains doctor reference information, potentially including doctor identifiers, department identifiers, and joining dates. Confirm the available fields.

## 8. Departments — `departments_clean`

Contains department reference information, including department identifiers and department names where available.

## 9. Medicines — `medicines_clean`

Contains medicine reference information, including medicine identifiers and descriptive attributes where available.

## 10. Rooms — `rooms_clean`

Contains room reference information, including room identifiers and room attributes where available.

## Data Type Guidelines

- Identifier columns should use consistent types across related tables.
- Date fields should use Date or Date/Time types as appropriate.
- Amounts should use an appropriate decimal or currency-compatible numeric type.
- Counts and durations should use suitable numeric types.
- Categories should use consistent text values.

## Important Notes

- This dictionary is a business-oriented reference, not a substitute for the actual schema.
- Confirm all field names and data types against the final Power BI model.
- Do not publish names, dates of birth, or other identifiable patient-level information.
- Investigate duplicate identifiers before deciding whether records are invalid.
- Confirm the billing table grain before interpreting revenue and bill counts.
