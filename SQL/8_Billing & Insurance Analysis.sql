SELECT
    ROUND(SUM(total_amount), 2) AS total_billed,
    ROUND(SUM(insurance_covered), 2) AS insurance_covered,
    ROUND(SUM(patient_payable), 2) AS patient_payable,
    ROUND(
        SUM(insurance_covered) * 100.0 / NULLIF(SUM(total_amount), 0),
        2
    ) AS insurance_coverage_pct
FROM billing;