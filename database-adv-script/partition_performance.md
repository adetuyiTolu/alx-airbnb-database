# Bookings Table Optimization Using Partitioning

## Objective

Improve query performance on the large `bookings` table by implementing **partitioning** based on the `start_date` column.

## Problem

The `bookings` table contains a large volume of data. Queries filtering by `start_date` (e.g., last 90 days) were slow due to full table scans.

## Solution

We created a **partitioned table** `bookings_partitioned`, using `RANGE COLUMNS(start_date)`, to split the data by year. This allows MySQL to quickly locate relevant data in specific partitions when querying by date.

### Partitioning Strategy

```sql
PARTITION BY RANGE COLUMNS(start_date) (
    PARTITION p2022 VALUES LESS THAN ('2023-01-01'),
    PARTITION p2023 VALUES LESS THAN ('2024-01-01'),
    PARTITION p2024 VALUES LESS THAN ('2025-01-01'),
    PARTITION p2025 VALUES LESS THAN ('2026-01-01'),
    PARTITION pmax  VALUES LESS THAN (MAXVALUE)
);
```

### Primary Key

To meet MySQL partitioning rules, the `PRIMARY KEY` includes the partitioning column:

```sql
PRIMARY KEY (booking_id, start_date)
```

## Query Example

```sql
SELECT
    booking_id,
    start_date,
    end_date,
    total_price,
    status
FROM
    bookings_partitioned
WHERE
    start_date >= CURDATE() - INTERVAL 90 DAY;
```

## Results

- Query execution time improved noticeably.
- Only relevant partitions are scanned.
