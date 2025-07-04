-- Initial unoptimized query: Join all related details for a booking
SELECT 
    booking.id AS booking_id,
    user.id AS user_id,
    user.name AS user_name,
    property.id AS property_id,
    property.name AS property_name,
    payment.id AS payment_id,
    payment.amount,
    payment.status,
    booking.created_at
FROM 
    booking
JOIN 
    user ON booking.user_id = user.id
JOIN 
    property ON booking.property_id = property.id
JOIN 
    payment ON booking.id = payment.booking_id;

-- Analyze the query to identify bottlenecks
EXPLAIN ANALYZE
SELECT 
    booking.id AS booking_id,
    user.id AS user_id,
    user.name AS user_name,
    property.id AS property_id,
    property.name AS property_name,
    payment.id AS payment_id,
    payment.amount,
    payment.status,
    booking.created_at
FROM 
    booking
JOIN 
    user ON booking.user_id = user.id
JOIN 
    property ON booking.property_id = property.id
JOIN 
    payment ON booking.id = payment.booking_id;

-- Refactored version (optimized)
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    py.amount,
    b.created_at
FROM 
    booking b
JOIN 
    user u ON b.user_id = u.id
JOIN 
    property p ON b.property_id = p.id
JOIN 
    payment py ON b.id = py.booking_id;
