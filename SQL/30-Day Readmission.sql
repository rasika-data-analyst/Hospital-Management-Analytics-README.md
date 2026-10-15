SELECT
    COUNT(*) AS total_admissions,
    SUM(
        CASE
            WHEN readmitted_within_30d = 'Yes' THEN 1
            ELSE 0
        END
    ) AS readmitted_cases,
    ROUND(
        SUM(
            CASE
                WHEN readmitted_within_30d = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS readmission_rate_pct
FROM admissions;


SELECT
    d.department_name,
    COUNT(a.admission_id) AS total_admissions,
    SUM(
        CASE
            WHEN a.readmitted_within_30d = 'Yes' THEN 1
            ELSE 0
        END
    ) AS readmitted_cases,
    ROUND(
        SUM(
            CASE
                WHEN a.readmitted_within_30d = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(a.admission_id),
        2
    ) AS readmission_rate_pct
FROM admissions a
JOIN departments d
    ON a.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(a.admission_id) >= 20
ORDER BY readmission_rate_pct DESC;