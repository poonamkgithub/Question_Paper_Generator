using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Question_Paper_Generator
{
    public partial class U_View_Q : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Show_T_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            String qry = "select * from Add_Question where course='" + T1.Text + "' and sub='" + T2.Text + "' and sem='" + T3.Text + "'";
            SqlDataSource1.SelectCommand = qry;
            SqlDataSource1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }
    }
}