-- 📌 INDEX CREATION

-- Index for fast filtering by user in bookings
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- Index for faster joins between booking and property
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- Index to optimize sorting and filtering by date
CREATE INDEX idx_booking_created_at ON booking(created_at);

-- Index for counting and aggregating reviews per property
CREATE INDEX idx_review_property_id ON review(property_id);



-- 📊 PERFORMANCE TESTING WITH EXPLAIN ANALYZE

-- 1. Test filtering by user (should use idx_booking_user_id)
EXPLAIN ANALYZE
SELECT * FROM booking WHERE user_id = 5;

-- 2. Test join between booking and property (should use idx_booking_property_id)
EXPLAIN ANALYZE
SELECT booking.* 
FROM booking
JOIN property ON booking.property_id = property.id;

-- 3. Test sorting by created_at (should use idx_booking_created_at)
EXPLAIN ANALYZE
SELECT * FROM booking ORDER BY created_at DESC LIMIT 10;

-- 4. Test review aggregation (should use idx_review_property_id)
EXPLAIN ANALYZE
SELECT COUNT(*) FROM review WHERE property_id = 12;
