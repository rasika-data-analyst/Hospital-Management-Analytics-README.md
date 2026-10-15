SELECT
    (SELECT COUNT(*) FROM patients_mysql) AS total_patients,

    (SELECT COUNT(*) FROM appointments) AS total_appointments,

    (SELECT COUNT(*) FROM admissions) AS total_admissions,

    (SELECT COUNT(*)
     FROM appointments
     WHERE status = 'Completed') AS completed_appointments,

    (SELECT ROUND(SUM(total_amount), 2)
     FROM billing) AS total_revenue;