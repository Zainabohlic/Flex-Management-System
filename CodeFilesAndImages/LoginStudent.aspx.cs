using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class LoginStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login_btn(object sender, EventArgs e)
    {
        string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";
        string username = ((TextBox)FindControl("txtUsername")).Text;
        string password = ((TextBox)FindControl("txtPassword")).Text;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT * FROM SIGN_IN WHERE username=@Username AND pw=@Password", connection);
            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@Password", password);
            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                // Login successful - store the roll number in a session variable and redirect to next page
                reader.Read();
                Session["rollNumber"] = reader.GetString(reader.GetOrdinal("S_ROLL_NO"));
                Response.Redirect("StudentPage.aspx");
            }

            else
            {
                // Login failed - display error message
                //  lblError.Text = "Invalid username or password.";
            }

            reader.Close();
        }
    }
}