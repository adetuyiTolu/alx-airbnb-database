CREATE TABLE bookings_partitioned (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    total_price DECIMAL(10,2),
    status VARCHAR(50),
    PRIMARY KEY (booking_id)
)
PARTITION BY RANGE COLUMNS(start_date) (
    PARTITION p2022 VALUES LESS THAN ('2023-01-01'),
    PARTITION p2023 VALUES LESS THAN ('2024-01-01'),
    PARTITION p2024 VALUES LESS THAN ('2025-01-01'),
    PARTITION p2025 VALUES LESS THAN ('2026-01-01'),
    PARTITION pmax VALUES LESS THAN (MAXVALUE)
);

-- SELECT query

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
