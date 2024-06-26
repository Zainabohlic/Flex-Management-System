<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyFeedback.aspx.cs" Inherits="FacultyFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Feedback</title>

    <style>

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        h1 {
            margin-left: 50px;
            margin-top: 50px;
            margin-bottom: 40px;
            background-color: #FF9999;
            font-size: 26px;
        }

        table {
            border-collapse: collapse;
            margin-left: 390px;

            width: 50%;
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

        .genFeedback {
          display: block;
          margin: 0 auto;
          border: 3px solid transparent;
          border-radius: 10px;
          background-color: #FABDB9;
          color: white;
          font-size: 1.1em;
          padding: 10px 20px;
          text-align: center;
          margin-top: 40px;
          margin-bottom: 50px;
        }

        .genFeedback:hover {
          background-color: #FF9999;
          color: black;
          cursor: pointer;
        }


    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="nav">
            <a href="FacultyPage.aspx"  onclick="Home()">Home</a>
            <a href="FacultyMarks.aspx" onclick="showCourses">Marks</a>
            <a href="FacultyAttendance.aspx"  onclick="showMarks()">Attendance</a>
            <a href="FacultyFeedback.aspx" class="active" onclick="showTranscript()">Feedback</a>
        </div>


<div style="margin-left: 20%;">
        <h1>Feedback</h1>

    <h2>
        <asp:Label ID="Feed" runat="server" Text=""></asp:Label>
    </h2>

</div>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Average Score in 1</th>
                        <th>Average Score in 2</th>
                        <th>Average Score in 3</th>
                        <th>Average Score in 4</th>
                        <th>Comments</th>
                    </tr>
                </thead>
                <tbody>
 <asp:Repeater ID="MyRepeater" runat="server">
    <ItemTemplate>
        <tr>
            <td><%# Eval("row1") %></td>
            <td><%# Eval("row2") %></td>
            <td><%# Eval("row3") %></td>
            <td><%# Eval("row4") %></td>
            <td><%# Eval("comment") %></td>

        </tr>
    </ItemTemplate>
</asp:Repeater>



                </tbody>
            </table>
        </div>


        <div>
            <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" OnClick="btnGenerateReport_Click"  CssClass="genFeedback"/>
        </div>

    </form>
</body>
</html>
