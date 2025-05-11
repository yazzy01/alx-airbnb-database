# AirBnB Database Schema

This directory contains the SQL scripts for creating the AirBnB database schema.

## Overview

The schema.sql file defines the database structure for an AirBnB-like application, consisting of six main entities:

1. **User**: Stores user information (both guests and hosts)
2. **Property**: Contains details about properties available for booking
3. **Booking**: Tracks reservations made by users for properties
4. **Payment**: Records payment information for bookings
5. **Review**: Stores user reviews for properties
6. **Message**: Facilitates communication between users

## Database Schema Details

### Tables Structure

#### User Table
- Primary Key: `user_id` (UUID)
- Key Fields: `email` (unique), `role` (enum)
- The user table stores information about all users in the system, whether they are guests, hosts, or administrators.

#### Property Table
- Primary Key: `property_id` (UUID)
- Foreign Key: `host_id` references User table
- Stores all property listings with details like name, description, location, and price.

#### Booking Table
- Primary Key: `booking_id` (UUID)
- Foreign Keys: `property_id` and `user_id`
- Contains information about reservations, including dates and status.
- Includes a check constraint to ensure end_date is after start_date.

#### Payment Table
- Primary Key: `payment_id` (UUID)
- Foreign Key: `booking_id` references Booking table
- Tracks all payment transactions related to bookings.

#### Review Table
- Primary Key: `review_id` (UUID)
- Foreign Keys: `property_id` and `user_id`
- Contains ratings and comments from users about properties.
- Includes a check constraint to ensure ratings are between 1 and 5.

#### Message Table
- Primary Key: `message_id` (UUID)
- Foreign Keys: `sender_id` and `recipient_id` (both reference User table)
- Facilitates communication between users in the system.

### Indices

The schema includes the following indices for performance optimization:

- `idx_user_email`: Enables faster user lookup by email
- `idx_property_host`: Optimizes queries for finding a host's properties
- `idx_booking_property` and `idx_booking_user`: Speed up booking lookups by property or user
- `idx_booking_dates`: Optimizes availability searches
- `idx_booking_status`: Supports filtering bookings by status
- `idx_payment_booking`: Optimizes queries joining payments with bookings
- `idx_review_property` and `idx_review_user`: Accelerate review lookups
- `idx_message_sender`, `idx_message_recipient`, and `idx_message_conversation`: Support efficient message queries

## Usage

To create the database schema:

1. Connect to your MySQL/MariaDB server
2. Run the schema.sql script:
   ```
   mysql -u username -p database_name < schema.sql
   ```

For SQLite:
   ```
   sqlite3 airbnb.db < schema.sql
   ```

## Data Types and Constraints

- UUID fields are implemented as VARCHAR(36)
- Text fields have appropriate length limits
- Proper constraints ensure data integrity:
  - Foreign key constraints with CASCADE delete behavior
  - Check constraints for valid date ranges and rating values
  - Unique constraints on fields like email
  - Non-null constraints on required fields

## Notes

- The script includes `DROP TABLE` statements to facilitate clean rebuilds
- Tables are created in the proper order to respect foreign key constraints
- `ON UPDATE CURRENT_TIMESTAMP` is used for the `updated_at` timestamp field in the Property table
- The script uses `ENUM` types for fields with predefined values, such as role and status 