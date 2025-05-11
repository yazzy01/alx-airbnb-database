# ALX AirBnB Database Project

## Overview
This repository contains the database design and implementation for an AirBnB-like application. The database is designed to support the core functionalities of a property rental platform, including user management, property listings, bookings, payments, reviews, and messaging.

## Contents
- [ERD](./ERD/): Entity-Relationship Diagram and database specifications
  - [requirements.md](./ERD/requirements.md): Detailed specifications for the database entities and relationships
  - [ERD.png](./ERD/ERD.png): Visual representation of the database schema

## Database Structure
The database consists of 6 main entities:
1. **User**: Stores information about users (guests, hosts, admins)
2. **Property**: Contains details of properties available for booking
3. **Booking**: Records booking information for properties
4. **Payment**: Tracks payment details for bookings
5. **Review**: Stores reviews left by users for properties
6. **Message**: Facilitates communication between users

## Schema Design
The database schema is designed with appropriate relationships between entities, including:
- One-to-many relationships (e.g., User-to-Property, Property-to-Booking)
- Foreign key constraints to maintain referential integrity
- Appropriate indices for performance optimization

For full details on the database schema, refer to the [requirements.md](./ERD/requirements.md) file. 