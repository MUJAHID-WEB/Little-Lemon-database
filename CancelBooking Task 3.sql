CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(IN BookingID INT)
BEGIN
DELETE FROM booking WHERE booking_id = BookingID;
END


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

    # Parameter for the CancelBooking() procedure
    table_number = 99

    # Call the CancelBooking() procedure using cursor.execute()
    cursor.callproc('CancelBooking', [table_number])

    # Fetch the result (if any)
    result = cursor.fetchall()

    # Commit the changes
    conn.commit()

    # Print the result
    print("Result:", result)

finally:
    # Close the cursor and connection in a finally block to ensure it's done even if an exception occurs
    cursor.close()
    conn.close()
