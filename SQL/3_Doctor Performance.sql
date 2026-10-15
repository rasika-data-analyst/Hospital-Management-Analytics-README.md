SELECT
    d.doctor_id,
    d.doctor_name,
    d.specialization,
    COUNT(a.appointment_id) AS total_appointments,
    ROUND(AVG(a.satisfaction_rating), 2) AS avg_satisfaction
FROM doctors d
JOIN appointments a
    ON d.doctor_id = a.doctor_id
GROUP BY
    d.doctor_id,
    d.doctor_name,
    d.specialization
ORDER BY total_appointments DESC;