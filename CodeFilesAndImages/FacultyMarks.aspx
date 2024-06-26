<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyMarks.aspx.cs" Inherits="FacultyMarks" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Marks</title>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .nav {
            width: 15%;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
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
            background-color: #FABDB9;
            color: black;
        }

        td {
            background-color: white;
            color: black;
        }

        h1{
            margin-left: 20%;
            margin-top: 50px;
            margin-bottom: 20px;
            background-color: #FF9999;
            font-size: 26px;
        }
        h3{
            margin-left: 25%;
            margin-top: 20px;
            margin-bottom: 40px;
        }

    
        .centered {
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

        .centered:hover {
          background-color: #FF9999;
          color: black;
          cursor: pointer;
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

        #lblErrorMessage {
        text-align:center;
        
        }

</style>

   
</head>
<body>
    <form id="form1" runat="server">


        <div class="nav">
            <a href="FacultyPage.aspx"  onclick="Home()">Home</a>
            <a href="FacultyMarks.aspx" class="active" onclick="showCourses">Marks</a>
            <a href="FacultyAttendance.aspx" onclick="showMarks()">Attendance</a>
            <a href="FacultyFeedback.aspx" onclick="showTranscript()">Feedback</a>
        </div>

        <h1>Update Marks</h1>
        <div>
             <h2>
                <asp:Label ID="SemesterLabel" runat="server" Text=""></asp:Label>
            </h2>

            <h3>
                Quiz
            </h3>
          
          <!-- Note that I have added a new TemplateField for the "Obtained Marks" column -->
              <asp:Repeater ID="MyRepeater" runat="server">
    <HeaderTemplate>
        <table>
            <thead>
                <tr>
                    <th>Serial Number</th>
                    <th>Obtained Marks</th>
                    <th>Total Marks</th>
                    <th>Average</th>
                    <th>Minimum</th>
                    <th>Maximum</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("M_ID") %></td>
            <td><asp:TextBox ID="txtObtainedMarks" runat="server" Text='<%# Eval("QUIZ_MARKS") %>'></asp:TextBox></td>
            <td><%# Eval("Q_TOTAL") %></td>
            <td><%# Eval("AVERAGE") %></td>
            <td><%# Eval("MINIMUM") %></td>
            <td><%# Eval("MAXIMUM") %></td>
            <asp:HiddenField ID="hdnM_ID" runat="server" Value='<%# Eval("M_ID") %>' />
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>
</asp:Repeater>


             <h3>
                Assignments
            </h3>
          
          <!-- Note that I have added a new TemplateField for the "Obtained Marks" column -->
              <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
        <table>
            <thead>
                <tr>
                    <th>Serial Number</th>
                    <th>Obtained Marks</th>
                    <th>Total Marks</th>
                    <th>Average</th>
                    <th>Minimum</th>
                    <th>Maximum</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("M_ID") %></td>
            <td><asp:TextBox ID="txtObtainedMarks" runat="server" Text='<%# Eval("ASSIGNMENT_MARKS") %>'></asp:TextBox></td>
            <td><%# Eval("A_TOTAL") %></td>
            <td><%# Eval("AVERAGE") %></td>
            <td><%# Eval("MINIMUM") %></td>
            <td><%# Eval("MAXIMUM") %></td>
            <asp:HiddenField ID="hdnM_ID" runat="server" Value='<%# Eval("M_ID") %>' />
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>
</asp:Repeater>

            <h3>
                Lab Task
            </h3>
          
          <!-- Note that I have added a new TemplateField for the "Obtained Marks" column -->
              <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
        <table>
            <thead>
                <tr>
                    <th>Serial Number</th>
                    <th>Obtained Marks</th>
                    <th>Total Marks</th>
                    <th>Average</th>
                    <th>Minimum</th>
                    <th>Maximum</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("M_ID") %></td>
            <td><asp:TextBox ID="txtObtainedMarks" runat="server" Text='<%# Eval("LAB_MARKS") %>'></asp:TextBox></td>
            <td><%# Eval("LM_TOTAL") %></td>
            <td><%# Eval("AVERAGE") %></td>
            <td><%# Eval("MINIMUM") %></td>
            <td><%# Eval("MAXIMUM") %></td>
            <asp:HiddenField ID="hdnM_ID" runat="server" Value='<%# Eval("M_ID") %>' />
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>
</asp:Repeater>

   
            <h3>
                Final Marks
            </h3>
          
          <!-- Note that I have added a new TemplateField for the "Obtained Marks" column -->
              <asp:Repeater ID="Repeater3" runat="server">
    <HeaderTemplate>
        <table>
            <thead>
                <tr>
                    <th>Serial Number</th>
                    <th>Obtained Marks</th>
                    <th>Total Marks</th>
                    <th>Average</th>
                    <th>Minimum</th>
                    <th>Maximum</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("M_ID") %></td>
            <td><asp:TextBox ID="txtObtainedMarks" runat="server" Text='<%# Eval("FINALS_MARKS") %>'></asp:TextBox></td>
            <td><%# Eval("F_TOTAL") %></td>
            <td><%# Eval("AVERAGE") %></td>
            <td><%# Eval("MINIMUM") %></td>
            <td><%# Eval("MAXIMUM") %></td>
            <asp:HiddenField ID="hdnM_ID" runat="server" Value='<%# Eval("M_ID") %>' />
        </tr>
    </ItemTemplate>


    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>
</asp:Repeater>


        </div>


          <asp:Button ID="BtnSaveMarks" runat="server" Text="Save Marks" OnClick="BtnSaveMarks_Click" CssClass="centered" />
          <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" OnClick="btnGenerateReport_Click"  CssClass="genFeedback"/>
                    
    </form>
</body>
</html>

