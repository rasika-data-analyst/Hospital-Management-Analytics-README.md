# Hospital Management Analytics — Data Quality Notes

## Purpose
Record data-quality checks affecting the reliability of the report. Recheck these values after the final data refresh.

## Data Types
- Confirm appointment, admission, discharge, and billing date fields use appropriate Date/DateTime types.
- Confirm amounts, waiting times, length of stay, and ratings use appropriate numeric types.
- Review category fields for inconsistent capitalization, spelling, whitespace, and unexpected values.

## Missing Values
Earlier exploration identified:
- `appointments_clean[wait_time_min]`: 1,384 missing values
- `appointments_clean[satisfaction_rating]`: 2,161 missing values

Recheck these counts against the final model. Do not automatically replace missing values with zero unless zero has a valid business meaning.

## Duplicate Records and Identifiers
Earlier exploration identified repeated identifiers in billing and prescriptions. Recheck these against the final imported tables.
- Billing: repeated `bill_id` values were observed.
- Prescriptions: repeated prescription IDs were observed.

Do not automatically delete repeated IDs. Establish whether each table is one row per bill/prescription or whether rows represent valid line items or events. Choose counts and totals based on the correct table grain.

## Financial Validation
- Confirm the meaning and currency of `billing_clean[total_amount]`.
- Establish whether amount is stored once per bill or repeated across multiple rows.
- Reconcile revenue against an independent source total.
- Validate bill counts and amount-band logic.
- Treat the threshold 3161.71 as an exploratory analytical threshold, not an accounting standard.
- If 2026 data is partial, do not compare it directly with complete prior years without a partial-period label.

## Relationship Validation
- Confirm keys are unique on the one side of each relationship.
- Check foreign keys against parent records.
- Validate relationship cardinality and filter direction in Power BI.
- Ensure relationships do not multiply billing/admission amounts.
- Use only relationships supported by actual keys and model evidence.

## Readmission Validation
- Confirm values and spelling in `readmitted_within_30d`.
- Define numerator and eligible denominator.
- Check whether the indicator marks a prior admission followed by a readmission or the subsequent admission.
- Validate by patient and chronology if available.

## Publication Checklist
- [ ] Recheck row counts and missing values.
- [ ] Validate duplicate IDs against table grain.
- [ ] Reconcile revenue and distinct bill counts.
- [ ] Verify relationships and slicer behavior.
- [ ] Label partial-year periods.
- [ ] Remove or anonymize identifiable patient data.
- [ ] Remove credentials, connection strings, and private records.
