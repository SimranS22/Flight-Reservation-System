-- SQLite: Query for Beginners

-- 1.List all the airlines in the database.
SELECT * FROM Airlines;


-- 2. Find all airports located in the United States
SELECT * FROM Countries;

-- For United States, country_id = 1
SELECT * FROM Airports WHERE country_id = 1;

-- 3. Get the details of passengers who have an email ending with "@example.com"

SELECT * FROM Passengers WHERE email LIKE '%@example.com';

-- 4. How many different payment methods are available in the database?

SELECT COUNT(*) FROM PaymentType;