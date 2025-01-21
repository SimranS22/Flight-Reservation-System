CREATE TABLE Countries(
    country_id INTEGER PRIMARY KEY AUTOINCREMENT,
    country_name TEXT NOT NULL UNIQUE,
    p_country_code TEXT NOT NULL UNIQUE
);

CREATE TABLE Cities(
    city_id INTEGER PRIMARY KEY AUTOINCREMENT,
    city_name TEXT NOT NULL UNIQUE,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

CREATE TABLE Airlines(
    airline_id INTEGER PRIMARY KEY AUTOINCREMENT,
    airline_name TEXT NOT NULL,
    airline_code TEXT NOT NULL UNIQUE,
    country_of_origin TEXT NOT NULL,
    contact_number TEXT NULL,
    email TEXT NULL,
    website TEXT NULL
);

-- Credit Card, Debit Card, Net Banking, UPI, etc.
CREATE TABLE PaymentType(
    pm_id INTEGER PRIMARY KEY AUTOINCREMENT,
    pm_type TEXT NOT NULL
);

-- Economy, Business, First, etc.
CREATE TABLE ClassType(
    class_id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_name TEXT
);

-- Aadhar Card (India), Driver’s License (USA), National Identity Card(EU), National ID Card(UK), CPF(Brazil) 
CREATE TABLE PII(
    identifier_id INTEGER PRIMARY KEY AUTOINCREMENT,
    identifier_type TEXT NOT NULL,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

CREATE TABLE Airports(
    airport_id INTEGER PRIMARY KEY AUTOINCREMENT,
    airport_name TEXT NOT NULL,
    city_id INTEGER NOT NULL,
    country_id INTEGER NOT NULL,
    airport_code TEXT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES Cities(city_id),
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

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

CREATE TABLE Flights(
    flight_id INTEGER PRIMARY KEY AUTOINCREMENT,
    flight_number INTEGER NOT NULL,
    departure_airport_id INTEGER,
    arrival_airport_id INTEGER,
    departure_time TEXT NOT NULL,
    arrival_time TEXT NOT NULL,
    flight_status TEXT CHECK(flight_status IN ('Scheduled', 'Delayed', 'Cancelled')),
    airline_id INTEGER,
    FOREIGN KEY (departure_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (arrival_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id)
);


CREATE TABLE Bookings(
    booking_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    booking_creator_id INTEGER NOT NULL, 
    booking_date TEXT NOT NULL, 
    ticket_type INTEGER NOT NULL, 
    total_amount REAL NOT NULL, 
    booking_status TEXT CHECK(booking_status IN ('Active', 'Cancelled')) NOT NULL,
    cancellation_date TEXT NULL,
    FOREIGN KEY (booking_creator_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (ticket_type) REFERENCES ClassType(class_id)
);

CREATE TABLE FamilyMembers(
    family_member_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    booking_id INTEGER, 
    passenger_id INTEGER, 
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

CREATE TABLE TicketSeats(
    ticket_seat_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    booking_id INTEGER,
    seat_number TEXT, 
    seat_type INTEGER, 
    price REAL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (seat_type) REFERENCES ClassType(class_id)
);


CREATE TABLE Payments(
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    booking_id INTEGER, 
    payment_date TEXT NOT NULL, 
    payment_amount REAL, 
    pm_id INTEGER, 
    payment_status TEXT CHECK(payment_status IN ('Success', 'Failed')),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (pm_id) REFERENCES PaymentType(pm_id)
);

CREATE TABLE Baggage (
    baggage_id INTEGER PRIMARY KEY AUTOINCREMENT,         
    booking_id INTEGER,                                   
    baggage_weight REAL,                                  
    baggage_type TEXT,                                    
    checked_in BOOLEAN,                                    
    baggage_status TEXT,                                  
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
