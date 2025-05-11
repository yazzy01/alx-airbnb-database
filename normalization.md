# Database Normalization

This document explains the normalization process applied to the AirBnB database schema to ensure it meets the Third Normal Form (3NF) requirements.

## Normalization Overview

Database normalization is a process of organizing database tables to minimize redundancy and dependency. The goal is to achieve data integrity and reduce storage space while maintaining the relationships between data points.

## Normal Forms

### First Normal Form (1NF)
- Each table has a primary key
- No repeating groups or arrays
- Each column contains atomic (indivisible) values

### Second Normal Form (2NF)
- Database is in 1NF
- All non-key attributes are fully dependent on the primary key

### Third Normal Form (3NF)
- Database is in 2NF
- No transitive dependencies (non-key attributes dependent on other non-key attributes)

## Analysis of Current Schema

Our database schema consists of six main entities: User, Property, Booking, Payment, Review, and Message. Let's analyze each entity for compliance with normalization principles:

### 1. User Table
- **Primary Key**: user_id (UUID)
- **Attributes**: first_name, last_name, email, password_hash, phone_number, role, created_at
- **Analysis**: Each attribute depends directly on the primary key user_id. No transitive dependencies exist.
- **Normalization Status**: Already in 3NF

### 2. Property Table
- **Primary Key**: property_id (UUID)
- **Foreign Key**: host_id (references User.user_id)
- **Attributes**: name, description, location, pricepernight, created_at, updated_at
- **Analysis**: All attributes depend directly on the primary key property_id. The host_id is a foreign key establishing a relationship with the User table.
- **Normalization Status**: Already in 3NF

### 3. Booking Table
- **Primary Key**: booking_id (UUID)
- **Foreign Keys**: property_id (references Property.property_id), user_id (references User.user_id)
- **Attributes**: start_date, end_date, total_price, status, created_at
- **Analysis**: 
  - The total_price might be calculated based on property price and booking duration. However, storing it directly is justified for historical record purposes, as property prices may change over time.
  - All attributes depend directly on the primary key booking_id.
- **Normalization Status**: Already in 3NF

### 4. Payment Table
- **Primary Key**: payment_id (UUID)
- **Foreign Key**: booking_id (references Booking.booking_id)
- **Attributes**: amount, payment_date, payment_method
- **Analysis**: All attributes depend directly on the primary key payment_id. The booking_id establishes a relationship with the Booking table.
- **Normalization Status**: Already in 3NF

### 5. Review Table
- **Primary Key**: review_id (UUID)
- **Foreign Keys**: property_id (references Property.property_id), user_id (references User.user_id)
- **Attributes**: rating, comment, created_at
- **Analysis**: All attributes depend directly on the primary key review_id. The foreign keys establish relationships with the Property and User tables.
- **Normalization Status**: Already in 3NF

### 6. Message Table
- **Primary Key**: message_id (UUID)
- **Foreign Keys**: sender_id (references User.user_id), recipient_id (references User.user_id)
- **Attributes**: message_body, sent_at
- **Analysis**: All attributes depend directly on the primary key message_id. The foreign keys establish relationships with the User table (for both sender and recipient).
- **Normalization Status**: Already in 3NF

## Potential Improvements

While our database schema is already normalized to 3NF, here are some potential improvements that could be considered:

### 1. Location Information

The Property table has a location field as a VARCHAR. If detailed location information is needed (country, state, city, address, zip code), it might be better to:

1. Create a separate `Locations` table with:
   - location_id (Primary Key)
   - country
   - state/province
   - city
   - street_address
   - zip_code
   - coordinates (latitude, longitude)

2. Update the Property table to reference location_id instead of having a location VARCHAR field.

This would allow for better querying, sorting, and filtering of properties by location components.

### 2. Property Amenities

If properties have various amenities (WiFi, pool, parking, etc.), a many-to-many relationship would be appropriate:

1. Create an `Amenities` table:
   - amenity_id (Primary Key)
   - name
   - description

2. Create a `PropertyAmenities` junction table:
   - property_id (Foreign Key)
   - amenity_id (Foreign Key)

This approach prevents repeating amenity information and allows for filtering properties by amenities.

## Conclusion

The current AirBnB database schema is already normalized to the Third Normal Form (3NF). All tables have appropriate primary keys, contain no repeating groups, and have no transitive dependencies. 

The schema effectively maintains the relationships between entities while minimizing redundancy and dependency issues. The suggested improvements are optional enhancements that could be implemented based on specific business requirements, but they aren't necessary for achieving 3NF compliance. 