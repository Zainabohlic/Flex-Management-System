using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class StudentTranscript : System.Web.UI.Page
{
    public List<string> SGPAValues { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string rollNumber = (string)Session["rollNumber"];

            // Fetch the semester name, CGPA, and SGPA from the database for Fall 2021 for the logged-in user
            string semesterName = "";
            decimal cgpa = 0;
            decimal sgpa = 0;
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                connection.Open();
                SqlCommand command = new SqlCommand($"SELECT SEMESTER_NAME, CGPA, SGPA FROM TRANSCRIPT WHERE SEMESTER_NAME = 'Fall 2021' AND STUDENT = '{rollNumber}'", connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    semesterName = reader.GetString(0);
                    cgpa = reader.GetDecimal(1);
                    sgpa = reader.GetDecimal(2);
                }
                reader.Close();
            }

            // Set the text of the SemesterLabel control to display the semester name, CGPA, and SGPA for Fall 2021
            SemesterLabel.Text = $"{semesterName} (CGPA: {cgpa}, SGPA: {sgpa})";

            // Retrieve data from the database and bind it to the Repeater for Fall 2021 for the logged-in user
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand($"SELECT t.COURSE, c.C_NAME, c.C_CREDIT_HOURS, t.GRADE, t.GRADE_POINT, C.COURSE_TYPE " +
                                                    $"FROM TRANSCRIPT t " +
                                                    $"INNER JOIN COURSE c ON c.C_ID = t.COURSE " +
                                                    $"WHERE t.SEMESTER_NAME = 'Fall 2021' AND t.STUDENT = '{rollNumber}'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                MyRepeater.DataSource = dataTable;
                MyRepeater.DataBind();
            }

            // Fetch the semester name, CGPA, and SGPA from the database for Spring 2021 for the logged-in user
            string _semesterName = "";
            decimal _cgpa = 0;
            decimal _sgpa = 0;
            using (SqlConnection _connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                _connection.Open();
                SqlCommand _command = new SqlCommand($"SELECT SEMESTER_NAME, CGPA, SGPA FROM TRANSCRIPT WHERE SEMESTER_NAME = 'Spring 2021' AND STUDENT = '{rollNumber}'", _connection);
                SqlDataReader _reader = _command.ExecuteReader();
                if (_reader.Read())
                {
                    _semesterName = _reader.GetString(0);
                    _cgpa = _reader.GetDecimal(1);
                    _sgpa = _reader.GetDecimal(2);
                }
                _reader.Close();
            }

            // Set the text of the Label1 control to display the semester name, CGPA, and SGPA for Spring 2021
            Label1.Text = $"{_semesterName} (CGPA: {_cgpa}, SGPA: {_sgpa})";




            // Retrieve data from the database and bind it to the Repeater for Fall 2021
            using (SqlConnection _connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand _command = new SqlCommand(
                                                     $"SELECT t.COURSE, c.C_NAME, c.C_CREDIT_HOURS, t.GRADE, t.GRADE_POINT, C.COURSE_TYPE " +
                                                     $"FROM TRANSCRIPT t " +
                                                     $"INNER JOIN COURSE c ON c.C_ID = t.COURSE " +
                                                     $"WHERE t.SEMESTER_NAME = 'Fall 2021' AND t.STUDENT = '{rollNumber}'", _connection);
                SqlDataAdapter _adapter = new SqlDataAdapter(_command);
                DataTable _dataTable = new DataTable();
                _adapter.Fill(_dataTable);
                Repeater1.DataSource = _dataTable;
                Repeater1.DataBind();
            }


        }
    }
}