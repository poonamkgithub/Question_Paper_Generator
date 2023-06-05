using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;

namespace Question_Paper_Generator
{
    public partial class Trial_QP : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename = Question_Paper.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            QuestionPaperPanel.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            // Define variables
            int numberOfQuestions = 6; // Number of questions per unit
            int numberOfUnits = 5; // Number of units in the question paper
            int questionCounter = 1; // Counter for question numbers

            // Create a list to hold the selected questions
            List<string> selectedQuestions = new List<string>();

            // Connect to the database
            string connectionString = "Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            // Select questions from the add_question table
            string query = "SELECT question FROM add_question";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            // Add the questions to a list
            List<string> allQuestions = new List<string>();
            while (reader.Read())
            {
                allQuestions.Add(reader.GetString(0));
            }

            // Close the database connection
            reader.Close();
            connection.Close();

            // Shuffle the list of questions
            Random random = new Random();
            allQuestions = allQuestions.OrderBy(q => random.Next()).ToList();

            // Create a panel for each unit
            for (int i = 0; i < numberOfUnits; i++)
            {
                Panel unitPanel = new Panel();
                unitPanel.ID = "UnitPanel" + (i + 1);

                // Add the panel to the page
                QuestionPaperPanel.Controls.Add(unitPanel);

                // Add the unit number to the panel
                Label unitLabel = new Label();
                unitLabel.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "<b>Q.</b>" + (i + 1) + "<b>)</b>" + "<b> Answer any three questions.</b> <br/> <br/>" + Environment.NewLine;
                unitPanel.Controls.Add(unitLabel);

                // Select questions for this unit
                List<string> unitQuestions = allQuestions.Skip(i * numberOfQuestions).Take(numberOfQuestions).ToList();

                // Add each question to the panel
                for (int j = 0; j < unitQuestions.Count; j++)
                {
                    string question = unitQuestions[j];
                    if (!selectedQuestions.Contains(question))
                    {
                        // Add the question to the panel with serial number
                        Label questionLabel = new Label();
                        Label separatorLabel = new Label();
                        separatorLabel.Text = question + Environment.NewLine;
                        questionLabel.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + (j + 1) + ". " + question + "<br />";
                        unitPanel.Controls.Add(questionLabel);

                        // Add the question to the list of selected questions
                        selectedQuestions.Add(question);
                        separatorLabel.Text = "<br/>";
                    }
                }
            }
            exportpdf();
        }
    }
}