SELECT
    d.department_name,
    COUNT(a.admission_id) AS total_admissions,
    ROUND(AVG(a.length_of_stay), 2) AS avg_length_of_stay_days,
    MAX(a.length_of_stay) AS max_length_of_stay_days
FROM admissions a
JOIN departments d
    ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_admissions DESC;