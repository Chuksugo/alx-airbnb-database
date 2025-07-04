SELECT 
    BOOKING.ID AS BOOKING_ID,
    BOOKING.PROPERTY_ID,
    BOOKING.USER_ID,
    USER.NAME AS USER_NAME
FROM 
    BOOKING
INNER JOIN 
    USER ON BOOKING.USER_ID = USER.ID;
-- This query retrieves booking details along with the user's name by joining the BOOKING and USER tables.



SELECT 
    PROPERTY.ID AS PROPERTY_ID,
    PROPERTY.HOST_ID,
    REVIEW.ID AS REVIEW_ID,
    REVIEW.USER_ID AS REVIEWER_ID
FROM 
    PROPERTY
LEFT JOIN 
    REVIEW ON PROPERTY.ID = REVIEW.PROPERTY_ID;
-- This query retrieves property details along with any associated reviews, including properties without reviews, by using a LEFT JOIN between the PROPERTY and REVIEW tables.



SELECT 
    USER.ID AS USER_ID,
    USER.NAME,
    BOOKING.ID AS BOOKING_ID,
    BOOKING.PROPERTY_ID
FROM 
    USER
FULL OUTER JOIN 
    BOOKING ON BOOKING.USER_ID = USER.ID;
-- This query retrieves all users and their bookings, including users without bookings and bookings without associated users, by using a FULL OUTER JOIN between the USER and BOOKING tables.



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
    USER ON BOOKING.USER_ID = USER.ID;
-- This query retrieves all users and their bookings, including users without bookings and bookings without associated users, by using a UNION of LEFT JOINs between the USER and BOOKING tables.