<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseReg.aspx.cs" Inherits="CourseReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Course Registration</title>

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

        .centered {
          display: block;
          margin: 0 auto;
          border: 3px solid transparent;
          border-radius: 10px;
          background-color: lightblue;
          color: black;
          font-size: 1.1em;
          padding: 10px 20px;
          text-align: center;
          margin-top: 30px
        }

        .centered:hover {
          background-color: #32748e;
          cursor: pointer;
          color: white;
        }


        #lblErrorMessage
        {
            text-align:center;
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
    <form id="form1" runat="server">

        <div class="nav">
            <a href="StudentPage.aspx" onclick="Home()">Home</a>
            <a href="CourseReg.aspx" class="active" onclick="showCourses">Courses</a>
            <a href="StudentMarks.aspx" onclick="showMarks()">Marks</a>
            <a href="StudentAttendance.aspx" onclick="showAttendance()">Attendance</a>
            <a href="StudentTranscript.aspx" onclick="showTranscript()">Transcript</a>
            <a href="StudentFeedback.aspx" onclick="showTranscript()">Feedback</a>
        </div>


        <h1>Course Registration</h1>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>Course</th>
                        <th>Section</th>
                        <th>Pre-Requisite</th>
                        <th>Credit Hours</th>
                        <th>Enrollment Status</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="MyRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("COURSE") %></td>
                                <td><%# Eval("SECTION") %></td>
                                <td><%# Eval("C_PRE_REQ") %></td>
                                <td><%# Eval("C_CREDIT_HOURS") %></td>
                                <td>
                                    <asp:CheckBox ID="chkStatus" runat="server" OnCheckedChanged="OnStatusChanged" AutoPostBack="true" />
                                    <asp:HiddenField ID="CourseID" runat="server" Value='<%# Eval("COURSE") %>' />
                                    <asp:HiddenField ID="Section" runat="server" Value='<%# Eval("SECTION") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
      <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="centered" />
      <asp:Label ID="lblErrorMessage" runat="server" Visible="false" Text="You cannot register for more than 5 courses." ForeColor="Red" CssClass="centered"></asp:Label>
      <asp:Label ID="lblEMLess" runat="server" Visible="false" Text="Please select upto 5 courses." ForeColor="Red" CssClass="centered"></asp:Label>
      <asp:Label ID="lblSuccessMessage" runat="server" Visible="false" Text="Courses Registered Successfully" ForeColor="Green" CssClass="centered"></asp:Label>
    </form>
</body>
</html>
