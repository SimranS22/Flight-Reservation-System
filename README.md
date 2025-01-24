# Flight Reservation System (FRS) Project

## Overview
The **Flight Reservation System** is a comprehensive SQLite-based database system designed to handle flight-related data, including bookings, passengers, flights, baggage, payments, and more. The system tracks various entities such as airlines, airports, passengers, flight bookings, and crew members. It is structured to support features like flight reservations, ticketing, baggage tracking, and crew management.

This project utilizes SQLite for efficient database management and uses CSV files for importing essential data into the system. SQL queries have also been developed to answer key questions and analyze data within the system.
## Video Demo
--
## Features
- **Flight & Airport Management**: Manage airlines, airports, and flights with real-time status updates.
- **Passenger & Booking System**: Handle passenger information, bookings, seat assignments, and payment processes.
- **Baggage Tracking**: Keep track of baggage, its status (checked, lost, in transit, or delivered), and weight.
- **Crew Management**: Manage airline crew information and track crew boarding for flights.
- **Currency & Payment Handling**: Manage different currencies, payment types, and track payment status.

## Database Setup

### Prerequisites
Before setting up the system, ensure that you have the following installed:
- **SQLite3**: A lightweight database engine to handle the database files.
- **CSV Files**: Data files (CSV format) for each entity in the system (Currencies, Countries, Cities, etc.).
  
### Setting Up the Database

1. **Clone the Repository**: Start by cloning the repository to your local machine.

   ```bash
   git clone https://github.com/SimranS22/Flight-Reservation-System.git
   cd Flight-Reservation-System
   ```

2. **Create the Database**: Run the `import_flight_system.sh` script to set up the SQLite database and import the necessary data from CSV files into the corresponding tables.

   ```bash
   chmod +x import_flight_system.sh
   ./import_flight_system.sh
   ```

   This script will:
   - Create the database file `FlightSystem.db`.
   - Set up tables as defined in the `frs_create_tables.sql` script.
   - Import data from the `csv/` directory into the relevant tables.

3. **Verify Database**: After running the script, the database `FlightSystem.db` should be created with all the necessary tables and data. You can interact with the database using SQLite3:

   ```bash
   sqlite3 FlightSystem.db
   ```

4. **SQL Queries for Analysis**: You can run SQL queries to analyze and retrieve data from the database. These queries can be found in the [queries](https://github.com/SimranS22/Flight-Reservation-System/tree/main/queries) directory.

## File Structure

- `frs_create_tables.sql`: SQL script for creating all the necessary tables in the database.
- `import_flight_system.sh`: Shell script for setting up the database and importing CSV data.
- `csv/`: Directory containing CSV files with initial data to populate the database.
- `queries/`: Directory containing SQL queries for data analysis.

## Contributing

Feel free to fork the project and submit pull requests. If you have any improvements or suggestions, feel free to contribute!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
