using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CourseReg : System.Web.UI.Page
{
    public List<string> SGPAValues { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Retrieve data from the database and bind it to the Repeater
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand("SELECT E.COURSE, E.SECTION, E.ENR_STATUS, C.C_PRE_REQ, C.C_CREDIT_HOURS FROM ENROLLED E INNER JOIN COURSE C ON C.C_ID = E.COURSE WHERE E.STUDENTID = @rollNumber", connection);
                command.Parameters.AddWithValue("@rollNumber", "21I2575");
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Set default selected value of drop-down list to "-"
                foreach (RepeaterItem item in MyRepeater.Items)
                {
                    CheckBox chkStatus = (CheckBox)item.FindControl("chkStatus");
                    chkStatus.Checked = false;
                }

                MyRepeater.DataSource = dataTable;
                MyRepeater.DataBind();
            }
        }
    }

    protected void OnStatusChanged(object sender, EventArgs e)
    {
        // Nothing needs to be done here since we're using checkboxes instead of a dropdown menu
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        int numCourses = 0;
        string enrolledStudentID = "21I2575"; // replace with the actual student ID

        foreach (RepeaterItem item in MyRepeater.Items)
        {
            CheckBox chkStatus = item.FindControl("chkStatus") as CheckBox;

            if (chkStatus != null && chkStatus.Checked)
            {
                numCourses++;

                // Retrieve the ID and section of the course being registered
                string courseID = ((HiddenField)item.FindControl("CourseID")).Value;
                string section = ((HiddenField)item.FindControl("Section")).Value;

                // Update the ENR_STATUS value in the database to 'REGISTERED'
                using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
                {
                    SqlCommand command = new SqlCommand("UPDATE ENROLLED SET ENR_STATUS = 'REGISTERED' WHERE COURSE = @courseID AND SECTION = @section AND STUDENTID = @studentID", connection);
                    command.Parameters.AddWithValue("@courseID", courseID);
                    command.Parameters.AddWithValue("@section", section);
                    command.Parameters.AddWithValue("@studentID", enrolledStudentID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        if (numCourses > 5)
        {
            lblEMLess.Visible = false;
            lblErrorMessage.Visible = true;
            lblSuccessMessage.Visible = false;
        }

        else if  (numCourses < 5)
        {
            lblEMLess.Visible = true;
            lblErrorMessage.Visible = false;
            lblSuccessMessage.Visible = false;
        }

        else if (numCourses == 5)
        {
            // Register the selected courses
            lblSuccessMessage.Visible = true;
            lblErrorMessage.Visible = false;
            lblEMLess.Visible = false;
        }
    }
}