# 🚀 Database Indexing & Performance Optimization

Welcome to the **Index Performance Report** for the Airbnb-style database project. This documentation outlines how SQL indexes were used to significantly improve query performance by targeting high-usage columns in the `User`, `Booking`, and `Property` tables.

---

## 🎯 Objective

✅ Identify frequently queried or joined columns  
✅ Create indexes to optimize performance  
✅ Measure query execution time **before and after indexing** using `EXPLAIN` or `ANALYZE`

---

## 🗂️ Repository Info

- **GitHub Repository:** `alx-airbnb-database`
- **Directory:** `database-adv-script`
- **SQL File:** `database_index.sql`
- **This File:** `index_performance.md`

---

## 🔎 High-Impact Columns Identified

Based on analysis of typical query patterns (joins, filters, ordering), the following columns were targeted:

| 🏷️ Table     | 🔑 Column         | 💡 Reason for Indexing              |
|--------------|-------------------|-------------------------------------|
| `user`       | `id`              | Used in joins and filters           |
| `booking`    | `user_id`         | Joins, filters (e.g., user history) |
| `booking`    | `property_id`     | Joins with property table           |
| `booking`    | `created_at`      | Ordering and date-based filtering   |
| `property`   | `id`              | Primary key for joins               |
| `review`     | `property_id`     | Aggregations and joins              |

---

## 🛠️ Indexes Implemented

The following indexes were added in `database_index.sql`:

```sql
-- Index for fast filtering by user in bookings
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- Index for faster joins between booking and property
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- Index for counting and aggregating reviews per property
CREATE INDEX idx_review_property_id ON review(property_id);

-- Index to optimize sorting and filtering by date
CREATE INDEX idx_booking_created_at ON booking(created_at);
