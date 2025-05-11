-- AirBnB Database Sample Data
-- This SQL script populates the database with sample data for testing and development.

-- Clear existing data (if any) while maintaining foreign key constraints
PRAGMA foreign_keys = OFF;

-- Delete data from tables in reverse order of dependencies
DELETE FROM message;
DELETE FROM review;
DELETE FROM payment;
DELETE FROM booking;
DELETE FROM property;
DELETE FROM user;

-- Re-enable foreign key constraints
PRAGMA foreign_keys = ON;

-- Insert sample users
-- Format: user_id, first_name, last_name, email, password_hash, phone_number, role
INSERT INTO user VALUES ('u1', 'John', 'Doe', 'john.doe@example.com', '$2a$10$Vcef.LXJ8qS/5NvbYiF.nOueAasSD9EA1uQgMZfLztiwhHqYn/Lx.', '123-456-7890', 'guest', CURRENT_TIMESTAMP);
INSERT INTO user VALUES ('u2', 'Jane', 'Smith', 'jane.smith@example.com', '$2a$10$QlVUmfQkLOzKJLc.qYCPZeUZqZOD1hcI1MNrqDSJc0OzYQWEPTUhW', '234-567-8901', 'host', CURRENT_TIMESTAMP);
INSERT INTO user VALUES ('u3', 'Michael', 'Johnson', 'michael.johnson@example.com', '$2a$10$K0RxJtjFxF1ZVL.3CHqAL.3JyC.qmw4zXKgRrS5VmSKOJsPI9RVQW', '345-678-9012', 'host', CURRENT_TIMESTAMP);
INSERT INTO user VALUES ('u4', 'Emily', 'Williams', 'emily.williams@example.com', '$2a$10$FsZt.r9QVuVJL7BzSRKIoOZfwxQIJJMMuDtSB4vzKlxpBl5OEyKVe', '456-789-0123', 'guest', CURRENT_TIMESTAMP);
INSERT INTO user VALUES ('u5', 'David', 'Brown', 'david.brown@example.com', '$2a$10$DfLZP0dEzW3X3pW8LVoJB.9o0zGt71ggUH9S5XL8JYpX8PmUvjXdu', '567-890-1234', 'guest', CURRENT_TIMESTAMP);
INSERT INTO user VALUES ('u6', 'Sarah', 'Miller', 'sarah.miller@example.com', '$2a$10$UmJ8XnVJvIwl0M5L.Lb0r.lqzR3L0S9GMob1tQrTJTLzFvkHnpDTS', '678-901-2345', 'admin', CURRENT_TIMESTAMP);
INSERT INTO user VALUES ('u7', 'James', 'Anderson', 'james.anderson@example.com', '$2a$10$vOwdvL35.DF8KNZEXj7KPeimY2XG9W5UlS5/.1FwHETH2.UMdcmfm', '789-012-3456', 'host', CURRENT_TIMESTAMP);
INSERT INTO user VALUES ('u8', 'Jennifer', 'Thomas', 'jennifer.thomas@example.com', '$2a$10$3JdROw1xTsFH9X3TkHMZVOR3KYm4V0BRQYl.jgZxckIdZ0jWBpgRa', '890-123-4567', 'guest', CURRENT_TIMESTAMP);

