pip install mysql-connector-python

import mysql.connector

# Replace these values with your actual database credentials
db_config = {
    'host': 'your_database_host',
    'user': 'your_username',
    'password': 'your_password',
    'database': 'your_database_name'
}

# Create a connection to the database
conn = mysql.connector.connect(**db_config)

try:
    # Create a cursor object
    cursor = conn.cursor()

    # Parameters for the AddBooking() procedure
    booking_id = 99
    customer_id = 99
    table_number = 99
    booking_date = '2022-12-10'

    # Call the AddBooking() procedure using SQL statement
    cursor.callproc('AddBooking', [booking_id, customer_id, table_number, booking_date])

    # Commit the changes
    conn.commit()
    # Fetch the result (if any)
    result = cursor.fetchall()

    # Commit the changes
    conn.commit()

    print(f"Booking with ID {booking_id} added successfully.")

finally:
    # Close the cursor and connection in a finally block to ensure it's done even if an exception occurs
    cursor.close()
    conn.close()
