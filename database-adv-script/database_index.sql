-- Indexes for User table
-- Index on email for fast user lookups and authentication
CREATE INDEX idx_user_email ON User(email);

-- Index on role for filtering users by role (guest, host, admin)
CREATE INDEX idx_user_role ON User(role);

-- Indexes for Property table
-- Index on host_id for fast lookups of properties by host
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index on location for geographical searches
CREATE INDEX idx_property_location ON Property(location);

-- Index on pricepernight for price range filtering
CREATE INDEX idx_property_price ON Property(pricepernight);

-- Indexes for Booking table
-- Index on property_id for fast lookups of bookings by property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on user_id for fast lookups of bookings by user
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on status for filtering bookings by status
CREATE INDEX idx_booking_status ON Booking(status);

-- Composite index on start_date and end_date for date range queries
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Indexes for Review table
-- Index on property_id for fast lookups of reviews by property
CREATE INDEX idx_review_property_id ON Review(property_id);

-- Index on user_id for fast lookups of reviews by user
CREATE INDEX idx_review_user_id ON Review(user_id);

-- Index on rating for filtering reviews by rating
CREATE INDEX idx_review_rating ON Review(rating);

-- Indexes for Payment table
-- Index on booking_id for fast lookups of payments by booking
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Index on payment_method for filtering payments by method
CREATE INDEX idx_payment_method ON Payment(payment_method); 