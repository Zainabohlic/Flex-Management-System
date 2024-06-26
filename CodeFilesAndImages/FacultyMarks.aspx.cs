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

public partial class FacultyMarks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Retrieve data from the database and bind it to the Repeater
            string courseId = "";
            string coursename = "";
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT DISTINCT m.ID_COURSE , C.C_NAME FROM MARKS m INNER JOIN COURSE C ON C.C_ID = M.ID_COURSE WHERE FAC_ID = 'F001';", connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    courseId = reader.GetString(0);
                    coursename = reader.GetString(1);

                }
                reader.Close();
            }
            SemesterLabel.Text = $"{courseId} {coursename}";



            //quiz
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand("SELECT M.M_ID, M.QUIZ_MARKS, M.Q_TOTAL, AVG(M.QUIZ_MARKS) AS AVERAGE, MIN(M.QUIZ_MARKS) AS MINIMUM, MAX(M.QUIZ_MARKS) AS MAXIMUM FROM MARKS M WHERE M.ID_COURSE = 'CS1002' AND M.FAC_ID = 'F001' GROUP BY M.M_ID, M.QUIZ_MARKS, M.Q_TOTAL", connection);
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


            //ASSIGNEMTN
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand("SELECT M.M_ID, M.ASSIGNMENT_MARKS, M.A_TOTAL, AVG(M.ASSIGNMENT_MARKS) AS AVERAGE, MIN(M.ASSIGNMENT_MARKS) AS MINIMUM, MAX(M.ASSIGNMENT_MARKS) AS MAXIMUM FROM MARKS M WHERE  M.ID_COURSE = 'CS1002' AND M.FAC_ID = 'F001' GROUP BY M.M_ID, M.A_TOTAL, M.ASSIGNMENT_MARKS, M.ASSIGNMENT_MARKS", connection);
                command.Parameters.AddWithValue("@rollNumber", "21I2575");
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Set default selected value of drop-down list to "-"
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    CheckBox chkStatus = (CheckBox)item.FindControl("chkStatus");
                    chkStatus.Checked = false;
                }

                Repeater1.DataSource = dataTable;
                Repeater1.DataBind();
            }
            //LAB WORK
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand("SELECT M.M_ID, M.LAB_MARKS, M.LM_TOTAL, AVG(M.LAB_MARKS) AS AVERAGE, MIN(M.LAB_MARKS) AS MINIMUM, MAX(M.LAB_MARKS) AS MAXIMUM FROM MARKS M WHERE  M.ID_COURSE = 'CS1002' AND M.FAC_ID = 'F001' GROUP BY M.M_ID, M.LM_TOTAL, M.LAB_MARKS", connection);
                command.Parameters.AddWithValue("@rollNumber", "21I2575");
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Set default selected value of drop-down list to "-"
                foreach (RepeaterItem item in Repeater2.Items)
                {
                    CheckBox chkStatus = (CheckBox)item.FindControl("chkStatus");
                    chkStatus.Checked = false;
                }

                Repeater2.DataSource = dataTable;
                Repeater2.DataBind();
            }

            //FINAL

            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand("SELECT TOP(1) M.M_ID, M.FINALS_MARKS, M.F_TOTAL, AVG(M.FINALS_MARKS) AS AVERAGE, MIN(M.FINALS_MARKS) AS MINIMUM, MAX(M.FINALS_MARKS) AS MAXIMUM FROM MARKS M WHERE  M.ID_COURSE = 'CS1002' AND M.FAC_ID = 'F001' GROUP BY M.M_ID, M.F_TOTAL, M.FINALS_MARKS", connection);
                command.Parameters.AddWithValue("@rollNumber", "21I2575");
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Set default selected value of drop-down list to "-"
                foreach (RepeaterItem item in Repeater3.Items)
                {
                    CheckBox chkStatus = (CheckBox)item.FindControl("chkStatus");
                    chkStatus.Checked = false;
                }

                Repeater3.DataSource = dataTable;
                Repeater3.DataBind();
            }

        }
    }

    protected void BtnSaveMarks_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in MyRepeater.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the relevant controls within the repeater item
                HiddenField hdnM_ID = (HiddenField)item.FindControl("hdnM_ID");
                TextBox txtObtainedMarks = (TextBox)item.FindControl("txtObtainedMarks");

                // Retrieve the relevant data from the controls
                int m_id = int.Parse(hdnM_ID.Value);
                int obtainedMarks = int.Parse(txtObtainedMarks.Text);

                // Update the quiz marks in the database
                string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"; // Replace with your actual connection string
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "UPDATE MARKS SET QUIZ_MARKS = @ObtainedMarks WHERE M_ID = @M_ID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ObtainedMarks", obtainedMarks);
                    command.Parameters.AddWithValue("@M_ID", m_id);
                    command.ExecuteNonQuery();
                }
            }
        }

        //ASSIGNMENTS
        foreach (RepeaterItem item in Repeater1.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the relevant controls within the repeater item
                HiddenField hdnM_ID = (HiddenField)item.FindControl("hdnM_ID");
                TextBox txtObtainedMarks = (TextBox)item.FindControl("txtObtainedMarks");

                // Retrieve the relevant data from the controls
                int m_id = int.Parse(hdnM_ID.Value);
                int obtainedMarks = int.Parse(txtObtainedMarks.Text);

                // Update the quiz marks in the database
                string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"; // Replace with your actual connection string
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "UPDATE MARKS SET ASSIGNMENT_MARKS = @ObtainedMarks WHERE M_ID = @M_ID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ObtainedMarks", obtainedMarks);
                    command.Parameters.AddWithValue("@M_ID", m_id);
                    command.ExecuteNonQuery();
                }
            }
        }


        //LAB TASK
        foreach (RepeaterItem item in Repeater2.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the relevant controls within the repeater item
                HiddenField hdnM_ID = (HiddenField)item.FindControl("hdnM_ID");
                TextBox txtObtainedMarks = (TextBox)item.FindControl("txtObtainedMarks");

                // Retrieve the relevant data from the controls
                int m_id = int.Parse(hdnM_ID.Value);
                int obtainedMarks = int.Parse(txtObtainedMarks.Text);

                // Update the quiz marks in the database
                string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"; // Replace with your actual connection string
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "UPDATE MARKS SET LAB_MARKS = @ObtainedMarks WHERE M_ID = @M_ID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ObtainedMarks", obtainedMarks);
                    command.Parameters.AddWithValue("@M_ID", m_id);
                    command.ExecuteNonQuery();
                }
            }
        }

        //EXAM

        foreach (RepeaterItem item in Repeater3.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the relevant controls within the repeater item
                HiddenField hdnM_ID = (HiddenField)item.FindControl("hdnM_ID");
                TextBox txtObtainedMarks = (TextBox)item.FindControl("txtObtainedMarks");

                // Retrieve the relevant data from the controls
                int m_id = int.Parse(hdnM_ID.Value);
                int obtainedMarks = int.Parse(txtObtainedMarks.Text);

                // Update the quiz marks in the database
                string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"; // Replace with your actual connection string
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "UPDATE MARKS SET FINALS_MARKS = @ObtainedMarks WHERE M_ID = @M_ID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ObtainedMarks", obtainedMarks);
                    command.Parameters.AddWithValue("@M_ID", m_id);
                    command.ExecuteNonQuery();
                }
            }
        }

    }

    protected void OnStatusChanged(object sender, EventArgs e)
    {
        // Retrieve the selected value of the dropdown list control
        DropDownList ddlStatus = (DropDownList)sender;
        string selectedValue = ddlStatus.SelectedValue;

        // If the selected value is '-', do not update the database
        if (selectedValue == "-")
        {
            return;
        }

        // Retrieve the ID of the attendance record being updated
        RepeaterItem repeaterItem = (RepeaterItem)ddlStatus.NamingContainer;
        string attID = ((HiddenField)repeaterItem.FindControl("AttID")).Value;

        // Update the ATT_STATUS value in the database
        using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
        {
            SqlCommand command = new SqlCommand("UPDATE ATTENDANCE SET ATT_STATUS = @status WHERE ATT_ID = 1", connection);
            command.Parameters.AddWithValue("@status", selectedValue);
            //command.Parameters.AddWithValue("@attID", attID);
            connection.Open();
            command.ExecuteNonQuery();
        }
    }


    protected void btnGenerateReport_Click(object sender, EventArgs e)
    {
        // Retrieve data from a database or other source
        DataTable data = GetData();

        // Generate HTML content using a template
        string htmlContent = GenerateHTML(data);

        // Convert HTML to PDF using iTextSharp
        byte[] pdfBytes = GeneratePDF(htmlContent);

        // Send PDF file to user for download
        Response.Clear();
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Marks_From.pdf");
        Response.BinaryWrite(pdfBytes);
        Response.End();
    }

    private DataTable GetData()
    {
        string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";
        string query = "select Quiz_marks, Q_TOTAL, Assignment_marks, A_TOTAL, Finals_marks, F_TOTAL from marks where ID_COURSE = 'CS1002';";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    return dataTable;
                }
            }
        }
    }

    private string GenerateHTML(DataTable data)
    {
        string htmlContent = "<html><body><h1>Marks for CS1002</h1><table><thead><tr><th>Quiz</th><th>Quiz_Total</th><th>Assignment</th><th>Assignment_Total</th><th>Finals</th><th>Finals_Total</th></tr></thead><tbody>";

        foreach (DataRow row in data.Rows)
        {
            htmlContent += "<tr>";
            htmlContent += "<td>" + row["QUIZ_MARKS"].ToString() + "</td>";
            htmlContent += "<td>" + row["Q_TOTAL"].ToString() + "</td>";
            htmlContent += "<td>" + row["ASSIGNMENT_MARKS"].ToString() + "</td>";
            htmlContent += "<td>" + row["A_TOTAL"].ToString() + "</td>";
            htmlContent += "<td>" + row["FINALS_MARKS"].ToString() + "</td>";
            htmlContent += "<td>" + row["F_TOTAL"].ToString() + "</td>";
            htmlContent += "</tr>";
        }

        htmlContent += "</tbody></table></body></html>";

        return htmlContent;
    }

    private byte[] GeneratePDF(string htmlContent)
    {
        byte[] pdfBytes;

        using (MemoryStream ms = new MemoryStream())
        {
            using (iTextSharp.text.Document doc = new iTextSharp.text.Document())
            {
                iTextSharp.text.pdf.PdfWriter writer = iTextSharp.text.pdf.PdfWriter.GetInstance(doc, ms);
                doc.Open();

                using (StringReader sr = new StringReader(htmlContent))
                {
                    iTextSharp.tool.xml.XMLWorkerHelper.GetInstance().ParseXHtml(writer, doc, sr);
                }

                doc.Close();
            }

            pdfBytes = ms.ToArray();
        }

        return pdfBytes;
    }
}