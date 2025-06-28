# Normalization Steps

## 1NF
- Ensured that all attributes hold atomic values. No repeating groups.
  - e.g., `phone_number` is a single value, not multiple numbers in one field.

## 2NF
- Removed partial dependencies. All non-key attributes depend on the full primary key.
  - In `Booking`, `check_in_date`, `check_out_date`, and `total_price` depend fully on `booking_id`.

## 3NF
- Eliminated transitive dependencies.
  - Moved payment details to a separate `Payment` table to avoid storing them in `Booking`.

All tables now satisfy 3NF.
