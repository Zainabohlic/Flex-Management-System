<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentMarks.aspx.cs" Inherits="StudentMarks" %>

<!DOCTYPE html>

<html>
<head>
    <title>Student Marks</title>
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
    <form runat="server">


        <div class="nav">
            <a href="StudentPage.aspx" onclick="Home()">Home</a>
            <a href="CourseReg.aspx" onclick="showCourses">Courses</a>
            <a href="StudentMarks.aspx" class="active"  onclick="showMarks()">Marks</a>
            <a href="StudentAttendance.aspx" onclick="showAttendance()">Attendance</a>
            <a href="StudentTranscript.aspx" onclick="showTranscript()">Transcript</a>
            <a href="StudentFeedback.aspx" onclick="showTranscript()">Feedback</a>
        </div>


        <div>
             <h1>Student Marks</h1>
            <table>
                <tr>
         
                    <th>Course Name</th>
                    <th>Assignments</th>
                    <th>Assignments Total</th>
                    <th>Quizzes</th>
                    <th>Quizzes Total</th>
                    <th>Exams</th>
                    <th>Exams Total</th>

                </tr>
                <asp:Repeater ID="MyRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                          
                            <td><%# Eval("ID_COURSE") %></td>
                            <td><%# Eval("ASSIGNMENT_MARKS") %></td>
                            <td><%# Eval("A_TOTAL") %></td>
                            <td><%# Eval("QUIZ_MARKS") %></td>
                            <td><%# Eval("Q_TOTAL") %></td>
                            <td><%# Eval("FINALS_MARKS") %></td>
                            <td><%# Eval("F_TOTAL") %></td>

                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>
