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


-- 3. Find those Bookings which have been cancelled however the payment has not been Refunded

SELECT * FROM Bookings bk 
INNER JOIN Payments py ON bk.booking_id = py.booking_id
WHERE bk.booking_status ='Cancelled' AND py.payment_status != 'Refunded';

/*
Currently Payment Amount [payment_amount(Payments)] tracks the Total Amount [total_amount(Bookings)] only, which covers the seat prices only.

Now the Total Amount must contain the baggage prices of the passengers as well

*/