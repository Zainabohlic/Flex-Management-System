<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyPage.aspx.cs" Inherits="FacultyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Information</title>

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
            background-color: #FABDB9;
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
            background-color: #FF9999;
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
            background-color: #FF9999;
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
            <a href="FacultyPage.aspx" class="active" onclick="Home()">Home</a>
            <a href="FacultyMarks.aspx" onclick="showCourses">Marks</a>
            <a href="FacAttendance.aspx" onclick="showMarks()">Attendance</a>
            <a href="FacultyFeedback.aspx" onclick="showTranscript()">Feedback</a>
        </div>


        <div style="margin-left: 20%;">
            <h1>University Information</h1>

            <div>
                <table>
                    <asp:Repeater ID="MyRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <th>Faculty ID</th>
                                <td><%# Eval("F_ID") %></td>
                            </tr>
                            <tr>
                                <th>Department</th>
                                <td><%# Eval("F_DEP") %></td>
                            </tr>
                            <tr>
                                <th>Course</th>
                                <td><%# Eval("F_COURSE") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>



            <h1>Personal Information</h1>

            <div>
                <table>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <th>Name</th>
                                <td><%# Eval("F_NAME") %></td>
                            </tr>
                            <tr>
                                <th>Date of birth</th>
                                <td><%# Eval("F_DOB") %></td>
                            </tr>
                            <tr>
                                <th>CNIC</th>
                                <td><%# Eval("F_CNIC") %></td>
                            </tr>
                            <tr>
                                <th>Nationality</th>
                                <td><%# Eval("F_NATIONALITY") %></td>
                            </tr>
                             <tr>
                                <th>Email</th>
                                <td><%# Eval("F_EMAIL") %></td>
                            </tr>
                             <tr>
                                <th>Phone</th>
                                <td><%# Eval("F_PHONE") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>

        </form>
    </body>
    </html>

