# Advanced SQL Queries - Joins

This directory contains SQL scripts demonstrating different types of JOIN operations in SQL.

## joins_queries.sql

This file contains three SQL queries showcasing different JOIN types:

### 1. INNER JOIN
- **Purpose**: Retrieves all bookings and the respective users who made those bookings
- **Tables Used**: `Booking` and `User`
- **Join Condition**: `b.user_id = u.user_id`
- **Result**: Only returns records where there is a match in both tables

### 2. LEFT JOIN
- **Purpose**: Retrieves all properties and their reviews, including properties that have no reviews
- **Tables Used**: `Property` and `Review`
- **Join Condition**: `p.property_id = r.property_id`
- **Result**: Returns all properties and any matching reviews; properties without reviews will have NULL values for review columns

### 3. FULL OUTER JOIN
- **Purpose**: Retrieves all users and all bookings, even if the user has no booking or a booking is not linked to a user
- **Tables Used**: `User` and `Booking`
- **Join Condition**: `u.user_id = b.user_id`
- **Result**: Returns all records from both tables; NULL values appear where there is no match

## Usage

These queries can be executed against the AirBnB database to analyze relationships between entities. 