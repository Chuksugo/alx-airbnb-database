-- 1. Non-correlated subquery:
-- Find all properties where the average rating is greater than 4.0

SELECT 
    PROPERTY.ID,
    PROPERTY.HOST_ID,
    PROPERTY.NAME
FROM 
    PROPERTY
WHERE 
    PROPERTY.ID IN (
        SELECT 
            REVIEW.PROPERTY_ID
        FROM 
            REVIEW
        GROUP BY 
            REVIEW.PROPERTY_ID
        HAVING 
            AVG(REVIEW.RATING) > 4.0
    )
ORDER BY 
    PROPERTY.ID ASC;



-- 2. Correlated subquery:
-- Find all users who have made more than 3 bookings

SELECT 
    USER.ID,
    USER.NAME
FROM 
    USER
WHERE 
    (
        SELECT COUNT(*) 
        FROM BOOKING 
        WHERE BOOKING.USER_ID = USER.ID
    ) > 3
ORDER BY 
    USER.ID ASC;
