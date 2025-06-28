-- Users
INSERT INTO User (user_id, first_name, last_name, email, phone_number, role)
VALUES
('uuid-1', 'John', 'Doe', 'john@example.com', '08123456789', 'host'),
('uuid-2', 'Jane', 'Smith', 'jane@example.com', '08012345678', 'guest');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
('prop-1', 'uuid-1', 'Lagos Island Apartment', 'Cozy 2-bedroom near the beach', 'Lagos', 25000.00);

-- Bookings
INSERT INTO Booking (booking_id, guest_id, property_id, check_in_date, check_out_date, total_price)
VALUES
('book-1', 'uuid-2', 'prop-1', '2025-07-01', '2025-07-05', 100000.00);

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, status)
VALUES
('pay-1', 'book-1', 100000.00, 'completed');

-- Reviews
INSERT INTO Review (review_id, guest_id, property_id, rating, comment)
VALUES
('rev-1', 'uuid-2', 'prop-1', 5, 'Amazing stay! Very clean and central.');
