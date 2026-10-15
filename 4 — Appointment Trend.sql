SELECT
    YEAR(appointment_date) AS appointment_year,
    MONTH(appointment_date) AS appointment_month,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY
    YEAR(appointment_date),
    MONTH(appointment_date)
ORDER BY
    appointment_year,
    appointment_month;