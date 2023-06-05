using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Question_Paper_Generator
{
    public partial class New_Password : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btng_Click(object sender, EventArgs e)
        {
            if (T1.Text == T2.Text)
            {
                SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
                con.Open();
                SqlCommand cmd = new SqlCommand("update register set Password=@Pass where Email= @Em", con);
                cmd.Parameters.AddWithValue("@Pass", T1.Text);
                cmd.Parameters.AddWithValue("@cpass", T2.Text);
                cmd.Parameters.AddWithValue("@EM", Session["email"]);
                cmd.ExecuteNonQuery();
                con.Close();
                Type cstype = this.GetType();
                string msg = "<script language='javascript'>" + "alert('Passwords Changed Successfully')" + "</script>";
                ClientScript.RegisterStartupScript(cstype, "msg", msg);
                //Response.Write("<script>alert('Password Changed Successfully');</script>");
            }
            else
            {
                Type cstype = this.GetType();
                string msg = "<script language='javascript'>" + "alert('Passwords Does not match')" + "</script>";
                ClientScript.RegisterStartupScript(cstype, "msg", msg);
            }
        }
    }
}