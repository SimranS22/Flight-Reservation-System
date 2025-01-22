-- SQLite: Intermediate Level

-- 1. Find all flights that have been delayed.

SELECT * FROM Flights WHERE flight_status = 'Delayed';


-- 2. Get the count of flights for each airline.

SELECT al.airline_name AS "Airline", COUNT(*) AS "Flights" FROM Flights fl
INNER JOIN Airlines al ON fl.airline_id = al.airline_id
GROUP BY al.airline_id;

-- 3. Get the count of bookings for each airline.

SELECT al.airline_name AS "Airlines", COUNT(DISTINCT booking_id) AS "Bookings" FROM Bookings bk
INNER JOIN Passengers pg ON bk.booking_creator_id = pg.passenger_id
LEFT JOIN PassengerFlightBoarding pfb ON pg.passenger_id = pfb.passenger_id
LEFT JOIN Flights f ON pfb.flight_id = f.flight_id
LEFT JOIN Airlines al ON f.airline_id = al.airline_id
GROUP BY al.airline_id;

-- 4. Retrieve all bookings that had a payment status of 'Failed'

SELECT b.* FROM Bookings b
INNER JOIN Payments p ON b.booking_id = p.booking_id
WHERE p.payment_status = 'Failed';

-- 5. Find the passengers who boarded flight_id = 1

SELECT CONCAT(pg.first_name, ' ', pg.last_name) AS "Passengers"  FROM PassengerFlightBoarding pfb 
INNER JOIN Passengers pg ON pfb.passenger_id = pg.passenger_id
WHERE pfb.flight_id = 1;