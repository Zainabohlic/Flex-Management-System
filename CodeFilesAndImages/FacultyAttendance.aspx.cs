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

public partial class FacultyAttendance : System.Web.UI.Page
{
    //public List<string> SGPAValues { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Retrieve the lecture number from the database
            string lectureNumber = "";
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand("SELECT ATT_ID FROM ATTENDANCE WHERE ATT_ID = @lectureID", connection);
                command.Parameters.AddWithValue("@lectureID", 1);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    lectureNumber = reader["ATT_ID"].ToString();
                }
                reader.Close();
            }

            // Set the lecture number as the text of the Label control
            lecture1.Text = "Lecture " + lectureNumber;
        }

        if (!IsPostBack)
        {
            // Retrieve data from the database and bind it to the Repeater
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True"))
            {
                SqlCommand command = new SqlCommand("SELECT STD_ID, duration_in_hours, ATT_STATUS FROM ATTENDANCE WHERE INST_ID = @rollNumber AND ATT_ID = 1", connection);
                command.Parameters.AddWithValue("@rollNumber", "F001");
                //command.Parameters.AddWithValue("@Lecture", 1);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Set default selected value of drop-down list to "-"
                foreach (RepeaterItem item in MyRepeater.Items)
                {
                    DropDownList ddlStatus = (DropDownList)item.FindControl("ddlStatus");
                    ddlStatus.SelectedIndex = ddlStatus.Items.IndexOf(ddlStatus.Items.FindByText("-"));
                }

                MyRepeater.DataSource = dataTable;
                MyRepeater.DataBind();
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
        Response.AddHeader("content-disposition", "attachment;filename=Attendance_From.pdf");
        Response.BinaryWrite(pdfBytes);
        Response.End();
    }

    private DataTable GetData()
    {
        string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";
        string query = "SELECT STD_ID, duration_in_hours, ATT_STATUS FROM ATTENDANCE WHERE INST_ID = 'F001' AND ATT_ID = 1";

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
        string htmlContent = "<html><body><h1>Attendance For Lecture 1</h1><table><thead><tr><th>Students</th><th>Duration (Hours)</th><th>Status</th></tr></thead><tbody>";

        foreach (DataRow row in data.Rows)
        {
            htmlContent += "<tr>";
            htmlContent += "<td>" + row["STD_ID"].ToString() + "</td>";
            htmlContent += "<td>" + row["duration_in_hours"].ToString() + "</td>";
            htmlContent += "<td>" + row["ATT_STATUS"].ToString() + "</td>";
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