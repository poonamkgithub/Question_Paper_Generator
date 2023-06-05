using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Question_Paper_Generator
{
    public partial class U_SignIN : System.Web.UI.Page
    {
        int attempt = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            //T1.ReadOnly = true;
            //SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            //String qry = "Select max(ID) from users";
            //SqlCommand cmd = new SqlCommand(qry, con);
            //con.Open();
            //SqlDataReader dr = cmd.ExecuteReader();
            //dr.Read();
            //int id = Convert.ToInt32(dr[0]);
            //id++;
            //T1.Text = id.ToString();
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            
                SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
                SqlCommand cmd = new SqlCommand("select * from users where ID=@Uid and Email=@email", con);

                cmd.Parameters.AddWithValue("@Uid", T1.Text);
                cmd.Parameters.AddWithValue("@email", T2.Text);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("U_Menu.aspx");
                }
                else
                {
                    Response.Write("<script>alert('try again and the no. of attempt is' + ' "  +  attempt  + "'+ ' out of 3');</script>");
                    attempt++;
                }
            
            
            if(attempt == 4)
            {
                Type cstype = this.GetType();
                string msg = "<script language='javascript'>" + "alert('You've reached the maximum number of attemtps...\n Program will close..')" + "</script>";
                ClientScript.RegisterStartupScript(cstype, "msg", msg);
            }
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("A_SignIN.aspx");
        }

    }
}