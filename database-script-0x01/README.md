# 🏡 ALX Airbnb Database Schema

This project defines the relational database schema for an Airbnb-like platform. It includes tables for users, properties, bookings, payments, and reviews, ensuring proper normalization, integrity, and performance through constraints and indexing.

---

## 📦 Overview

The database supports the core functionalities of an Airbnb-style application:

- **Users** can be guests or hosts.
- **Hosts** can list **properties**.
- **Guests** can **book** properties.
- **Payments** are recorded for each booking.
- **Reviews** allow guests to rate properties.

---

## 🧱 Full SQL Schema

Below is the complete SQL schema used to create the core tables and indexes in the Airbnb-like database system.

```sql
-- User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) CHECK (role IN ('guest', 'host')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL REFERENCES User(user_id),
    name VARCHAR(150) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    price_per_night DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    guest_id UUID NOT NULL REFERENCES User(user_id),
    property_id UUID NOT NULL REFERENCES Property(property_id),
    check_in_date DATE,
    check_out_date DATE,
    total_price DECIMAL(10,2)
);

-- Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID UNIQUE NOT NULL REFERENCES Booking(booking_id),
    amount DECIMAL(10,2),
    status VARCHAR(20) CHECK (status IN ('pending', 'completed', 'failed')),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    guest_id UUID NOT NULL REFERENCES User(user_id),
    property_id UUID NOT NULL REFERENCES Property(property_id),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_booking_dates ON Booking(check_in_date, check_out_date);
