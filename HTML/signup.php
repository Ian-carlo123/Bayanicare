<?php
// Include the database connection
include('../../db.php');  // Goes up two directories


// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $fullName = $_POST['fullName'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirmPassword'];
    $userType = $_POST['userType'];

    // Validation for passwords
    if ($password !== $confirmPassword) {
        echo "Passwords do not match!";
    } else {
        // Encrypt password
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Prepare and execute SQL query based on user type
        if ($userType == "resident") {
            $address = $_POST['address'];
            $contactNumber = $_POST['contactNumber'];
            $barangayId = $_POST['barangayId'];

            $sql = "INSERT INTO users (full_name, email, password, role, address, contact_number, barangay_id) 
                    VALUES ('$fullName', '$email', '$hashedPassword', 'resident', '$address', '$contactNumber', '$barangayId')";
        } elseif ($userType == "official") {
            $position = $_POST['position'];
            $officeLocation = $_POST['officeLocation'];
            $contactNumber = $_POST['contactNumber'];

            $sql = "INSERT INTO users (full_name, email, password, role, position, office_location, contact_number) 
                    VALUES ('$fullName', '$email', '$hashedPassword', 'official', '$position', '$officeLocation', '$contactNumber')";
        }

        // Execute the SQL query
        if ($conn->query($sql) === TRUE) {
            echo "New record created successfully. Please <a href='login.php'>Login here</a>";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
    // Close the database connection
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="../CSS/STYLE.CSS">
    
    <style>
        .card {
            width: 450px;
            padding: 20px;
            text-align: center;
            background: linear-gradient(to bottom, rgba(0,0,50,0.8), rgba(0,123,255,0.9));
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .card img {
            width: 120px;
            height: auto;
            margin-top: 100px;
            position: relative;
        }

        .dropdown {
            margin-bottom: 15px;
        }

        .dropdown select {
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid black;
        }

        #residentForm, #officialForm {
            display: none;
        }
    </style>
</head>
<body style="display: flex; justify-content: center; align-items: center; height: 100vh; background-color: #e0f7fa;">

    <div class="background">
        <img src="../IMAGES/Sumpong_Barangay_Hall.jpg" alt="Background Image" style="position: fixed; width: 100%; height: 100vh; object-fit: cover; opacity: 0.5;">
    </div>

    <div class="container">
        <div class="card">
            <img src="../IMAGES/MALAYBALAY-removebg-preview.png" alt="Logo">
            <h2>Signup for BAYANICARE</h2>

            <!-- User Type Dropdown -->
            <div class="dropdown">
                <select id="userType" onchange="toggleForms()">
                    <option value="">Select User Type</option>
                    <option value="resident">Resident</option>
                    <option value="official">Barangay Official</option>
                </select>
            </div>

            <!-- Resident Registration Form -->
            <form id="residentForm" action="signup.php" method="POST">
                <input type="hidden" name="userType" value="resident">
                <input type="text" placeholder="Full Name" name="fullName" required>
                <input type="text" placeholder="Address" name="address" required>
                <input type="text" placeholder="Contact Number" name="contactNumber" required>
                <input type="email" placeholder="Email Address" name="email" required>
                <input type="text" placeholder="Barangay ID (if available)" name="barangayId">
                <input type="password" placeholder="Password" name="password" required>
                <input type="password" placeholder="Confirm Password" name="confirmPassword" required>
                <button type="submit">Signup</button>
            </form>

            <!-- Barangay Official Registration Form -->
            <form id="officialForm" action="signup.php" method="POST">
                <input type="hidden" name="userType" value="official">
                <input type="text" placeholder="Full Name" name="fullName" required>
                <input type="text" placeholder="Position" name="position" required>
                <input type="text" placeholder="Office Location" name="officeLocation" required>
                <input type="text" placeholder="Contact Number" name="contactNumber" required>
                <input type="email" placeholder="Email Address" name="email" required>
                <input type="password" placeholder="Password" name="password" required>
                <input type="password" placeholder="Confirm Password" name="confirmPassword" required>
                <button type="submit">Signup</button>
            </form>

            <p>Already have an account? <a href="login.php">Login here</a></p>
        </div>
    </div>

    <script>
        function toggleForms() {
            var userType = document.getElementById("userType").value;
            document.getElementById("residentForm").style.display = userType === "resident" ? "block" : "none";
            document.getElementById("officialForm").style.display = userType === "official" ? "block" : "none";
        }
    </script>

</body>
</html>
