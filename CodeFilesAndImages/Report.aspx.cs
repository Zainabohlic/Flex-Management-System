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

public partial class Report : System.Web.UI.Page
{
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
        Response.AddHeader("content-disposition", "attachment;filename=Transcript.pdf");
        Response.BinaryWrite(pdfBytes);
        Response.End();
    }

    private DataTable GetData()
    {
        string connectionString = "Data Source=DESKTOP-P31URSD\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";
        string query = "SELECT STUDENT, SEMESTER, SEMESTER_NAME, CGPA, SGPA, COURSE, GRADE, GRADE_POINT FROM transcript";

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
        string htmlContent = "<html><body><h1>Transcript</h1><table><thead><tr><th>Student</th><th>Semester</th><th>Semester Name</th><th>CGPA</th><th>SGPA</th><th>Course</th><th>Grade</th><th>Grade Point</th></tr></thead><tbody>";

        foreach (DataRow row in data.Rows)
        {
            htmlContent += "<tr>";
            htmlContent += "<td>" + row["STUDENT"].ToString() + "</td>";
            htmlContent += "<td>" + row["SEMESTER"].ToString() + "</td>";
            htmlContent += "<td>" + row["SEMESTER_NAME"].ToString() + "</td>";
            htmlContent += "<td>" + row["CGPA"].ToString() + "</td>";
            htmlContent += "<td>" + row["SGPA"].ToString() + "</td>";
            htmlContent += "<td>" + row["COURSE"].ToString() + "</td>";
            htmlContent += "<td>" + row["GRADE"].ToString() + "</td>";
            htmlContent += "<td>" + row["GRADE_POINT"].ToString() + "</td>";
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