SELECT
    d.department_name,
    COUNT(a.appointment_id) AS total_appointments,
    ROUND(AVG(a.wait_time_min), 2) AS avg_wait_time_min,
    MAX(a.wait_time_min) AS max_wait_time_min
FROM appointments a
JOIN departments d
    ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_wait_time_min DESC;