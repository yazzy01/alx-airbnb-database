-- Initial complex query that retrieves all bookings along with user details, property details, and payment details
-- This query joins multiple tables and includes various conditions

-- Original Query (Unoptimized)
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    p.property_id,
    p.name AS property_name,
    p.description,
    p.location,
    p.pricepernight,
    h.user_id AS host_id,
    h.first_name AS host_first_name,
    h.last_name AS host_last_name,
    h.email AS host_email,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    User h ON p.host_id = h.user_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
LEFT JOIN 
    Review r ON p.property_id = r.property_id AND u.user_id = r.user_id
WHERE 
    b.status = 'confirmed'
    AND b.start_date >= '2023-01-01'
    AND b.end_date <= '2023-12-31'
ORDER BY 
    b.start_date, p.name;

-- Optimized Query (to be implemented after analysis)
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed'
    AND b.start_date >= '2023-01-01'
    AND b.end_date <= '2023-12-31'
ORDER BY 
    b.start_date, p.name; 