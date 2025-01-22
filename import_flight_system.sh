#!/bin/sh

# Path to the SQLite database
DB_PATH="FlightSystem.db"

# Creating the database and tables
sqlite3 $DB_PATH <<EOF
.read frs_create_tables.sql

# Set output mode for .import (list format)
.mode list

# Importing CSV files into corresponding tables
.import csv/Currencies.csv Currencies
.import csv/Countries.csv Countries
.import csv/Cities.csv Cities
.import csv/Airports.csv Airports
.import csv/ClassType.csv ClassType
.import csv/PaymentType.csv PaymentType
.import csv/BaggageType.csv BaggageType
.import csv/CrewRoles.csv CrewRoles
.import csv/Airlines.csv Airlines
.import csv/PII.csv PII
.import csv/Passengers.csv Passengers
.import csv/Flights.csv Flights
.import csv/Bookings.csv Bookings
.import csv/FamilyMembers.csv FamilyMembers
.import csv/TicketSeats.csv TicketSeats
.import csv/Payments.csv Payments
.import csv/Baggage.csv Baggage
.import csv/PassengerFlightBoarding.csv PassengerFlightBoarding
.import csv/AirlineCrew.csv AirlineCrew
.import csv/CrewFlightBoarding.csv CrewFlightBoarding

.quit
EOF
