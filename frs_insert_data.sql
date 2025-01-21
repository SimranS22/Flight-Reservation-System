INSERT INTO Countries (country_name, p_country_code) VALUES
('India', '+91'),
('United States', '+1'),
('Germany', '+49'),
('France', '+33'),
('United Kingdom', '+44'),
('Canada', '+1'),
('Australia', '+61'),
('Brazil', '+55'),
('Japan', '+81'),
('South Korea', '+82');


INSERT INTO Cities (city_name, country_id) VALUES
('New Delhi', 1),
('Mumbai', 1),
('Bangalore', 1),
('Chennai', 1),
('Kolkata', 1),
('Hyderabad', 1),
('Ahmedabad', 1),
('Pune', 1),
('Jaipur', 1),
('Chandigarh', 1),
('New York', 2),
('Los Angeles', 2),
('Berlin', 3),
('Paris', 4),
('London', 5),
('Toronto', 6),
('Sydney', 7),
('Rio de Janeiro', 8),
('Tokyo', 9),
('Seoul', 10);

INSERT INTO Airports (airport_name, city_id, country_id, airport_code) VALUES
('Indira Gandhi International Airport', 1, 1, 'DEL'),
('Chhatrapati Shivaji Maharaj International Airport', 2, 1, 'BOM'),
('Kempegowda International Airport', 3, 1, 'BLR'),
('Chennai International Airport', 4, 1, 'MAA'),
('Netaji Subhas Chandra Bose International Airport', 5, 1, 'CCU'),
('Rajiv Gandhi International Airport', 6, 1, 'HYD'),
('Sardar Vallabhbhai Patel International Airport', 7, 1, 'AMD'),
('Pune International Airport', 8, 1, 'PNQ'),
('Jaipur International Airport', 9, 1, 'JAI'),
('Chandigarh International Airport', 10, 1, 'IXC'),
('JFK International Airport', 11, 2, 2, 'JFK'),
('Los Angeles International Airport', 12, 2, 'LAX'),
('Berlin Brandenburg Airport', 13, 3, 'BER'),
('Charles de Gaulle Airport', 14, 4, 'CDG'),
('Heathrow Airport', 15, 5, 'LHR'),
('Toronto Pearson International Airport', 16, 6, 'YYZ'),
('Sydney Kingsford Smith Airport', 17, 7, 'SYD'),
('Rio de Janeiro–Galeão International Airport', 18, 8, 'GIG'),
('Narita International Airport', 19, 9, 'NRT'),
('Incheon International Airport', 20, 10, 'ICN');


INSERT INTO Airlines (airline_name, airline_code, country_of_origin, contact_number, email, website) VALUES
('Air India', 'AI', 'India', '1800-180-1407', 'customercare@airindia.in', 'http://www.airindia.in'),
('Delta Airlines', 'DL', 'United States', '800-221-1212', 'help@delta.com', 'http://www.delta.com'),
('Lufthansa', 'LH', 'Germany', '0180 6 747 747', 'info@lufthansa.com', 'http://www.lufthansa.com'),
('Air France', 'AF', 'France', '3654', 'contact@airfrance.com', 'http://www.airfrance.com'),
('British Airways', 'BA', 'United Kingdom', '0344 493 0787', 'customer.relations@ba.com', 'http://www.britishairways.com'),
('Air Canada', 'AC', 'Canada', '1-888-247-2262', 'info@aircanada.ca', 'http://www.aircanada.com'),
('Qantas', 'QF', 'Australia', '13 13 13', 'customer.relations@qantas.com.au', 'http://www.qantas.com'),
('LATAM Airlines', 'LA', 'Brazil', '0800-123-200', 'support@latam.com', 'http://www.latam.com'),
('Japan Airlines', 'JL', 'Japan', '03-5757-1111', 'contact@jal.com', 'http://www.jal.com'),
('Korean Air', 'KE', 'South Korea', '02-2656-2001', 'koreanair@koreanair.com', 'http://www.koreanair.com');

INSERT INTO PaymentType (pm_type) VALUES
('Credit Card'),
('Debit Card'),
('Net Banking'),
('UPI'),
('PayPal'),
('Cash'),
('Bitcoin'),
('Apple Pay'),
('Google Pay'),
('Samsung Pay');


INSERT INTO ClassType (class_name) VALUES
('Economy'),
('Business'),
('First'),
('Premium Economy'),
('Economy Plus'),
('Business Suite'),
('First Suite'),
('Executive Class'),
('Luxury Class'),
('Economy Lite');


INSERT INTO PII (identifier_type) VALUES
('Aadhar Card'),
('Driver’s License'),
('National Identity Card (EU)'),
('National ID Card (UK)'),
('CPF (Brazil)'),
('Passport'),
('Voter ID'),
('Social Security Number'),
('PAN Card (India)'),
('Tax Identification Number');

