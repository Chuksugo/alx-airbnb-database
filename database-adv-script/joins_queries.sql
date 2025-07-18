-- 1. INNER JOIN: Retrieve all bookings and the users who made them
SELECT 
    BOOKING.ID AS BOOKING_ID,
    BOOKING.PROPERTY_ID,
    BOOKING.USER_ID,
    USER.NAME AS USER_NAME
FROM 
    BOOKING
INNER JOIN 
    USER ON BOOKING.USER_ID = USER.ID
ORDER BY 
    BOOKING.ID ASC;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
SELECT 
    PROPERTY.ID AS PROPERTY_ID,
    PROPERTY.HOST_ID,
    REVIEW.ID AS REVIEW_ID,
    REVIEW.USER_ID AS REVIEWER_ID
FROM 
    PROPERTY
LEFT JOIN 
    REVIEW ON PROPERTY.ID = REVIEW.PROPERTY_ID
ORDER BY 
    PROPERTY.ID ASC;

-- 3. FULL OUTER JOIN Retrieve all users and all bookings (MySQL-compatible using UNION)
SELECT 
    USER.ID AS USER_ID,
    USER.NAME,
    BOOKING.ID AS BOOKING_ID,
    BOOKING.PROPERTY_ID
FROM 
    USER
LEFT JOIN 
    BOOKING ON BOOKING.USER_ID = USER.ID

UNION

SELECT 
    USER.ID AS USER_ID,
    USER.NAME,
    BOOKING.ID AS BOOKING_ID,
    BOOKING.PROPERTY_ID
FROM 
    BOOKING
LEFT JOIN 
    USER ON BOOKING.USER_ID = USER.ID
ORDER BY 
    USER_ID ASC;
