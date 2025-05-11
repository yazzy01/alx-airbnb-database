# AirBnB Database Sample Data

This directory contains SQL scripts to populate the AirBnB database with sample data for testing and development purposes.

## Overview

The `seed.sql` file inserts realistic sample data for all tables in the database:

- 8 users with different roles (guests, hosts, admin)
- 6 properties of various types and locations
- 8 bookings with different statuses
- 6 payments using different payment methods
- 6 reviews with varied ratings
- 10 messages between users

## Data Structure

### Users
The sample data includes a mix of guests, hosts, and administrators:
- 4 guests (including John Doe, Emily Williams)
- 3 hosts (including Jane Smith, Michael Johnson)
- 1 admin (Sarah Miller)

### Properties
The properties represent different types of accommodations in various locations:
- Apartments and lofts in urban areas
- Beach houses and mountain cabins
- Luxury condos and country cottages

Prices range from $120 to $275 per night, reflecting market diversity.

### Bookings
The booking data shows:
- Different status values (confirmed, pending, canceled)
- Various date ranges
- Multiple bookings for some properties
- Different guests making reservations

### Payments
Payment records correspond to confirmed bookings and show:
- Different payment methods (credit card, PayPal, Stripe)
- Payment amounts matching booking total prices
- Not all bookings have associated payments (e.g., pending bookings)

### Reviews
The review data demonstrates:
- Ratings ranging from 3 to 5 stars
- Detailed comments about the stay experience
- Only properties with completed stays have reviews

### Messages
The message data illustrates communication between users:
- Pre-booking inquiries
- Questions about property amenities
- Check-in coordination
- Conversation threads between the same users

## Using the Seed Data

To populate the database with this sample data:

1. First ensure you have created the database schema using the SQL script from the `database-script-0x01` directory
2. Then run this seed script:

   For SQLite:
   ```
   sqlite3 airbnb.db < seed.sql
   ```

   For MySQL/MariaDB:
   ```
   mysql -u username -p database_name < seed.sql
   ```

## Notes

- The script first clears any existing data to ensure a clean state
- UUIDs are simplified as short strings for readability (e.g., 'u1', 'p1', 'b1')
- Password hashes are dummy bcrypt-format strings (not actual valid passwords)
- All timestamps use `CURRENT_TIMESTAMP` for simplicity
- The script temporarily disables foreign key constraints during deletion to avoid constraint violations 