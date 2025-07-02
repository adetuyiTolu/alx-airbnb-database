SELECT *
FROM bookings b
LEFT JOIN users u ON b.user_id = u.user_id
LEFT JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id;


-- Refactored/Optimized Query: Retrieve bookings for a specific period (e.g., last 90 days)
-- This query is optimized by applying a filter on 'b.start_date'
-- which can utilize an index.

-- CREATE INDEX idx_bookings_start_date ON bookings(start_date);

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    b.status AS booking_status,
    u.user_id AS guest_user_id,
    u.username AS guest_username,
    u.email AS guest_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.price_per_night,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.status AS payment_status
FROM
    bookings b
JOIN
    users u ON b.user_id = u.user_id
JOIN
    properties p ON b.property_id = p.property_id
JOIN
    payments pay ON b.booking_id = pay.booking_id
WHERE
    b.start_date >= CURDATE() - INTERVAL 90 DAY; 

