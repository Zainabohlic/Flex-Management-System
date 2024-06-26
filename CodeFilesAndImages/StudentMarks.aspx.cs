using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class StudentMarks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Retrieve data from the database and bind it to the Repeater
        using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
        {
            string rollNumber = (string)Session["rollNumber"];
            SqlCommand command = new SqlCommand("SELECT ID_COURSE, ASSIGNMENT_MARKS, A_TOTAL, QUIZ_MARKS, Q_TOTAL, FINALS_MARKS, F_TOTAL FROM MARKS where STUDENTID = @rollNumber", connection);
            command.Parameters.AddWithValue("@rollNumber", rollNumber);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            MyRepeater.DataSource = dataTable;
            MyRepeater.DataBind();

        }
    }
}