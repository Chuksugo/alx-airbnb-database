# 🚀 Partitioning for Performance – Booking Table

This report explains how we improved query performance on a large `booking` table by using **table partitioning** based on `start_date`.

---

## 🎯 Objective

- Improve query speed on a large `booking` table.
- Partition the table by year using the `start_date` column.
- Test performance for date-based queries.

---

## 🛠️ Implementation Summary

1. Recreated the `booking` table with **RANGE partitioning** on `start_date`.
2. Created partitions:
   - `booking_2023`: For 2023
   - `booking_2024`: For 2024
   - `booking_2025`: For 2025
3. Indexed `start_date` on relevant partitions.
4. Ran date-based queries using `EXPLAIN ANALYZE`.

---

## ⚡ Performance Testing

### Query:

```sql
SELECT * FROM booking
WHERE start_date BETWEEN '2025-06-01' AND '2025-07-01';

## 📊 Observed Improvements

| Metric                | Before Partitioning     | After Partitioning       |
|-----------------------|--------------------------|---------------------------|
| Table scanned         | Entire `booking` table   | Only `booking_2025`       |
| Query execution type  | Full sequential scan     | Index scan on partition   |
| Performance           | Slower                   | Significantly faster       |
| Resource usage        | High                     | Low                       |
