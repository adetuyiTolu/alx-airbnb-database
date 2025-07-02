
# Booking Query Optimization

This markdown explains a basic improvement to a SQL query that retrieves booking data.

## Original Query

The original query selected all columns using `SELECT *` and used `LEFT JOIN`s without any filters:

```sql
SELECT *
FROM bookings b
LEFT JOIN users u ON b.user_id = u.user_id
LEFT JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id;
```

## Optimized Query

The optimized query:

- Filters bookings from the last 90 days
- Selects only necessary columns

```sql
-- Optional index to speed up date filtering
-- CREATE INDEX idx_bookings_start_date ON bookings(start_date);

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    b.status AS booking_status,
    u.user_id AS guest_user_id,
    u.email AS guest_email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.price_per_night,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
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
```

## Benefits

- Faster performance
- Clearer, more focused data output
- Easier to maintain
