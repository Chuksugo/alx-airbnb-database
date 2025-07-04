# SQL Joins Practice: Airbnb-Style ERD

This project is designed to help you master SQL JOINs using an Airbnb-style relational database. It focuses on understanding and applying different types of JOINs: INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.

---

## 📌 Objective

Learn to write complex SQL queries using various types of joins to explore relationships between entities in a normalized database.

---

## 🗂️ Entity Relationship Diagram (ERD)

The database is modeled with four main entities:

- **User** – Represents a user of the platform (host or guest).
- **Property** – Represents a property listed by a user (host).
- **Booking** – Represents a booking made by a user (guest).
- **Review** – Represents a review written by a user for a property.

### 🔗 Key Relationships

- A **User** can list many **Properties**
- A **User** can make many **Bookings**
- A **Property** can have many **Bookings**
- A **User** can write many **Reviews**
- A **Property** can have many **Reviews**

These relationships are visualized in an ERD using **Crow’s Foot Notation**, which illustrates one-to-many relationships between entities.

---

## 🧠 Join Types Covered

- **INNER JOIN**: Returns only records with matching values in both tables.
- **LEFT JOIN**: Returns all records from the left table and the matched records from the right table.
- **FULL OUTER JOIN**: Returns all records when there is a match in either the left or right table. (Simulated in MySQL using `UNION`.)

---

## 📁 Project Structure

- `README.md` – Project documentation
- `diagram.png` – Visual ERD (Crow’s Foot Notation)
- `queries.sql` – SQL JOIN queries based on the schema (optional)

---

## 📝 Notes

- This exercise is based on a simplified Airbnb-like system.
- It assumes foreign key relationships between the entities as shown in the ERD.
- Great for practicing database joins, normalization, and ER modeling.

---

## 🙌 Author

Created as a SQL learning project based on relational database design principles.

# SQL Subqueries – Airbnb-Style Data Analysis

This project demonstrates how to write **correlated** and **non-correlated subqueries** using an Airbnb-style relational database. It is part of the advanced SQL scripting tasks under the `alx-airbnb-database` repository.

---

## 📌 Objective

- Write **non-correlated subqueries** to filter results using computed aggregates.
- Write **correlated subqueries** that depend on data from the outer query.

---

## 🗂️ Project Structure

**Repository:** `alx-airbnb-database`  
**Directory:** `database-adv-script`  
**Files:**
- `subqueries.sql` – Contains the SQL queries using subqueries.
- `README.md` – Project documentation.

---

## 🧠 Concepts Practiced

### 🔹 Non-Correlated Subquery

Find all properties where the **average rating is greater than 4.0**.

- The subquery calculates the average rating for each property.
- The main query filters properties based on this value.
- Executed independently of the outer query.

---

### 🔹 Correlated Subquery

Find all users who have made **more than 3 bookings**.

- The subquery counts bookings for each user.
- It references the outer query (`USER.ID`) inside the subquery.
- Executed once for each user in the outer query.

---

## 🗃️ Tables Involved

- `User` – Users on the platform.
- `Property` – Listings created by users.
- `Review` – User-submitted property reviews (with ratings).
- `Booking` – Reservations made by users.

---

## 📌 Notes

- Subqueries allow for powerful filtering and comparisons.
- Correlated subqueries can be slower, but allow row-wise evaluation.
- Average rating is assumed to be in a column like `REVIEW.RATING`.

---

## 🧑‍💻 Author

This project was created for the ALX Backend Advanced SQL module.ls


# SQL Aggregation & Window Functions – Airbnb-style Data Analysis

This project demonstrates how to use SQL aggregation and window functions to analyze booking data from an Airbnb-style database schema. The focus is on counting bookings per user and ranking properties by popularity.

---

## 📌 Objective

- Use **SQL aggregation** with `COUNT()` and `GROUP BY` to summarize data.
- Use **SQL window functions** like `RANK()` or `ROW_NUMBER()` to perform ranking analysis across rows.

---

## 🗂️ Database Schema Overview

The database contains the following core entities:

- **User**: Represents users (hosts or guests).
- **Property**: Represents listings created by users.
- **Booking**: Represents bookings made by users on properties.

Relationships:

- A **User** can make many **Bookings**
- A **Property** can receive many **Bookings**
- Each **Booking** is linked to one **User** and one **Property**

---

## 🔍 SQL Tasks

### 1. Total Number of Bookings per User

- Aggregates the number of bookings made by each user.
- Uses `COUNT()` and `GROUP BY` to summarize data.
- Includes users with zero bookings using a `LEFT JOIN`.

### 2. Rank Properties by Total Bookings

- Ranks all properties by the number of bookings they've received.
- Uses a window function (`RANK()` or `ROW_NUMBER()`) with an `OVER` clause.
- Includes properties with zero bookings using a `LEFT JOIN`.

---

## 📋 File Structure

- `README.md` – Documentation of the project
- `aggregations_and_ranking.sql` – SQL script containing:
  - Query for total bookings per user
  - Query to rank properties based on booking volume
- `diagram.png` – (Optional) ERD illustrating entity relationships

---

## 📝 Notes

- These queries assume the following foreign keys:
  - `BOOKING.USER_ID → USER.ID`
  - `BOOKING.PROPERTY_ID → PROPERTY.ID`
- Window functions are evaluated after aggregation (`GROUP BY`).
- `RANK()` gives tied properties the same rank; use `ROW_NUMBER()` for unique ranking.

---

## 👨‍💻 Author

Created as part of a SQL practice module on data analysis using aggregation and window functions.
