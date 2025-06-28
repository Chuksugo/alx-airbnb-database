# ERD Requirements for ALX Airbnb Database Project

## Overview

This document outlines the Entity-Relationship Diagram (ERD) for the Airbnb-like database project. The ERD was designed to model core components of a rental platform such as users, properties, bookings, payments, and reviews. It captures the essential entities, attributes, and relationships needed to support the application's functionality.

## Entities and Attributes

### 1. User
- `user_id` (PK)
- `first_name`
- `last_name`
- `email`
- `phone_number`
- `role` (guest or host)
- `created_at`

### 2. Property
- `property_id` (PK)
- `host_id` (FK → User)
- `name`
- `description`
- `location`
- `price_per_night`
- `created_at`

### 3. Booking
- `booking_id` (PK)
- `guest_id` (FK → User)
- `property_id` (FK → Property)
- `check_in_date`
- `check_out_date`
- `total_price`

### 4. Payment
- `payment_id` (PK)
- `booking_id` (FK → Booking, unique)
- `amount`
- `status`
- `payment_date`

### 5. Review
- `review_id` (PK)
- `guest_id` (FK → User)
- `property_id` (FK → Property)
- `rating`
- `comment`
- `created_at`

## Relationships

| Entity A    | Entity B    | Relationship Type       | Description                        |
|-------------|-------------|--------------------------|------------------------------------|
| User        | Property    | One-to-Many (host)       | A user can list multiple properties |
| User        | Booking     | One-to-Many (guest)      | A user can make multiple bookings  |
| Property    | Booking     | One-to-Many              | A property can have many bookings  |
| Booking     | Payment     | One-to-One               | Each booking has one payment       |
| User        | Review      | One-to-Many (guest)      | A user can write many reviews      |
| Property    | Review      | One-to-Many              | A property can have many reviews   |

## Notes

- All primary keys are UUIDs for uniqueness.
- Foreign key constraints ensure referential integrity.
- Indexes will be added to support performance for location-based and date-based queries.

## Diagram Location

You can find the ERD diagram at:  
📁 `ERD/airbnb_erd.drawio` (or `.png` if exported as an image)

---

This ERD serves as the foundation for database normalization, schema definition, and data population tasks that follow in this project.
