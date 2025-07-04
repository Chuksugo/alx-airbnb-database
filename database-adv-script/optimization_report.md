# 🚀 Query Optimization Report

This report describes the process of optimizing a complex SQL query in the Airbnb-style database.

---

## 🎯 Objective

Optimize a query that joins multiple tables: `booking`, `user`, `property`, and `payment`.

---

## 🔍 Original Query Overview

The initial query fetched all bookings along with:

- User details (`user.id`, `user.name`)
- Property details (`property.id`, `property.name`)
- Payment details (`payment.amount`, `payment.status`)
- Booking timestamp

It performed 3 joins across 4 tables.

---

## ⚙️ Performance Analysis with EXPLAIN

Before optimization, the query plan showed:

- **Sequential scans** on large tables like `booking` and `payment`
- **Nested loop joins** causing slowness at scale
- No use of indexes for join conditions (`user_id`, `property_id`, `booking_id`)

---

## ✅ Optimization Steps

1. **Created indexes** on:
   - `booking.user_id`
   - `booking.property_id`
   - `payment.booking_id`

2. **Reduced selected columns** to only those required in the result.

3. **Applied table aliases** to improve readability.

4. **Refactored query** to reduce memory usage and simplify the plan.

---

## 📈 Result

After refactoring:
- The query used **Index Scans** instead of full-table scans.
- **Execution time was reduced significantly**.
- The final query is easier to maintain and scales better with large datasets.

---

## 📁 Files

- `perfomance.sql`: Contains original, EXPLAIN, and optimized queries.
- `database_index.sql`: Contains all supporting indexes.
- `optimization_report.md`: This report.

---

## 👨‍💻 Author

Prepared as part of the ALX Backend Advanced SQL module.