INSERT INTO Passengers (first_name, last_name, dob, email, p_country_code, phone_number, identifier_id, identifier_value) VALUES
('John', 'Doe', '1985-04-12', 'john.doe@email.com', 'IN', '9876543210', 1, '1234 5678 9876'),
('Jane', 'Smith', '1990-07-21', 'jane.smith@email.com', 'US', '1234567890', 2, 'D1234567'),
('Max', 'Mustermann', '1987-11-30', 'max.mustermann@email.com', 'DE', '9876543210', 3, 'DE1234567890'),
('Pierre', 'Durand', '1982-03-15', 'pierre.durand@email.com', 'FR', '5551234567', 4, 'FR123456789'),
('James', 'Brown', '1995-06-25', 'james.brown@email.com', 'GB', '7776543210', 5, 'GB123456789'),
('Carlos', 'Lopez', '1980-02-10', 'carlos.lopez@email.com', 'BR', '9998765432', 6, 'CPF1234567890'),
('Akira', 'Yamamoto', '1992-09-08', 'akira.yamamoto@email.com', 'JP', '8881234567', 7, 'JP123456789'),
('Jin', 'Park', '1993-12-17', 'jin.park@email.com', 'KR', '6665554444', 8, 'KR1234567890'),
('Ravi', 'Kumar', '1988-10-30', 'ravi.kumar@email.com', 'IN', '8001234567', 9, 'A1234567890'),
('Emily', 'Taylor', '1994-01-05', 'emily.taylor@email.com', 'CA', '5551239876', 10, 'CAN123456789');


INSERT INTO Flights (flight_number, departure_airport_id, arrival_airport_id, departure_time, arrival_time, flight_status, airline_id) VALUES
(101, 1, 2, '2025-03-10 10:00:00', '2025-03-10 12:30:00', 'Active', 1),
(102, 2, 3, '2025-03-11 15:00:00', '2025-03-11 17:00:00', 'Active', 2),
(103, 3, 4, '2025-03-12 08:00:00', '2025-03-12 10:00:00', 'Cancelled', 3),
(104, 4, 5, '2025-03-13 13:30:00', '2025-03-13 16:00:00', 'Active', 4),
(105, 5, 6, '2025-03-14 06:00:00', '2025-03-14 09:00:00', 'Active', 5),
(106, 6, 7, '2025-03-15 11:00:00', '2025-03-15 13:30:00', 'Active', 6),
(107, 7, 8, '2025-03-16 09:00:00', '2025-03-16 11:30:00', 'Cancelled', 7),
(108, 8, 9, '2025-03-17 14:30:00', '2025-03-17 17:00:00', 'Active', 8),
(109, 9, 10, '2025-03-18 17:00:00', '2025-03-18 19:30:00', 'Active', 9),
(110, 10, 1, '2025-03-19 20:00:00', '2025-03-19 22:30:00', 'Active', 10);

INSERT INTO Bookings (booking_creator_id, booking_date, ticket_type, total_amount, booking_status, cancellation_date) VALUES
(1, '2025-03-10', 1, 5000, 'Active', NULL),
(2, '2025-03-11', 2, 10000, 'Cancelled', '2025-03-12'),
(3, '2025-03-12', 3, 15000, 'Active', NULL),
(4, '2025-03-13', 1, 3000, 'Active', NULL),
(5, '2025-03-14', 2, 12000, 'Active', NULL),
(6, '2025-03-15', 1, 5500, 'Cancelled', '2025-03-16'),
(7, '2025-03-16', 3, 20000, 'Active', NULL),
(8, '2025-03-17', 2, 8000, 'Active', NULL),
(9, '2025-03-18', 1, 4500, 'Active', NULL),
(10, '2025-03-19', 3, 18000, 'Cancelled', '2025-03-20');


INSERT INTO FamilyMembers (booking_id, passenger_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

INSERT INTO TicketSeats (booking_id, seat_number, seat_type, price) VALUES
(1, 'A1', 1, 5000),
(2, 'B1', 2, 10000),
(3, 'C1', 3, 15000),
(4, 'D1', 1, 3000),
(5, 'E1', 2, 12000),
(6, 'F1', 1, 5500),
(7, 'G1', 3, 20000),
(8, 'H1', 2, 8000),
(9, 'I1', 1, 4500),
(10, 'J1', 3, 18000);

INSERT INTO Payments (booking_id, payment_date, payment_amount, pm_id, payment_status) VALUES
(1, '2025-03-10', 5000, 1, 'Failed'),
(1, '2025-03-11', 5000, 2, 'Failed'),
(1, '2025-03-12', 5000, 3, 'Success'),
(2, '2025-03-13', 10000, 2, 'Success'),
(3, '2025-03-14', 15000, 1, 'Success'),
(4, '2025-03-15', 3000, 5, 'Failed'),
(4, '2025-03-16', 3000, 6, 'Success'),
(5, '2025-03-17', 12000, 4, 'Failed'),
(5, '2025-03-18', 12000, 7, 'Failed'),
(5, '2025-03-19', 12000, 8, 'Success');


INSERT INTO Baggage (booking_id, baggage_weight, baggage_type, checked_in, baggage_status) VALUES
(1, 25, 'Carry-on', 1, 'In Transit'),
(2, 15, 'Checked', 0, 'Lost'),
(3, 30, 'Checked', 1, 'Delivered'),
(4, 20, 'Carry-on', 0, 'In Transit'),
(5, 25, 'Checked', 1, 'Delivered'),
(6, 10, 'Carry-on', 0, 'In Transit'),
(7, 50, 'Checked', 1, 'Delivered'),
(8, 12, 'Carry-on', 1, 'In Transit'),
(9, 15, 'Checked', 1, 'Lost'),
(10, 20, 'Carry-on', 0, 'Delivered');
