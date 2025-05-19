<?php
$servername = "localhost";  // Database server (usually localhost for local development)
$username = "root";         // MySQL username (default for XAMPP is 'root')
$password = "";             // MySQL password (default for XAMPP is empty)
$dbname = "bayanicare_db";  // Database name (the one you created in phpMyAdmin)

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    error_log("Connection failed: " . $conn->connect_error); // Log the error
    die("Connection failed. Please try again later."); // Show a user-friendly message
}

// Optionally close the connection when done (for performance reasons)
$conn->close();
?>
