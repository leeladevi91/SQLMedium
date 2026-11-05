SELECT
    b.customer_id,
    SUM(b.amount) AS total_revenue,
    COUNT(*) AS booking_count
FROM bookings b
WHERE b.status = 'COMPLETED'
GROUP BY b.customer_id
ORDER BY total_revenue DESC, b.customer_id ASC;
