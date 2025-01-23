-- SQLite: Beginner Level


-- 1.List all the airlines in the database.
SELECT * FROM Airlines;


-- 2. Find all airports located in the United States
SELECT * FROM Countries;

-- For United States, country_id = 1
SELECT * FROM Airports WHERE country_id = 1;


-- 3. Get the details of passengers who have an email ending with "@example.com"

SELECT * FROM Passengers WHERE email LIKE '%@email.com';


-- 4. How many different payment methods are available in the database?

SELECT COUNT(*) FROM PaymentType;


--5. List the flight details for all flights departing on 2025-02-01.

SELECT * FROM Flights WHERE DATE(departure_time) = '2025-02-01';


-- 6. Find all the bookings where the payment status is 'Success'

SELECT * FROM Payments WHERE payment_status = 'Success' ;


-- 7. Get the list of all passengers who were born after 1992

SELECT * FROM Passengers WHERE dob >= '1992-01-01';

-- 8. Get the total amount spent for booking_id = 1

-- Query 1
SELECT SUM(payment_amount) AS "Total Amount" FROM Payments WHERE booking_id = 1;

-- Query 2
SELECT total_amount AS "Total Amount" FROM Bookings WHERE booking_id = 1;


-- 9. List the payment methods used for booking_id = 7

SELECT pt.pm_type AS "Payment Methods" FROM Payments p
INNER JOIN PaymentType pt ON p.pm_id = pt.pm_id
WHERE p.booking_id = 7;


-- 10. Show the class and seat price for all passengers in booking_id = 5

SELECT ts.seat_number, ct.class_name, ts.price FROM TicketSeats ts
INNER JOIN ClassType ct ON ts.class_id = ct.class_id
WHERE ts.booking_id = 5;