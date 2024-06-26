using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Retrieve data from the database and bind it to the Repeater
        using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
        {
            //string rollNumber = (string)Session["rollNumber"];
            SqlCommand command = new SqlCommand("select DISTINCT C.C_ID, C.C_NAME, C.C_CREDIT_HOURS, C.COURSE_TYPE, F.F_ID, F.F_NAME from COURSE C INNER JOIN FACULTY F ON F.F_COURSE = C.C_ID;", connection);
            //  command.Parameters.AddWithValue("@rollNumber", rollNumber);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            MyRepeater.DataSource = dataTable;
            MyRepeater.DataBind();

        }
    }
}