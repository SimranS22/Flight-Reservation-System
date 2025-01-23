-- SQLite: Advanced Level

-- Currently Total Amount [total_amount(Bookings)] tracks the travel amount [payment_amount(Payments)] only. Now the Total Amount must contain the seat prices of the passengers as well.

-- Test
SELECT * FROM Bookings
INNER JOIN TicketSeats USING (booking_id);
