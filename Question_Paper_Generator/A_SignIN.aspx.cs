using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Drawing;
using System.Reflection.Emit;

namespace Question_Paper_Generator
{
    public partial class A_SignIN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            SqlCommand cmd = new SqlCommand("select * from Register where Email=@email and Password=@password", con);
            cmd.Parameters.AddWithValue("@email", T1.Text);
            cmd.Parameters.AddWithValue("@password", T2.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds, "Register");

            if (ds.Tables["Register"].Rows.Count == 0)
            {
                //Response.Write("<script>alert('Invalid Email ID and Password')</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "p", "alert('Invalid Email ID and Password')", true);
            }
            else
            {
                //Label1.Text = "Login Successfully";
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "p", "alert('Login Successfully!!!:))')", true);
                Response.Redirect("A_Menu.aspx");
            }
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            T1.Text = "";
            T2.Text = "";
        }
    }
}