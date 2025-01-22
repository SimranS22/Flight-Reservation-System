-- 1. Countries
CREATE TABLE Countries(
    country_id INTEGER PRIMARY KEY AUTOINCREMENT,
    country_name TEXT NOT NULL UNIQUE,
    p_country_code TEXT NOT NULL UNIQUE --Phone code like +91, +1,etc.
);

-- 2. Cities
CREATE TABLE Cities(
    city_id INTEGER PRIMARY KEY AUTOINCREMENT,
    city_name TEXT NOT NULL UNIQUE,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

-- 3. Airlines
CREATE TABLE Airlines(
    airline_id INTEGER PRIMARY KEY AUTOINCREMENT,
    airline_name TEXT NOT NULL,
    airline_code TEXT NOT NULL UNIQUE,
    p_country_code TEXT NOT NULL UNIQUE,
    contact_number TEXT NULL,
    email TEXT NULL,
    website TEXT NULL,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

-- 4. ClassType
CREATE TABLE ClassType(
    class_id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_name TEXT
);

-- 5. PaymentType
CREATE TABLE PaymentType(
    pm_id INTEGER PRIMARY KEY AUTOINCREMENT,
    pm_type TEXT NOT NULL
);

-- 6. PII
CREATE TABLE PII(
    identifier_id INTEGER PRIMARY KEY AUTOINCREMENT,
    identifier_type TEXT NOT NULL,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

-- 7. Airports
CREATE TABLE Airports(
    airport_id INTEGER PRIMARY KEY AUTOINCREMENT,
    airport_name TEXT NOT NULL,
    city_id INTEGER NOT NULL,
    country_id INTEGER NOT NULL,
    airport_code TEXT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id),
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

-- 8. Passengers
CREATE TABLE Passengers(
    passenger_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NULL,
    dob DATE NOT NULL,    
    email TEXT NOT NULL,
    p_country_code TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    identifier_id INTEGER,
    identifier_value TEXT,
    FOREIGN KEY (identifier_id) REFERENCES PII(identifier_id)
);

-- 9. Flights
CREATE TABLE Flights(
    flight_id INTEGER PRIMARY KEY AUTOINCREMENT,
    flight_number INTEGER NOT NULL,
    departure_airport_id INTEGER,
    arrival_airport_id INTEGER,
    departure_time TEXT NOT NULL,
    arrival_time TEXT NOT NULL,
    flight_status TEXT CHECK(flight_status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),
    airline_id INTEGER,
    FOREIGN KEY (departure_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (arrival_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id)
);

-- 10. Bookings
CREATE TABLE Bookings(
    booking_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    booking_creator_id INTEGER NOT NULL, 
    booking_date TEXT NOT NULL, 
    ticket_type INTEGER NOT NULL, 
    total_amount REAL NOT NULL, 
    booking_status TEXT CHECK(booking_status IN ('Active', 'Cancelled')) NOT NULL DEFAULT 'Active',
    cancellation_date TEXT NULL,
    FOREIGN KEY (booking_creator_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (ticket_type) REFERENCES ClassType(class_id)
);


-- 11. FamilyMembers
CREATE TABLE FamilyMembers(
    family_member_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    booking_id INTEGER, 
    passenger_id INTEGER, 
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

-- 12. TicketSeats
CREATE TABLE TicketSeats (
    ticket_seat_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    booking_id INTEGER,
    seat_number TEXT, 
    class_id INTEGER,
    price REAL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (class_id) REFERENCES ClassType(class_id)
);

-- 13. Payments
CREATE TABLE Payments(
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    booking_id INTEGER, 
    payment_date TEXT NOT NULL, 
    payment_amount REAL, 
    pm_id INTEGER, 
    payment_status TEXT CHECK(payment_status IN ('Success', 'Failed')) DEFAULT 'Pending',
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (pm_id) REFERENCES PaymentType(pm_id)
);

-- 14. Baggage
CREATE TABLE Baggage (
    baggage_id INTEGER PRIMARY KEY AUTOINCREMENT,         
    booking_id INTEGER,                                   
    baggage_weight REAL,                                  
    baggage_type TEXT,                                    
    checked_in BOOLEAN,                                    
    baggage_status TEXT,                                  
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- 15. FlightBoarding
CREATE TABLE PassengerFlightBoarding (
    flight_id INTEGER,
    passenger_id INTEGER,
    boarded BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    PRIMARY KEY (flight_id, passenger_id)
);

-- 16. AirlineCrew
CREATE TABLE AirlineCrew (
    crew_id INTEGER PRIMARY KEY AUTOINCREMENT,
    airline_id INTEGER,
    crew_role_id INTEGER,
    first_name TEXT,
    last_name TEXT,
    birthdate DATE,
    hire_date DATE,
    gender TEXT,
    p_country_code TEXT NOT NULL UNIQUE,
    contact_phone TEXT,
    email TEXT,
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id) ON DELETE CASCADE,
    FOREIGN KEY (crew_role_id) REFERENCES CrewRoles(role_id)
);

--  17. CrewRoles
CREATE TABLE CrewRoles (
    role_id INTEGER PRIMARY KEY AUTOINCREMENT,
    role_name TEXT UNIQUE NOT NULL
);

-- 18. CrewFlightBoarding
CREATE TABLE CrewFlightBoarding (
    flight_id INTEGER,
    crew_id INTEGER,
    boarded BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (crew_id) REFERENCES AirlineCrew(crew_id),
    PRIMARY KEY (flight_id, crew_id)
);

