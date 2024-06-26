<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentPage.aspx.cs" Inherits="StudentPage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Info</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        table {
            border-collapse: collapse;
            margin-left: 50px; 
            width: 50%;
/*            margin-top: 20px;
            margin-bottom: 20px;*/
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

        h1 {
            margin-left: 50px;
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
            background-color: #32748e;
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
            <a href="StudentPage.aspx" class="active" onclick="Home()">Home</a>
            <a href="CourseReg.aspx" onclick="showCourses">Courses</a>
            <a href="StudentMarks.aspx" onclick="showMarks()">Marks</a>
            <a href="StudentAttendance.aspx" onclick="showAttendance()">Attendance</a>
            <a href="StudentTranscript.aspx" onclick="showTranscript()">Transcript</a>
            <a href="StudentFeedback.aspx" onclick="showTranscript()">Feedback</a>
        </div>

        <div style="margin-left: 20%;">
            <h1>University Information</h1>

            <div>
                <table>
                    <asp:Repeater ID="MyRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <th>Roll Number</th>
                                <td><%# Eval("S_ROLL_NO") %></td>
                            </tr>
                            <tr>
                                <th>Section</th>
                                <td><%# Eval("S_SECTION") %></td>
                            </tr>
                            <tr>
                                <th>Degree</th>
                                <td><%# Eval("S_DEGREE") %></td>
                            </tr>
                            <tr>
                                <th>Campus</th>
                                <td><%# Eval("S_CAMPUS") %></td>
                            </tr>
                            <tr>
                                <th>Batch</th>
                                <td><%# Eval("S_BATCH") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            

              <h1>
    Personal Information
    </h1>

<div>
    <table>
         <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
        <tr>
            <th>Name</th>
            <td><%# Eval("S_NAME") %></td>
        </tr>
        <tr>
            <th>Date Of Birth</th>
            <td><%# Eval("S_DOB") %></td>
        </tr>
        <tr>
            <th>Gender</th>
            <td><%# Eval("S_GENDER") %></td>
        </tr>
        <tr>
            <th>CNIC</th>
            <td><%# Eval("S_CNIC") %></td>
        </tr>
        <tr>
            <th>Nationality</th>
            <td><%# Eval("S_NATIONALITY") %></td>
        </tr>

         <tr>
            <th>Email</th>
            <td><%# Eval("S_EMAIL") %></td>
        </tr>

         <tr>
            <th>Mobile Number</th>
            <td><%# Eval("S_PHONE") %></td>
        </tr>
                </ItemTemplate>
                </asp:Repeater>
    </table>
</div>
            </div>
        <div id="chartDiv" style="margin-left: 21.5%; margin-top: 8%;">
                <canvas id="myChart" width="800" height="400"></canvas>
        </DIV>
    </form>


            <script>
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Semester 1', 'Semester 2', 'Semester 3', 'Semester 4', 'Semester 5', 'Semester 6', 'Semester 7', 'Semester 8'],
                datasets: [{
                    label: 'SGPA',
                    data: [3.2,2.8, 3.5, 4.0],
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: false,
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
            </script>

</body>
</html>