-- Insert sample properties
-- Format: property_id, host_id, name, description, location, pricepernight
INSERT INTO property VALUES ('p1', 'u2', 'Cozy Downtown Apartment', 'A beautiful apartment in the heart of the city with stunning views.', 'New York, NY', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO property VALUES ('p2', 'u3', 'Beach House Getaway', 'Relax in this beautiful beach house just steps from the ocean.', 'Miami, FL', 275.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO property VALUES ('p3', 'u7', 'Mountain Cabin Retreat', 'Escape to this peaceful cabin in the mountains with amazing views.', 'Aspen, CO', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO property VALUES ('p4', 'u2', 'Modern Loft in Arts District', 'Stylish loft in a trendy neighborhood with great restaurants nearby.', 'Los Angeles, CA', 180.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO property VALUES ('p5', 'u3', 'Luxury Condo with Pool', 'High-end condo with access to rooftop pool and fitness center.', 'Chicago, IL', 220.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO property VALUES ('p6', 'u7', 'Charming Country Cottage', 'Quaint cottage in a rural setting perfect for a peaceful getaway.', 'Nashville, TN', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample bookings
-- Format: booking_id, property_id, user_id, start_date, end_date, total_price, status
INSERT INTO booking VALUES ('b1', 'p1', 'u1', '2023-06-10', '2023-06-15', 750.00, 'confirmed', CURRENT_TIMESTAMP);
INSERT INTO booking VALUES ('b2', 'p2', 'u4', '2023-07-05', '2023-07-12', 1925.00, 'confirmed', CURRENT_TIMESTAMP);
INSERT INTO booking VALUES ('b3', 'p3', 'u5', '2023-08-15', '2023-08-20', 1000.00, 'pending', CURRENT_TIMESTAMP);
INSERT INTO booking VALUES ('b4', 'p4', 'u8', '2023-06-20', '2023-06-25', 900.00, 'confirmed', CURRENT_TIMESTAMP);
INSERT INTO booking VALUES ('b5', 'p5', 'u1', '2023-09-01', '2023-09-05', 880.00, 'canceled', CURRENT_TIMESTAMP);
INSERT INTO booking VALUES ('b6', 'p6', 'u4', '2023-07-15', '2023-07-20', 600.00, 'confirmed', CURRENT_TIMESTAMP);
INSERT INTO booking VALUES ('b7', 'p1', 'u5', '2023-10-10', '2023-10-15', 750.00, 'pending', CURRENT_TIMESTAMP);
INSERT INTO booking VALUES ('b8', 'p3', 'u8', '2023-11-22', '2023-11-26', 800.00, 'confirmed', CURRENT_TIMESTAMP);

-- Insert sample payments
-- Format: payment_id, booking_id, amount, payment_method
INSERT INTO payment VALUES ('pay1', 'b1', 750.00, CURRENT_TIMESTAMP, 'credit_card');
INSERT INTO payment VALUES ('pay2', 'b2', 1925.00, CURRENT_TIMESTAMP, 'paypal');
INSERT INTO payment VALUES ('pay3', 'b4', 900.00, CURRENT_TIMESTAMP, 'credit_card');
INSERT INTO payment VALUES ('pay4', 'b5', 880.00, CURRENT_TIMESTAMP, 'stripe');
INSERT INTO payment VALUES ('pay5', 'b6', 600.00, CURRENT_TIMESTAMP, 'paypal');
INSERT INTO payment VALUES ('pay6', 'b8', 800.00, CURRENT_TIMESTAMP, 'credit_card');

-- Insert sample reviews
-- Format: review_id, property_id, user_id, rating, comment
INSERT INTO review VALUES ('r1', 'p1', 'u1', 5, 'Amazing place! Perfect location and very clean.', CURRENT_TIMESTAMP);
INSERT INTO review VALUES ('r2', 'p2', 'u4', 4, 'Great beach house, just a short walk to the ocean. Could use more kitchen supplies.', CURRENT_TIMESTAMP);
INSERT INTO review VALUES ('r3', 'p4', 'u8', 5, 'Stylish loft in a perfect location. Highly recommend!', CURRENT_TIMESTAMP);
INSERT INTO review VALUES ('r4', 'p6', 'u4', 4, 'Peaceful and charming. The perfect weekend getaway.', CURRENT_TIMESTAMP);
INSERT INTO review VALUES ('r5', 'p3', 'u8', 5, 'Breathtaking views and cozy interior. Will definitely come back!', CURRENT_TIMESTAMP);
INSERT INTO review VALUES ('r6', 'p5', 'u1', 3, 'Nice condo but noisy neighbors during our stay.', CURRENT_TIMESTAMP);

-- Insert sample messages
-- Format: message_id, sender_id, recipient_id, message_body, sent_at
INSERT INTO message VALUES ('m1', 'u1', 'u2', 'Hi, is the downtown apartment available for early check-in?', CURRENT_TIMESTAMP);
INSERT INTO message VALUES ('m2', 'u2', 'u1', 'Yes, you can check in at noon instead of 3 PM. Looking forward to hosting you!', CURRENT_TIMESTAMP);
INSERT INTO message VALUES ('m3', 'u4', 'u3', 'Is there parking available at the beach house?', CURRENT_TIMESTAMP);
INSERT INTO message VALUES ('m4', 'u3', 'u4', 'Yes, there\'s a private parking spot right in front of the house.', CURRENT_TIMESTAMP);
INSERT INTO message VALUES ('m5', 'u5', 'u7', 'Do you allow pets in the mountain cabin?', CURRENT_TIMESTAMP);
INSERT INTO message VALUES ('m6', 'u7', 'u5', 'Sorry, we don\'t allow pets due to allergies of other guests.', CURRENT_TIMESTAMP);
INSERT INTO message VALUES ('m7', 'u8', 'u7', 'Is there Wi-Fi available at the cottage?', CURRENT_TIMESTAMP);
INSERT INTO message VALUES ('m8', 'u7', 'u8', 'Yes, high-speed Wi-Fi is available. The password will be in the welcome packet.', CURRENT_TIMESTAMP);
INSERT INTO message VALUES ('m9', 'u1', 'u3', 'What amenities are included with the luxury condo?', CURRENT_TIMESTAMP);
INSERT INTO message VALUES ('m10', 'u3', 'u1', 'The condo includes access to the pool, gym, spa, and 24-hour concierge service.', CURRENT_TIMESTAMP); 