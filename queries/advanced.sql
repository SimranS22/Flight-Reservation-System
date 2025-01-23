-- SQLite: Advance Level

-- 1. Find the running total of payment amounts for each booking.

SELECT booking_id AS "Booking ID", STRFTIME('%d-%m-%Y',payment_date) AS "Payment Date", SUM(payment_amount) OVER (PARTITION BY booking_id ORDER BY payment_id ASC) AS "Running Total" 
FROM Payments 
WHERE payment_status = 'Success';


-- 2. List the airlines with the highest total payment amount for all bookings.

SELECT al.airline_name AS "Airline", SUM(py.payment_amount) AS "Total Payment" 
FROM Airlines al
INNER JOIN Flights fl ON al.airline_id = fl.airline_id
INNER JOIN Bookings bk ON fl.flight_id = bk.flight_id
INNER JOIN Payments py ON bk.booking_id = py.booking_id
WHERE py.payment_status = 'Success'
GROUP BY al.airline_id
ORDER BY SUM(py.payment_amount) DESC
LIMIT 1;


-- 3. Find the bookings that were cancelled but for which the money was not refunded.

SELECT * FROM Bookings bk 
INNER JOIN Payments py ON bk.booking_id = py.booking_id
WHERE bk.booking_status ='Cancelled' AND py.payment_status != 'Refunded';


-- All cancelled bookings should be refunded.
-- 4. Update the status to refunded for cancelled bookings.

UPDATE Payments
SET payment_status = 'Refunded'
WHERE payment_id = 21;

-- 5. Calculate the total number of passengers per country partitioned by gender

SELECT c.country_name, p.gender, COUNT(*) AS "No. of Passengers" FROM Passengers p
INNER JOIN Countries c ON p.phone_country_code = c.phone_country_code
GROUP BY c.country_name, p.gender
ORDER BY c.country_name, p.gender ASC;

/*
Payment Amount [payment_amount(Payments)] now only keeps track of the Total Amount [total_amount(Bookings)], which only accounts for seat pricing.

The passengers' baggage costs must now be included in the total amount.
*/