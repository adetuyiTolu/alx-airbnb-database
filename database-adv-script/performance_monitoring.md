
# Database Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## Step 1: Monitor Query Performance

### Example Query
```sql
SELECT
    booking_id,
    start_date,
    end_date,
    total_price
FROM
    bookings_partitioned
WHERE
    start_date >= CURDATE() - INTERVAL 90 DAY;
```

### Execution Plan Analysis
```sql
EXPLAIN ANALYZE
SELECT
    booking_id,
    start_date,
    end_date,
    total_price
FROM
    bookings_partitioned
WHERE
    start_date >= CURDATE() - INTERVAL 90 DAY;
```

---

## Step 2: Identify Bottlenecks

The execution plan shows:
- `type = ALL` (full table scan)
- High number of rows scanned
- No index usage

It's a performance bottleneck.

---

## Step 3: Apply Schema Adjustments

### ✅ Add an Index on the Filtered Column
```sql
CREATE INDEX idx_bookings_start_date ON bookings_partitioned(start_date);
```

### ✅ Add Composite Index 
```sql
CREATE INDEX idx_booking_user_date ON bookings_partitioned(user_id, start_date);
```

---

## Step 4: Measure Post-Change Performance

### Re-check with `EXPLAIN ANALYZE`
```sql
EXPLAIN ANALYZE
SELECT
    booking_id,
    start_date,
    end_date,
    total_price
FROM
    bookings_partitioned
WHERE
    start_date >= CURDATE() - INTERVAL 90 DAY;
```

- Check for `type = range`
- Confirm index is used
- Reduced row scan count and faster query time

---
