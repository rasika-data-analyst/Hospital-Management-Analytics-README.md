# Hospital Management Analytics — Data Model

## Tables
Verify exact names and fields against the final PBIX before treating this as a complete schema reference.

| Table | Purpose |
|---|---|
| `patients_clean` | Patient demographics and registration |
| `appointments_clean` | Appointment dates, status, waiting time, satisfaction |
| `admissions_clean` | Admission/discharge dates, length of stay, department, room, readmission indicator |
| `billing_clean` | Billing dates, amounts, bill type, payment fields |
| `lab_tests_clean` | Laboratory test activity |
| `prescriptions_clean` | Prescription records |
| `doctors_clean` | Doctor reference information |
| `departments_clean` | Department reference information |
| `medicines_clean` | Medicine reference information |
| `rooms_clean` | Room reference information |

## Relationship Candidates to Verify
Only document relationships that actually exist and are valid in the final Power BI model:
- `patients_clean[patient_id]` → `admissions_clean[patient_id]`
- `departments_clean[department_id]` → `admissions_clean[department_id]`
- `departments_clean[department_id]` → `appointments_clean[department_id]`, only if the key exists and the relationship is valid.

Document other relationships only after checking actual keys and cardinality.

## Model Quality Principles
- Dimension/reference tables should have unique keys on the one side of a one-to-many relationship.
- Do not relate columns only because their names look similar.
- Avoid connecting billing to departments through unsupported or ambiguous paths.
- Validate patient, appointment, admission, and billing totals under slicers.
- Prefer a dedicated Calendar table for date analysis when correctly configured.

## Model Diagram
Add a screenshot of the final Power BI Model view after verifying relationships. Remove or mask sensitive information before publishing.
