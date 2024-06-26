using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class StudentAttendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string rollNumber = (string)Session["rollNumber"];
        if (!IsPostBack)
        {

            string courseId = ""; // course ID for which the attendance is being shown
            string courseName = "";
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                connection.Open();
                SqlCommand command = new SqlCommand($"SELECT distinct a.COURSE_ID, c.C_NAME FROM attendance a inner join COURSE c on c.C_ID = a.COURSE_ID WHERE std_id = '{rollNumber}'", connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    courseId = reader.GetString(0);
                    courseName = reader.GetString(1);
                    //cgpa = reader.GetDecimal(1);
                    //sgpa = reader.GetDecimal(2);
                }
                reader.Close();
            }

            // Set the text of the SemesterLabel control to display the semester name, CGPA, and SGPA for Fall 2021
            //  courseId.Text = $"{courseId}";
            Course1.Text = $"{courseId} {courseName}";

            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand(@"SELECT ATT_ID, duration_in_hours, ATT_STATUS FROM ATTENDANCE WHERE COURSE_ID = @CourseId", connection);
                command.Parameters.AddWithValue("@CourseId", courseId);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                MyRepeater.DataSource = dataTable;
                MyRepeater.DataBind();
            }
        }

        string _connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";

        // Define the SQL query to retrieve the attendance percentage
        string _query = "SELECT COUNT(CASE ATT_STATUS WHEN 'P' THEN 1 END) * 100 / COUNT(*) AS ATT_PERCENTAGE FROM ATTENDANCE Where COURSE_ID = 'CS1002'";

        // Define a SqlConnection object to connect to the database
        using (SqlConnection _connection = new SqlConnection(_connectionString))
        {
            // Define a SqlCommand object to execute the query
            SqlCommand _command = new SqlCommand(_query, _connection);

            // Open the database connection
            _connection.Open();

            // Execute the query and retrieve the attendance percentage
            int attendancePercentage = (int)_command.ExecuteScalar();

            // Close the database connection
            _connection.Close();

            // Update the label with the attendance percentage
            AttendancePercentageLabel.Text = "Attendance Percentage: " + attendancePercentage + "%";
        }

        //if (!IsPostBack)
        //{
        //    string courseId = "ENG101"; // course ID for which the attendance is being shown
        //    Course2.Text = "Course " + courseId;

        //    string connectionString = "Data Source=DESKTOP-99GHBFU\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";
        //    SqlConnection connection = new SqlConnection(connectionString);
        //    connection.Open();

        //    string query = "SELECT ATT_ID, duration_in_hours, ATT_STATUS FROM ATTENDANCE WHERE COURSE_ID = @CourseId";
        //    SqlCommand command = new SqlCommand(query, connection);
        //    command.Parameters.AddWithValue("@CourseId", courseId);

        //    SqlDataReader reader = command.ExecuteReader();
        //    Repeater1.DataSource = reader;
        //    Repeater1.DataBind();

        //    reader.Close();
        //    connection.Close();
        //}
        if (!IsPostBack)
        {
            string courseId = ""; // course ID for which the attendance is being shown
            string courseName = "";
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                connection.Open();
                SqlCommand command = new SqlCommand($"SELECT distinct top(2) a.COURSE_ID, c.C_NAME FROM attendance a inner join COURSE c on c.C_ID = a.COURSE_ID WHERE std_id = '{rollNumber}'", connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    courseId = reader.GetString(0);
                    courseName = reader.GetString(1);
                    //cgpa = reader.GetDecimal(1);
                    //sgpa = reader.GetDecimal(2);
                }
                reader.Close();
            }

            // Set the text of the SemesterLabel control to display the semester name, CGPA, and SGPA for Fall 2021
            //  courseId.Text = $"{courseId}";
            Course2.Text = $"{courseId} {courseName}";

            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand(@"SELECT ATT_ID, duration_in_hours, ATT_STATUS FROM ATTENDANCE WHERE COURSE_ID = @CourseId", connection);
                command.Parameters.AddWithValue("@CourseId", courseId);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                Repeater1.DataSource = dataTable;
                Repeater1.DataBind();
            }
        }


        // Define the SQL query to retrieve the attendance percentage
        string query_ = "SELECT COUNT(CASE ATT_STATUS WHEN 'P' THEN 1 END) * 100 / COUNT(*) AS ATT_PERCENTAGE FROM ATTENDANCE Where COURSE_ID = 'ENG101'";

        // Define a SqlConnection object to connect to the database
        using (SqlConnection _connection = new SqlConnection(_connectionString))
        {
            // Define a SqlCommand object to execute the query
            SqlCommand _command = new SqlCommand(query_, _connection);

            // Open the database connection
            _connection.Open();

            // Execute the query and retrieve the attendance percentage
            int attendancePercentage = (int)_command.ExecuteScalar();

            // Close the database connection
            _connection.Close();

            // Update the label with the attendance percentage
            AttendanceLabel2.Text = "Attendance Percentage: " + attendancePercentage + "%";
        }


        if (!IsPostBack)
        {
            //string courseId = "MTH202"; // course ID for which the attendance is being shown
            //Course3.Text = "Course " + courseId;

            //string connectionString = "Data Source=DESKTOP-99GHBFU\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";
            //SqlConnection connection = new SqlConnection(connectionString);
            //connection.Open();

            //string query = "SELECT ATT_ID, duration_in_hours, ATT_STATUS FROM ATTENDANCE WHERE COURSE_ID = @CourseId";
            //SqlCommand command = new SqlCommand(query, connection);
            //command.Parameters.AddWithValue("@CourseId", courseId);

            //SqlDataReader reader = command.ExecuteReader();
            //Repeater2.DataSource = reader;
            //Repeater2.DataBind();

            //reader.Close();
            //connection.Close();

            string courseId = ""; // course ID for which the attendance is being shown
            string courseName = "";
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                connection.Open();
                SqlCommand command = new SqlCommand($"SELECT distinct top(2) a.COURSE_ID, c.C_NAME FROM attendance a inner join COURSE c on c.C_ID = a.COURSE_ID WHERE std_id = '{rollNumber}'", connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    courseId = reader.GetString(0);
                    courseName = reader.GetString(1);
                    //cgpa = reader.GetDecimal(1);
                    //sgpa = reader.GetDecimal(2);
                }
                reader.Close();
            }

            // Set the text of the SemesterLabel control to display the semester name, CGPA, and SGPA for Fall 2021
            //  courseId.Text = $"{courseId}";
            Course3.Text = $"{courseId} {courseName}";

            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand(@"SELECT ATT_ID, duration_in_hours, ATT_STATUS FROM ATTENDANCE WHERE COURSE_ID = @CourseId", connection);
                command.Parameters.AddWithValue("@CourseId", courseId);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                Repeater2.DataSource = dataTable;
                Repeater2.DataBind();
            }

        }

        string _query_ = "SELECT COUNT(CASE ATT_STATUS WHEN 'P' THEN 1 END) * 100 / COUNT(*) AS ATT_PERCENTAGE FROM ATTENDANCE Where COURSE_ID = 'MTH202'";

        // Define a SqlConnection object to connect to the database
        using (SqlConnection _connection = new SqlConnection(_connectionString))
        {
            // Define a SqlCommand object to execute the query
            SqlCommand _command = new SqlCommand(_query_, _connection);

            // Open the database connection
            _connection.Open();

            // Execute the query and retrieve the attendance percentage
            int attendancePercentage = (int)_command.ExecuteScalar();

            // Close the database connection
            _connection.Close();

            // Update the label with the attendance percentage
            AttendanceLabel3.Text = "Attendance Percentage: " + attendancePercentage + "%";
        }

    }

}
