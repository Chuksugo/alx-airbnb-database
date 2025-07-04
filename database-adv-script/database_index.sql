-- Index for fast filtering by user in bookings
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- Index for faster joins between booking and property
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- Index to optimize sorting and filtering by date
CREATE INDEX idx_booking_created_at ON booking(created_at);

-- Index for counting and aggregating reviews per property
CREATE INDEX idx_review_property_id ON review(property_id);
