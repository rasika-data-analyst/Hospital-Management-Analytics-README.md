# Hospital-Management-Analytics-README.md
Healthcare analytics dashboard using Power BI, SQL and Python to analyze appointments, hospital admissions, billing performance and patient activity.

# 🏥 Hospital Management Analytics | Power BI

## Project Overview

This project analyzes hospital operations, patient activity, appointments, admissions, and billing performance using SQL, Python, and Microsoft Power BI.

The objective is to transform healthcare operational data into actionable business insights that help hospital management monitor service performance, identify operational inefficiencies, and make data-informed decisions.

## Business Objectives

- Monitor patient, appointment, and admission activity.
- Evaluate appointment completion and no-show rates.
- Compare appointment volumes and performance across departments.
- Analyze billing revenue, payment patterns, and bill amounts.
- Understand patient demographics and length of hospital stay.
- Monitor discharge outcomes and 30-day readmission indicators.
- Build an interactive dashboard with filters and cross-visual interactions.

## Tools & Technologies

- **Power BI Desktop:** Dashboard development, visualizations, relationships, slicers, and DAX.
- **SQL / MySQL:** Data exploration, querying, joins, aggregation, and validation.
- **Python:** Data cleaning, data type conversion, duplicate checks, and exploratory analysis.
- **Pandas:** Data manipulation and quality checks.
- **Excel / CSV:** Data inspection and data exchange.
- **GitHub:** Project versioning and portfolio documentation.

## Dataset Overview

The project uses 10 related tables:

| Table | Business purpose |
|---|---|
| Patients | Patient demographics and registration |
| Appointments | Appointment dates, status, and waiting-time information |
| Admissions | Admission, discharge, and length-of-stay information |
| Billing | Bill amounts, dates, types, and payment information |
| Lab Tests | Laboratory test activity and turnaround information |
| Prescriptions | Prescription records |
| Doctors | Doctor and department-related information |
| Departments | Hospital department reference data |
| Medicines | Medicine reference data |
| Rooms | Hospital room information |

*Dataset note: Describe the data as synthetic, anonymized, or publicly sourced according to its actual origin. Do not publish identifiable patient data.*

## Dashboard Pages

### 1. Executive Overview
Provides a high-level view of hospital activity through key performance indicators and summary visuals.

### 2. Appointment Operations
Examines appointment completion, no-shows, department-level patterns, and appointment trends.

### 3. Financial Performance
Analyzes billing revenue, bill-type contribution, billing trends, payment patterns, and bill-amount distribution.

### 4. Patient & Admission Insights
Explores patient age groups, admission activity, length of stay, discharge outcomes, and readmission indicators.

## Key Performance Indicators

- Total Patients
- Total Appointments
- Completed Appointments
- Appointment Completion Rate
- No-Show Rate
- Total Admissions
- Total Revenue
- Average Bill Amount
- Average Length of Stay
- Total Discharges
- Readmission Rate

Metric definitions and calculations should be reviewed against the final model and data-quality checks before business use.

## Data Preparation & Quality Checks

The workflow includes:

1. Inspecting source tables and column structures.
2. Converting date and numeric fields to appropriate data types.
3. Reviewing missing values and duplicate identifiers.
4. Validating primary keys, relationships, and table granularity.
5. Creating derived fields and analytical categories.
6. Building and validating DAX measures.
7. Testing report filters and visual interactions.

Duplicate identifiers are investigated rather than automatically removed, because repeated records may represent either data-quality issues or legitimate transactions.

## Data Model & Analytics

The Power BI model connects related tables using appropriate keys, including patient, appointment, admission, department, and billing relationships where supported by the data.

DAX is used to calculate KPIs, rates, averages, and filtered metrics. Visual interactions and slicers allow users to explore results by relevant business dimensions.

## Business Value

The dashboard is designed to help hospital management:

- Identify departments and periods with higher appointment no-show rates.
- Monitor operational workload and appointment completion.
- Understand revenue contribution and billing distribution.
- Review length-of-stay and readmission patterns.
- Investigate potential data-quality issues before relying on reported metrics.

These are analytical use cases; the dashboard does not by itself establish clinical causes or prove operational improvements.

## Repository Structure

```text
Hospital-Management-Analytics/
├── README.md
├── Hospital_Management_Analytics.pbix
├── DAX_Measures.md
├── Data_Dictionary.md
├── Screenshots/
│   ├── 01_Executive_Overview.png
│   ├── 02_Appointment_Operations.png
│   ├── 03_Financial_Performance.png
│   └── 04_Patient_Admission_Insights.png
└── Documentation/
    ├── Project_Workflow.md
    └── Data_Quality_Notes.md
```

## How to Explore the Project

1. Review the dashboard screenshots in `Screenshots/`.
2. Open the `.pbix` file using Power BI Desktop, if available.
3. Read `DAX_Measures.md` for the main business calculations.
4. Review `Data_Dictionary.md` and the data-quality notes for model context.

## Limitations & Validation

Reported results depend on the supplied dataset, its completeness, and the correctness of table relationships. Revenue totals, distinct bill counts, and readmission calculations must be validated against the final data model before being used for business decisions.

## Author

**Data Analytics Portfolio Project**

Focus areas: SQL, Python, Excel, Power BI, data quality, business analysis, and dashboard development.


