using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mime;
using System.Text;
using System.Reflection.Emit;

namespace Question_Paper_Generator
{
    public partial class Forgot_Password : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void B1_Click(object sender, EventArgs e)
        {
            //String CS = ConfigurationManager.ConnectionStrings["DemoConnectionString"].ConnectionString;

            //using (SqlConnection con = new SqlConnection(CS))
            //{
            //    SqlCommand cmd = new SqlCommand("select * from Register where Email='" + T1.Text + "'", con);
            //    con.Open();
            //    SqlDataAdapter ds = new SqlDataAdapter(cmd);
            //    DataTable dt = new DataTable();
            //    ds.Fill(dt);

            //    if (dt.Rows.Count != 0)
            //    {
            //        String ID = Guid.NewGuid().ToString();
            //        int Uid = (int)Convert.ToInt64(dt.Rows[0][0]);
            //        SqlCommand cmd1 = new SqlCommand("insert into ForgotMailRequest values('" + ID + "','" + Uid + "',getdate())", con);
            //        cmd1.ExecuteNonQuery();

            //        try
            //        {
            //            ////String Password;
            //            String ToEmailAddress = dt.Rows[0][4].ToString();
            //            String Username = dt.Rows[0][1].ToString();
            //            String EmailBody = "HEY" + Username + ",<br/><br/> Click the Link Below to reset your email password <br/> <br/> https://localhost:44328/New_Pass.aspx?uid=" + ID;
            //            MailMessage PassReq = new MailMessage("poonamkhorwal02@gmail.com", ToEmailAddress);
            //            PassReq.Body = EmailBody;
            //            PassReq.IsBodyHtml = true;
            //            PassReq.Subject = "Reset Password";
            //            PassReq.Priority = MailPriority.High;

            //            SmtpClient smtpClient = new SmtpClient("smtp-MailPriority.outlook.com", 587);
            //            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            //            smtpClient.UseDefaultCredentials = false;
            //            smtpClient.Credentials = new NetworkCredential()
            //            {
            //                UserName = "poonamkhorwal02@gmail.com",
            //                Password = "poonamk@02"
            //            };
            //            smtpClient.EnableSsl = true;
            //            smtpClient.Send(PassReq);
            //            Response.Write("<script> alert('Check your email to reset your password.');</script>");

            //        }
            //        catch (Exception)
            //        {
            //            Response.Write("<script> alert('Message not sent!!');</script>");
            //        }
            //    }
            //    else
            //    {
            //        Response.Write("<script>alert('OOPS... This email id does not exist in our database!');</script>");
            //    }

            //}


            //    try
            //    {
            //        Session["email"] = T1.Text;
            //        SqlDataAdapter sdp = new SqlDataAdapter("Select * from register where email=@email",con);
            //        con.Open();

            //        sdp.SelectCommand.Parameters.AddWithValue("@email", T1.Text);
            //        sdp.Fill(dt);

            //        if(dt.Rows.Count>0)
            //        {
            //            SqlCommand cmd = new SqlCommand("Update register set pass_change_status=1 where email=''" + T1.Text + "", con);
            //            cmd.ExecuteNonQuery();
            //            SendEmail();
            //            L2_Result.Text = "Successfully sent rest link on your mail, Please Kindly Check Your Mail!!!";
            //            con.Close();
            //            cmd.Dispose();
            //        }
            //        else 
            //        { 
            //            L2_Result.Text = "Please Enter Valid Email!!";
            //        }

            //    }
            //    catch(Exception ex)
            //    {
            //        ex.Source = "Error";
            //    }
            //}

            //private void SendEmail()
            //{
            //    try
            //    {
            //        StringBuilder sb = new StringBuilder();
            //        sb.Append("Hi, <br/> Click On Below Given Link to Reset Your Password <br/>");
            //        //sb.Append("<a href=http://localhost:50083/New_Password.aspx>" +GetUserEmail(T1.Text));
            //        //sb.Append("&email=" +T1.Text +");
            //        MailMessage message = new System.Net.Mail.MailMessage("poonamkhorwal02@gmail.com", T1.Text.Trim(),"Reset Your Password", sb.ToString());
            //        SmtpClient smtp = new SmtpClient();
            //        smtp.Host = "smtp.gmail.com";
            //        smtp.Port = 587;
            //        smtp.Credentials = new System.Net.NetworkCredential("poonamkhorwal02@gmail.com", "7710060148");
            //        smtp.EnableSsl = true;
            //        message.IsBodyHtml = true;
            //        smtp.Send(message);
            //    }
            //    catch (Exception ex)
            //    {
            //        ex.Source="Error";
            //    }
            //}

            //private void GetUserEmail(string Email)
            //{
            //    SqlCommand cmd = new SqlCommand("Select email from register where email=@email", con);
            //    cmd.Parameters.AddWithValue("email", T1.Text);
            //    string username = cmd.ExecuteScalar().ToString();    
            //}

            //SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            //SqlCommand cmd = new SqlCommand("Select * from register where email=@email",con);
            //cmd.Parameters.AddWithValue("@email", T1.Text);
            //SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            //con.Open();
            //int i = cmd.ExecuteNonQuery();
            //con.Close();

            //if (dt.Rows.Count > 0)
            //{
            //    Response.Redirect("New_Password.aspx");
            //}
            //else
            //{
            //    Response.Write("<script>alert('InValid Email ID!!');</script>");
            //}

            SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            SqlCommand cmd = new SqlCommand("select Email from register where Email='" + T1.Text + "'", con);
            SqlDataAdapter ds = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Session["email"] = T1.Text;
            SqlCommand cmd1 = new SqlCommand("select UID from register where email='" + T1.Text + "'", con);
            SqlDataAdapter ds1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            SqlCommand cmd2 = new SqlCommand("select UID from register where UID='" + T2.Text + "'", con);
            DataTable dt2 = new DataTable();
            SqlDataAdapter ds2 = new SqlDataAdapter(cmd2);

            ds.Fill(dt);
            ds1.Fill(dt1);
            ds2.Fill(dt2);
            if (dt1.Rows.Count == dt2.Rows.Count)
            {

                Response.Redirect("New_Password.aspx");

            }
            else
            {
                Type cstype = this.GetType();
                string msg = "<script language='javascript'>" + "alert('Account Does Not exists')" + "</script>";
                ClientScript.RegisterStartupScript(cstype, "msg", msg);
            }

        }
    }
}