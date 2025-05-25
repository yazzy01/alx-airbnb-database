# Advanced SQL Queries

This directory contains SQL scripts demonstrating advanced SQL query techniques.

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

## subqueries.sql

This file contains SQL queries demonstrating different types of subqueries:

### 1. Non-correlated Subquery
- **Purpose**: Finds all properties where the average rating is greater than 4.0
- **Tables Used**: `Property` and `Review`
- **Approach**: Uses a subquery in the WHERE clause with the IN operator
- **Result**: Returns properties that meet the rating criteria

### 2. Correlated Subquery
- **Purpose**: Finds users who have made more than 3 bookings
- **Tables Used**: `User` and `Booking`
- **Approach**: Uses a correlated subquery that references the outer query
- **Result**: Returns users who meet the booking count criteria

## aggregations_and_window_functions.sql

This file contains SQL queries demonstrating aggregation functions and window functions:

### 1. Aggregation with GROUP BY
- **Purpose**: Finds the total number of bookings made by each user
- **Tables Used**: `User` and `Booking`
- **Functions Used**: COUNT, GROUP BY
- **Result**: Returns each user with their total booking count

### 2. Window Functions
- **Purpose**: Ranks properties based on the total number of bookings they have received
- **Tables Used**: `Property` and `Booking`
- **Functions Used**: COUNT, ROW_NUMBER, RANK
- **Result**: Returns properties with their booking counts and rankings
- **Note**: Demonstrates the difference between ROW_NUMBER (unique sequential numbers) and RANK (same rank for ties)

## database_index.sql

This file contains SQL commands to create indexes for optimizing query performance:

### 1. User Table Indexes
- **Columns**: email, role
- **Purpose**: Optimize user lookups and filtering

### 2. Property Table Indexes
- **Columns**: host_id, location, pricepernight
- **Purpose**: Optimize property searches and joins

### 3. Booking Table Indexes
- **Columns**: property_id, user_id, status, start_date, end_date
- **Purpose**: Optimize booking lookups and date range queries

### 4. Review and Payment Table Indexes
- **Columns**: Various foreign keys and frequently filtered columns
- **Purpose**: Optimize related table operations

## index_performance.md

This document analyzes the performance improvements achieved by adding indexes:

- Identifies high-usage columns in the database
- Provides before/after performance measurements
- Quantifies the performance improvements
- Offers recommendations for index management

## perfomance.sql

This file contains complex queries demonstrating query optimization:

### 1. Original Complex Query
- **Purpose**: Retrieves all bookings with user, property, host, payment, and review details
- **Tables Used**: `Booking`, `User` (twice), `Property`, `Payment`, `Review`
- **Performance**: Shows the execution plan and performance of the unoptimized query

### 2. Optimized Query
- **Purpose**: Retrieves essential booking information with improved performance
- **Tables Used**: `Booking`, `User`, `Property`, `Payment`
- **Optimizations**: Reduces joins, selects only necessary columns, leverages indexes
- **Performance**: Shows the execution plan and improved performance metrics

## optimization_report.md

This document provides a detailed analysis of query optimization:

- Identifies performance issues in the original complex query
- Explains the optimization strategies implemented
- Quantifies the performance improvements
- Provides additional recommendations for further optimization

## Usage

These queries and indexes can be executed against the AirBnB database to analyze relationships between entities, extract specific insights from the data, and optimize database performance. 