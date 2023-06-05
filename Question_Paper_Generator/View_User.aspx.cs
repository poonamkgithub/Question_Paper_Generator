using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Question_Paper_Generator
{
    public partial class View_User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            GridView1.Visible = true;
            SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            String qry = "select * from users where Fname='" + T1.Text + "' and Lname='" + T2.Text + "'";
           
            SqlDataSource1.SelectCommand = qry;
            SqlDataSource1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            T1.Text = "";
            T2.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}