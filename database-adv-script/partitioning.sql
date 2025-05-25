-- Table partitioning implementation for the Booking table
-- Partitioning by start_date to improve query performance on large datasets

-- 1. Create a new partitioned table structure
CREATE TABLE Booking_Partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 2. Create partitions by quarter for the current and next year
-- 2023 Quarters
CREATE TABLE booking_q1_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2023-04-01');

CREATE TABLE booking_q2_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-04-01') TO ('2023-07-01');

CREATE TABLE booking_q3_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-07-01') TO ('2023-10-01');

CREATE TABLE booking_q4_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-10-01') TO ('2024-01-01');

-- 2024 Quarters
CREATE TABLE booking_q1_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE booking_q2_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE booking_q3_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE booking_q4_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');

-- Create a default partition for any data outside the defined ranges
CREATE TABLE booking_default PARTITION OF Booking_Partitioned DEFAULT;

-- 3. Create the same indexes on the partitioned table as on the original table
CREATE INDEX idx_booking_part_property_id ON Booking_Partitioned(property_id);
CREATE INDEX idx_booking_part_user_id ON Booking_Partitioned(user_id);
CREATE INDEX idx_booking_part_status ON Booking_Partitioned(status);
CREATE INDEX idx_booking_part_dates ON Booking_Partitioned(start_date, end_date);

-- 4. Migrate data from the original table to the partitioned table
INSERT INTO Booking_Partitioned
SELECT * FROM Booking;

-- 5. Test query performance before partitioning
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date >= '2023-04-01' AND start_date < '2023-07-01'
ORDER BY start_date;

-- 6. Test query performance after partitioning
EXPLAIN ANALYZE
SELECT *
FROM Booking_Partitioned
WHERE start_date >= '2023-04-01' AND start_date < '2023-07-01'
ORDER BY start_date;

-- 7. Test another query for Q3 2023
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    p.name AS property_name,
    u.first_name,
    u.last_name
FROM 
    Booking b
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    User u ON b.user_id = u.user_id
WHERE 
    b.start_date >= '2023-07-01' AND b.start_date < '2023-10-01'
ORDER BY 
    b.start_date;

-- 8. Test the same query on the partitioned table
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    p.name AS property_name,
    u.first_name,
    u.last_name
FROM 
    Booking_Partitioned b
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    User u ON b.user_id = u.user_id
WHERE 
    b.start_date >= '2023-07-01' AND b.start_date < '2023-10-01'
ORDER BY 
    b.start_date;

-- 9. Optional: If the performance is satisfactory, rename tables to switch to the partitioned version
-- (In a production environment, this would be done during a maintenance window)
/*
ALTER TABLE Booking RENAME TO Booking_Original;
ALTER TABLE Booking_Partitioned RENAME TO Booking;
*/ 