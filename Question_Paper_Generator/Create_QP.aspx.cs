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
    public partial class Create_QP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCQP_Click(object sender, EventArgs e)
        {
            //Panel1.Visible = true;
            //DateTime date = DateTime.Now.Date;
            //TimeSpan time = DateTime.Now.TimeOfDay;

            //DateTime datetime = DateTime.ParseExact(T6.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            //TimeSpan time = new TimeSpan();
            //time.ToString();
            SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");

            SqlCommand cmd = new SqlCommand("insert into paperCreate(id, course,sem, sub_code, sub, date, s_time, e_time, duration, total_marks) values(@t8, @d1, @d2, @t1, @t2, @t3, @t4, @t5, @t6, @t7)",con);
            cmd.Parameters.AddWithValue("@t8", T8.Text);
            cmd.Parameters.AddWithValue("@d1", D1.Text);
            cmd.Parameters.AddWithValue("@d2", D2.Text);
            cmd.Parameters.AddWithValue("@t1", T1.Text);
            cmd.Parameters.AddWithValue("@t2", T2.Text);
            cmd.Parameters.AddWithValue("@t3", T3.Text);
            cmd.Parameters.AddWithValue("@t4", T4.Text);
            cmd.Parameters.AddWithValue("@t5", T5.Text);
            cmd.Parameters.AddWithValue("@t6", T6.Text);
            cmd.Parameters.AddWithValue("@t7", T7.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            //ClientScript.RegisterStartupScript(this.GetType(), "p", "AlertMe()", true);
            Response.Redirect("QuestionPanel.aspx");

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            //D1.SelectedValue = "";
            //D2.SelectedValue = "";
            //D3.SelectedValue = "";
            //D4.SelectedValue = "";
            //D5.SelectedValue = "";
            //T1.Text = "";
            //T2.Text = "";
            //T3.Text = "";
            //T4.Text = "";
            //T5.Text = "";
            //T6.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Panel1.Visible = true;
        }
    }
}

//cmd.Parameters.AddWithValue("@d1", D1.Text);
//cmd.Parameters.AddWithValue("@d2", D2.Text);
//cmd.Parameters.AddWithValue("@d3", D3.Text);
//cmd.Parameters.AddWithValue("@d4", D4.Text);
//cmd.Parameters.AddWithValue("@d5", D5.Text);
//cmd.Parameters.AddWithValue("@t1", T1.Text);
//cmd.Parameters.AddWithValue("@t2", T2.Text);
//cmd.Parameters.AddWithValue("@t3", T3.Text);
//cmd.Parameters.AddWithValue("@t4", T4.Text);
//cmd.Parameters.AddWithValue("@t5", T5.Text);
//cmd.Parameters.AddWithValue("@t6", SqlDbType.Date);