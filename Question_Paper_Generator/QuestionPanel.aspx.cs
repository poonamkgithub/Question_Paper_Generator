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
using Org.BouncyCastle.Crypto.Macs;
using WebGrease.Activities;

namespace Question_Paper_Generator
{
    public partial class QuestionPanel : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            //T1.Text = Request.QueryString["q"];
            //Label11.Text = T1.Text;
            //semester(Label11.Text);
            //course(Label2.Text);
            //course_code(Label3.Text);
            //Subject(Label5.Text);
            //Date(Label6.Text);
            //Time(Label7.Text, Label8.Text);
            //Duration(Label9.Text);
            //Total_marks(Label10.Text);

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
            string query = "SELECT question , sub='" + Label5.Text + "', sem='" + Label1.Text + "' FROM add_question";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();

            // Add the questions to a list
            List<string> allQuestions = new List<string>();
            while (reader.Read())
            {
                allQuestions.Add(reader.GetString(0) /*+ reader.GetString(1)*/);
                //allQuestions.Add(reader.GetString(1));
            }

            // Close the database connection
            reader.Close();
            connection.Close();
            Label completeLabel = new Label();
            
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
                unitLabel.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "<b>Q.</b>" + (i + 1) + "<b>)</b>" + "<b> Answer any <u><i>three</i></u> questions.</b> <br/><br/> " + Environment.NewLine;
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
                    }
                }
                //unitLabel.Text += "ALL THE BEST" + Environment.NewLine;
            }
            //unitLabel.Text += "ALL THE BEST" + Environment.NewLine;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            // Define variables
            //int numberOfQuestions = 6; // Number of questions per unit
            //int numberOfUnits = 5; // Number of units in the question paper
            //int questionCounter = 1; // Counter for question numbers

            //// Create a list to hold the selected questions
            //List<string> selectedQuestions = new List<string>();

            //// Connect to the database
            //string connectionString = "Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True";
            //SqlConnection connection = new SqlConnection(connectionString);
            //connection.Open();

            //// Select questions from the add_question table
            //string query = "SELECT question FROM add_question";
            //SqlCommand command = new SqlCommand(query, connection);
            //SqlDataReader reader = command.ExecuteReader();

            //// Add the questions to a list
            //List<string> allQuestions = new List<string>();
            //while (reader.Read())
            //{
            //    allQuestions.Add(reader.GetString(0));
            //}

            //// Close the database connection
            //reader.Close();
            //connection.Close();

            //// Shuffle the list of questions
            //Random random = new Random();
            //allQuestions = allQuestions.OrderBy(q => random.Next()).ToList();

            //// Create a panel for each unit
            //for (int i = 0; i < numberOfUnits; i++)
            //{
            //    Panel unitPanel = new Panel();
            //    unitPanel.ID = "UnitPanel" + (i + 1);

            //    // Add the panel to the page
            //    QuestionPaperPanel.Controls.Add(unitPanel);

            //    // Add the unit number to the panel
            //    Label unitLabel = new Label();
            //    unitLabel.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "<b>Q.</b>" + (i + 1) + "<b>)</b>" + "<b> Answer any three questions.</b> <br/> <br/>" + Environment.NewLine;
            //    unitPanel.Controls.Add(unitLabel);

            //    // Select questions for this unit
            //    List<string> unitQuestions = allQuestions.Skip(i * numberOfQuestions).Take(numberOfQuestions).ToList();

            //    // Add each question to the panel
            //    for (int j = 0; j < unitQuestions.Count; j++)
            //    {
            //        string question = unitQuestions[j];
            //        if (!selectedQuestions.Contains(question))
            //        {
            //            // Add the question to the panel with serial number
            //            Label questionLabel = new Label();
            //            Label separatorLabel = new Label();
            //            separatorLabel.Text = question + Environment.NewLine;
            //            questionLabel.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + (j + 1) + ". " + question + "<br />";
            //            unitPanel.Controls.Add(questionLabel);

            //            // Add the question to the list of selected questions
            //            selectedQuestions.Add(question);

            //        }
            //    }

            //}

            //SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            //SqlCommand cmd = new SqlCommand("select * from paperCreate where id='"+T1.Text+"'");
            //cmd.ExecuteNonQuery();

            // Get the ID from the textbox
            //string id = T1.Text;
            //string connectionString = "Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True";

            //using (SqlConnection connection = new SqlConnection(connectionString))
            //{
            //    connection.Open();
            //    using (SqlCommand command = new SqlCommand())
            //    {
            //        command.Connection = connection;
            //        command.CommandText = "SELECT * FROM paperCreate WHERE Id = @Id";
            //        command.Parameters.AddWithValue("@Id", id);
            //        SqlDataReader reader = command.ExecuteReader();

            //        if (reader.HasRows)
            //        {
            //            //semester(T1.Text);
            //        }
            //        else
            //        {
            //            ClientScript.RegisterClientScriptBlock(this.GetType(), "p", "alert('Invalid ID')", true);
            //        }
            //        reader.Close();
            //    }
            //    connection.Close();
            //}

            //QuestionPaperPanel.Visible = true;
            //B1.Visible = true;
            export();       
        }

        protected void export()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Question_Paper.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            QuestionPaperPanel.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdf = new Document();
            HTMLWorker htmlparser = new HTMLWorker(pdf);
            PdfWriter.GetInstance(pdf, Response.OutputStream);
            pdf.Open();
            htmlparser.Parse(sr);
            pdf.Close();
            Response.Write(pdf);
            Response.End();
        }

        //protected void semester(string q)
        //{
        //    SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
        //    String myquery = "Select * from paperCreate where id='" + q + "'";
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = myquery;
        //    cmd.Connection = con;
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    da.SelectCommand = cmd;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds, "paperCraete");
        //    if (ds.Tables["paperCreate"].Rows.Count == 0)
        //    {
        //        Label11.Text = ds.Tables[0].Rows[0]["sem"].ToString();
        //    }
        //    con.Close();
        //}

        //private void course(int q)
        //{
        //    SqlConnection con = new SqlConnection("");
        //    SqlCommand cmd = new SqlCommand("Select * from where id='"+T1.Text+"'");
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    da.SelectCommand = cmd;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        Label1.Text = ds.Tables[0].Rows[0]["course"].ToString();
        //    }
        //    con.Close();
        //} 

        //private void course_code(int course)
        //{
        //    SqlConnection con = new SqlConnection("");
        //    SqlCommand cmd = new SqlCommand("Select * from where id='"+T1.Text+"'");
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    da.SelectCommand = cmd;
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        Label1.Text = ds.Tables[0].Rows[0]["course"].ToString();
        //    }
        //    con.Close();
        //}
    }
}