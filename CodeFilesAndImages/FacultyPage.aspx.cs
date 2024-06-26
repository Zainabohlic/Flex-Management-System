using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class FacultyPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string username = (string)Session["username"];
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand("SELECT F_ID, F_DEP, F_COURSE FROM FACULTY WHERE F_ID = @username", connection);
                command.Parameters.AddWithValue("@username", username);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                MyRepeater.DataSource = dataTable;
                MyRepeater.DataBind();

                SqlCommand command_ = new SqlCommand("SELECT F_NAME, F_DOB, F_CNIC, F_NATIONALITY, F_EMAIL, F_PHONE FROM FACULTY WHERE F_ID = @username", connection);
                command_.Parameters.AddWithValue("@username", username);
                SqlDataAdapter adapter_ = new SqlDataAdapter(command_);
                DataTable dataTable_ = new DataTable();
                adapter_.Fill(dataTable_);
                Repeater1.DataSource = dataTable_;
                Repeater1.DataBind();
            }
        }
    }
}