-- Drop existing table (only for testing/demo purposes)
DROP TABLE IF EXISTS booking CASCADE;

-- ✅ Create parent table partitioned by RANGE on start_date
CREATE TABLE booking (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP,
    status VARCHAR(20)
) PARTITION BY RANGE (start_date);

-- ✅ Create partitions by year
CREATE TABLE booking_2023 PARTITION OF booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- ✅ Add index to partitions (important for performance)
CREATE INDEX idx_booking_2024_start_date ON booking_2024(start_date);
CREATE INDEX idx_booking_2025_start_date ON booking_2025(start_date);

-- ✅ Test query before/after partitioning
EXPLAIN ANALYZE
SELECT * FROM booking
WHERE start_date BETWEEN '2025-06-01' AND '2025-07-01';
