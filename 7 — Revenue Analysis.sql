SELECT
    d.department_name,
    COUNT(b.bill_id) AS total_bills,
    ROUND(SUM(b.total_amount), 2) AS total_revenue,
    ROUND(AVG(b.total_amount), 2) AS avg_bill_amount
FROM billing b
JOIN appointments a
    ON b.appointment_id = a.appointment_id
JOIN departments d
    ON a.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_revenue DESC;