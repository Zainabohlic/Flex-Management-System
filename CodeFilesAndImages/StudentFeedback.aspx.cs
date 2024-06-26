using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class StudentFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        proceedButton.Click += new EventHandler(ProceedButton_Click);
    }

    public void ProceedButton_Click(object sender, EventArgs e)
    {
        string date = Request.Form["lite_mode_16"];
        string first = Request.Form["q3_nameOf[first]"];
        string last = Request.Form["q3_nameOf[last]"];
        string subject = Request.Form["q4_subject"].ToString();
        string office = Request.Form["q6_roomNumber"].ToString();
        int r0 = int.Parse(Request.Form["q11_appearanceAnd11[0]"]);
        int r1 = int.Parse(Request.Form["q11_appearanceAnd11[1]"]);
        int r2 = int.Parse(Request.Form["q11_appearanceAnd11[2]"]);
        int r3 = int.Parse(Request.Form["q11_appearanceAnd11[3]"]);
        int r4 = int.Parse(Request.Form["q11_appearanceAnd11[4]"]);
        string comment = Request.Form["q15_comments"];
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True");
        connection.Open();
        string query = "INSERT INTO FEEDBACK (Date, fname, lname, subject, office, row1, row2, row3, row4, comment) VALUES (@Date, @Fname, @Lname, @Subject, @Office, @Row1, @Row2, @Row3, @Row4, @Comment)";
        SqlCommand cmd = new SqlCommand(query, connection);
        cmd.Parameters.AddWithValue("@Date", date);
        cmd.Parameters.AddWithValue("@Fname", first);
        cmd.Parameters.AddWithValue("@Lname", last);
        cmd.Parameters.AddWithValue("@Subject", subject);
        cmd.Parameters.AddWithValue("@Office", office);
        cmd.Parameters.AddWithValue("@Row1", r1);
        cmd.Parameters.AddWithValue("@Row2", r2);
        cmd.Parameters.AddWithValue("@Row3", r3);
        cmd.Parameters.AddWithValue("@Row4", r4);
        cmd.Parameters.AddWithValue("@Comment", comment);
        cmd.ExecuteNonQuery();
        Response.Redirect("StudentPage.aspx");
    }
}