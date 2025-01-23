-- SQLite: Intermediate Level


-- 1. Find all flights that have been delayed.

SELECT * FROM Flights WHERE flight_status = 'Delayed';


-- 2. Get the count of flights for each airline.

SELECT al.airline_name AS "Airline", COUNT(*) AS "Flights" FROM Flights fl
INNER JOIN Airlines al ON fl.airline_id = al.airline_id
GROUP BY al.airline_id;


-- 3. Get the count of bookings for each airline.

SELECT al.airline_name AS "Airline", COUNT(*) AS "Bookings" FROM Flights fl
INNER JOIN Bookings b ON fl.flight_id = b.flight_id
INNER JOIN Airlines al ON fl.airline_id = al.airline_id
GROUP BY al.airline_id;

/*
-- If Bookings Table does not have flight_id
SELECT al.airline_name AS "Airlines", COUNT(DISTINCT booking_id) AS "Bookings" FROM Bookings bk
INNER JOIN Passengers pg ON bk.booking_creator_id = pg.passenger_id
LEFT JOIN PassengerFlightBoarding pfb ON pg.passenger_id = pfb.passenger_id
LEFT JOIN Flights f ON pfb.flight_id = f.flight_id
LEFT JOIN Airlines al ON f.airline_id = al.airline_id
GROUP BY al.airline_id;
*/


-- 4. Retrieve all bookings that had a payment status of 'Failed'

SELECT b.* FROM Bookings b
INNER JOIN Payments p ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Failed';


-- 5. Find the passengers who boarded flight_id = 1

SELECT CONCAT(pg.first_name, ' ', pg.last_name) AS "Passengers"  FROM PassengerFlightBoarding pfb 
INNER JOIN Passengers pg ON pfb.passenger_id = pg.passenger_id
WHERE pfb.flight_id = 1;


-- 6. List the airports in each country, sorted by country_id

SELECT c.country_name, ap.airport_name FROM Airports ap
INNER JOIN Countries c ON ap.country_id = c.country_id
ORDER BY c.country_id;


-- 7. Get the average price of seats in booking_id = 10

SELECT AVG(price) FROM TicketSeats WHERE booking_id = 10


-- 8. Get the details of the top 3 most expensive bookings based on seat prices

SELECT * FROM TicketSeats
GROUP BY booking_id
ORDER BY price DESC
LIMIT 3;


-- 9. Find all the passengers who have not boarded a flight

SELECT 
    p.passenger_id, 
    p.first_name || ' ' || p.last_name AS "Passengers"
FROM PassengerFlightBoarding AS pfb 
JOIN Passengers AS p ON pfb.passenger_id = p.passenger_id
WHERE pfb.boarded = 'FALSE';


-- 10. Retrieve all flights where the arrival airport is in the United Kingdom

SELECT * FROM Countries;

-- country_id = 3
SELECT f.* FROM Flights f
INNER JOIN Airports a ON f.arrival_airport_id = a.airport_id 
WHERE a.country_id = 3;


-- 11. List the top 5 passengers with the highest total payment amount.

SELECT p.first_name, p.last_name
FROM Bookings b
INNER JOIN Passengers p ON b.booking_creator_id = p.passenger_id
ORDER BY b.total_amount DESC
LIMIT 5;
