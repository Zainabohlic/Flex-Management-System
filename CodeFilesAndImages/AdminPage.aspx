<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>

    <style>


        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        table {
            border-collapse: collapse;
            margin: auto;
            width: 50%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: lightgray;
            color: black;
        }
        td {
            background-color: white;
            color: black;
        }
        caption {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        h1 {
        margin-left: 25%;
        margin-top: 50px;
        margin-bottom: 40px;
        background-color: lightblue;
        font-size: 26px;
        }

        .nav {
            width: 15%;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
/*            opacity: 30%;*/
            overflow: auto;
            padding-top: 20px;
            z-index: 2;
        }

        .nav a {
            display: block;
            color: white;
            padding: 16px;
            text-decoration: none;
        }

        .nav a.active {
            background-color: darkgreen;
            color: white;
        }

        .nav a:hover:not(.active) {
            background-color: white;
            color: black;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div class="nav">
            <a href="AdminPage.aspx" class="active" onclick="Home()">Home</a>
            <a href="AdminCourses.aspx"   onclick="showCourses">Course Registrations</a>
            <a href="AdminSections.aspx" onclick="showAttendance()">Section Allocation</a>
            <a href="AdminFaculty.aspx" onclick="showTranscript()">Faculty Allocation</a>
            <a href="AdminStudents.aspx" onclick="showTranscript()">Student Allocation</a>
            <a href="AdminFeedback.aspx"  onclick="showMarks()">Feedback</a>
        </div>
    </form>
</body>
</html>
