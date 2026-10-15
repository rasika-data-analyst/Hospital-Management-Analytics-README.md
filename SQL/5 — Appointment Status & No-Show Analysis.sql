SELECT
    status,
    COUNT(*) AS total_appointments,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM appointments
GROUP BY status
ORDER BY total_appointments DESC;