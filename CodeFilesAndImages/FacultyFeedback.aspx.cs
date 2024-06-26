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

public partial class FacultyFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //string courseId = "CS1002"; // course ID for which the attendance is being shown
            //Course1.Text = "Course " + courseId;

            string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = "SELECT row1, row2, row3, row4, comment from FEEDBACK";
            SqlCommand command = new SqlCommand(query, connection);
            //command.Parameters.AddWithValue("@CourseId", courseId);

            SqlDataReader reader = command.ExecuteReader();
            MyRepeater.DataSource = reader;
            MyRepeater.DataBind();

            reader.Close();
            connection.Close();
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
        Response.AddHeader("content-disposition", "attachment;filename=Feedback_From.pdf");
        Response.BinaryWrite(pdfBytes);
        Response.End();
    }

    private DataTable GetData()
    {
        string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";
        string query = "SELECT row1, row2, row3, row4, comment from FEEDBACK";

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
        string htmlContent = "<html><body><h1>Feedback</h1><table><thead><tr><th>Average_Score_1</th><th>Average_Score_2</th><th>Average_Score_3</th><th>Average_Score_4</th><th>Comments</th></tr></thead><tbody>";

        foreach (DataRow row in data.Rows)
        {
            htmlContent += "<tr>";
            htmlContent += "<td>" + row["row1"].ToString() + "</td>";
            htmlContent += "<td>" + row["row2"].ToString() + "</td>";
            htmlContent += "<td>" + row["row3"].ToString() + "</td>";
            htmlContent += "<td>" + row["row4"].ToString() + "</td>";
            htmlContent += "<td>" + row["comment"].ToString() + "</td>";
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