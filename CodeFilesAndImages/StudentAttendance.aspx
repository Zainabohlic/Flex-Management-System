<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentAttendance.aspx.cs" Inherits="StudentAttendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Attendance</title>


    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        table {
            border-collapse: collapse;
            margin-left: 100px; 
            width: 50%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: gray;
            color: white;
        }

        td {
            background-color: white;
            color: black;
        }

        h1 {
            margin-left: 25%;
            margin-top: 50px;
            margin-bottom: 40px;
            background-color: lightblue;
            font-size: 26px;
        }

        /* Additional styling for displaying information in rows and columns */
        .row {
            display: table-row;
            border: 1px solid black;
            margin-left: 50px;
        }

        .col {
            display: table-cell;
            margin-left: 50px;
            padding: 5px;
            border: 1px solid black;
        }

        .small-label {
            font-size: 1px;
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
            background-color: #32748e;
            color: white;
        }

        .nav a:hover:not(.active) {
            background-color: white;
            color: black;
        }

        .table-container {
            margin-left: 430px; /* adjust the value as needed */
        }

        .table-container1 {
            margin-left: 430px; /* adjust the value as needed */
            margin-top: -305px;
        }

        .table-container2 {
            margin-left: 430px; /* adjust the value as needed */
            margin-top: -305px;
        }

        .table-container table {
            margin-top: 20px;
        }

        .table-container h2 h4 {
            margin-bottom: 10px;
        }

        h2 {
            margin-bottom: 20px;
        }
        </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="nav">
            <a href="StudentPage.aspx" onclick="Home()">Home</a>
            <a href="CourseReg.aspx" onclick="showCourses">Courses</a>
            <a href="StudentMarks.aspx" onclick="showMarks()">Marks</a>
            <a href="StudentAttendance.aspx" class="active" onclick="showAttendance()">Attendance</a>
            <a href="StudentTranscript.aspx" onclick="showTranscript()">Transcript</a>
            <a href="StudentFeedback.aspx" onclick="showTranscript()">Feedback</a>
            
        </div>

        <h1>Student Attendance</h1>

<div class="table-container">
        <div>
            <h2>
                <asp:Label ID="Course1" runat="server" Text=""></asp:Label>
            </h2>

            <table>
                <asp:Repeater ID="MyRepeater" runat="server">
                    <HeaderTemplate>
                        <div class="row">
                            <div class="col">Lecture Number</div>
                            <div class="col">Duration (Hours)</div>
                            <div class="col">Status</div>
                        </div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="row">

                            <div class="col"><%# Eval("ATT_ID") %></div>
                            <div class="col"><%# Eval("duration_in_hours") %></div>
                            <div class="col"><%# Eval("ATT_STATUS") %></div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </table>

            <asp:Label ID="AttendancePercentageLabel" runat="server"></asp:Label>

        </div>

          <br><br>

<div class="table-container1">
    
        <div>
            <h2>
                <asp:Label ID="Course2" runat="server" Text=""></asp:Label>
            </h2>

            <table>
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <div class="row">
                            <div class="col">Lecture Number</div>
                            <div class="col">Duration (Hours)</div>
                            <div class="col">Status</div>
                        </div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="row">

                            <div class="col"><%# Eval("ATT_ID") %></div>
                            <div class="col"><%# Eval("duration_in_hours") %></div>
                            <div class="col"><%# Eval("ATT_STATUS") %></div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </table>

            <asp:Label ID="AttendanceLabel2" runat="server"></asp:Label>
        </div>


      <br><br>

<div class="table-container2">

        <div>
            <h2>
                <asp:Label ID="Course3" runat="server" Text=""></asp:Label>
            </h2>

            <table>
                <asp:Repeater ID="Repeater2" runat="server">
                    <HeaderTemplate>
                        <div class="row">
                            <div class="col">Lecture Number</div>
                            <div class="col">Duration (Hours)</div>
                            <div class="col">Status</div>
                        </div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="row">

                            <div class="col"><%# Eval("ATT_ID") %></div>
                            <div class="col"><%# Eval("duration_in_hours") %></div>
                            <div class="col"><%# Eval("ATT_STATUS") %></div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </table>

            <asp:Label ID="AttendanceLabel3" runat="server"></asp:Label>
        </div>

        </form>
         
</body>
</html>