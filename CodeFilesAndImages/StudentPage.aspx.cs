using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class StudentPage : System.Web.UI.Page
{
    public List<string> sgpaValues { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Retrieve data from the database and bind it to the Repeater
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                string rollNumber = (string)Session["rollNumber"];
                SqlCommand command = new SqlCommand("SELECT S_ROLL_NO, S_SECTION, S_DEGREE, S_CAMPUS, S_BATCH FROM STUDENTS WHERE S_ROLL_NO = @rollNumber", connection);
                command.Parameters.AddWithValue("@rollNumber", rollNumber);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                MyRepeater.DataSource = dataTable;
                MyRepeater.DataBind();

                SqlCommand command_ = new SqlCommand("SELECT S_NAME, S_DOB, S_GENDER, S_CNIC, S_NATIONALITY, S_EMAIL, S_PHONE FROM STUDENTS WHERE S_ROLL_NO = @rollNumber", connection);
                command_.Parameters.AddWithValue("@rollNumber", rollNumber);
                SqlDataAdapter adapter_ = new SqlDataAdapter(command_);
                DataTable dataTable_ = new DataTable();
                adapter_.Fill(dataTable_);
                Repeater1.DataSource = dataTable_;
                Repeater1.DataBind();
            }
        }
    }


}