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
