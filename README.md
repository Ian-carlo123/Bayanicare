BAYANICARE

__________________________________________________________________________________________________________________________________________________________________________________________
    OVERVIEW

BayaniCare is a digital barangay service platform developed to streamline and modernize local government operations at the barangay level. It addresses common issues such as manual     processing, poor communication, and lack of service accessibility.

__________________________________________________________________________________________________________________________________________________________________________________________
    Core Features of BayaniCare

1. Appointment System
   
•	Residents can book health consultations or barangay service appointments online.

•	Automatic tracking, reminders, and real-time status visibility.

2. Complaint Submission
   
•	Users can file complaints about community issues (e.g., noise, safety).

•	Complaints can include attachments and are tracked until resolved.

3. Service Requests
   
•	Tailored for seniors, PWDs, and low-income households.

•	Enables digital submission with document uploads for validation.

4. Announcements & Notifications
   
•	Officials can post announcements and public updates.

•	Residents receive real-time alerts on their dashboard or via email.

5. User Roles and Access Levels
    
•	Residents: Can view announcements, submit and track complaints/requests/appointments.

•	Secretaries: Manage requests, appointments, and assist with system notifications.

•	Barangay Officials: Full access to control announcements, monitor data, and manage barangay operations.

6. Household Tracking
    
•	Database of residents with details like age, PWD status, household head, etc.

•	Helps in prioritizing service delivery and community planning.

7. Notifications System
    
•	Real-time alerts for appointments, service updates, new announcements, etc.

8. Feedback and FAQ Modules
    
•	Residents can provide feedback and access frequently asked questions to ease system use.

9. Project Tracking
    
•	Officials can monitor community projects, their status, and schedule.

10. Data Management
    
•	Centralized database with secure storage for users, activities, logs, and reports.

•	Tables include appointments, announcements, complaints, feedback, projects, and more.

__________________________________________________________________________________________________________________________________________________________________________________________
    Technology Stack


1. Frontend (Client-Side)
   
•	HTML5 – Markup language used to structure web pages.

•   CSS3 – For styling and responsive layout design.

•	JavaScript – Used for dynamic interactions and client-side logic.

•	Bootstrap – For responsive UI components and layout.

2. Backend (Server-Side)
   
•	PHP – Main server-side scripting language used to handle logic, form submissions, authentication, and CRUD operations.

•	MySQL – Relational database system for storing structured data such as users, appointments, complaints, requests, etc.

3. Database
   
•	MySQL (or MariaDB) – The database tables and normalization diagrams in the PDF show structured SQL schemas, primary/foreign keys, and status logs, consistent with MySQL.

4. Hosting / Server
   
•	Likely a local Apache server using XAMPP, WAMP, or LAMP stack for local development (common in academic projects).

•	Can be deployed to a shared or cloud-based PHP/MySQL hosting environment.

5. Additional Tools & Frameworks
   
•	phpMyAdmin – Likely used for managing the MySQL database through a graphical interface.

•	FullCalendar.js (assumed) – A calendar feature is present, and this JavaScript library is commonly used for such implementations.

•	Google Fonts / Icons – May be used to improve visual design.

•	Email/Notification System – PHP's mail() function or SMTP libraries might be used for sending alerts and confirmations (as notifications are included in the features).


__________________________________________________________________________________________________________________________________________________________________________________________


    Installation Requirements

•    [XAMPP](https://www.apachefriends.org/) (or any alternative with Apache, MySQL, and PHP support)  

•    Modern Web Browser  


__________________________________________________________________________________________________________________________________________________________________________________________

    System Installation / Setup

1. Open your *XAMPP Control Panel* and start *Apache* and *MySQL*.
2. Extract the downloaded source code .zip file.
3. Copy the extracted folder and paste it into the htdocs directory inside your XAMPP installation.
4. Open a browser and go to [http://localhost/phpmyadmin](http://localhost/phpmyadmin)
5. Create a new database named quicksched_db.
6. Import the provided SQL file (bayanicare_db.sql) located at the root of the project directory.
7. Access the system via the following URLs:
   - *Resident*: [http://localhost/FINAL/dashboard](http://localhost/FINAL/dashboard.php)
   - *Secretary*: [http://localhost/FINAL/secretary_dashboard](http://localhost/FINAL/secretary_dashboard.php)
   - *Admin-side*: [http://localhost/FINAL/captain_dashboard](http://localhost/FINAL/captain_dashboard.php)

__________________________________________________________________________________________________________________________________________________________________________________________

    User Access Credentials

| Role    | Email                         | Password     |
|---------|-------------------------------|--------------|
| resident| quimbo.iancarlo@gmail.com     | 123          |
| Doctor  | yansem2522@gmail.com          | 123          |
| Admin   | ian.quimbo2004@gmail.com      | 123          |

__________________________________________________________________________________________________________________________________________________________________________________________

    Developers

- *Ian Carlo Quimbo*  
- *Daniela Micah Edullantes*  
- *Christianjhon Gallogo*

__________________________________________________________________________________________________________________________________________________________________________________________

© 2025 BAYANICARE. All rights reserved.
