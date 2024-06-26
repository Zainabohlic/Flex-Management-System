# FLEX System Database Management

## Overview

The FLEX system is a database management system designed to manage and schedule university students' academic information. This system allows the university to handle various aspects of student management, such as enrollment, course registration, scheduling, and student performance tracking. Students can access and manage their academic information and schedules, while the university can effectively manage its resources and course offerings.

## Features

### User Management
The FLEX system includes user management for three roles:
- **Academic Officers**
- **Faculty**
- **Students**

Each user must have a user account, and the system provides separate interfaces for each role to ensure a user-friendly experience and efficient data processing. The system is designed with security, privacy, scalability, and integration with other systems in mind.

### Interfaces

#### Academic Office Interface
The Academic Office Interface includes the following features:
- Offering courses each semester
- Managing student course registrations and prerequisites
- Creating and managing course sections
- Allocating courses to Course and Lab Instructors

#### Faculty Interface
The Faculty Interface includes the following features:
- Viewing assigned courses and sections
- Setting marks distribution
- Managing attendance
- Managing evaluations

#### Student Interface
The Student Interface includes the following features:
- Viewing personal information, attendance, and evaluation marks
- Viewing transcripts and CGPA comparison graphs
- Providing feedback to teachers


## Setup Instructions

1. **Open the Project in Visual Studio:**
   - Open Visual Studio.
   - Go to `File` > `Open` > `Project/Solution`.
   - Navigate to the directory where you have cloned the repository and select the project file.

2. **Database Configuration:**
   - Ensure you have SQL Server installed.
   - Create a database for the FLEX system.
   - Import the provided Excel sheet with at least 50 records into the database tables.

3. **Connection String:**
   - Update the connection string in the project's configuration file with the correct SQL Server connection string.

4. **Run the Application:**
   - Press `F5` to build and run the application.
   - Follow the instructions in the repository to access the various interfaces.




Thank you for using the FLEX System Database Management tool :)

---
