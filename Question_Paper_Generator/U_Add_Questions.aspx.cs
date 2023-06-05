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
    public partial class U_Add_Questions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            T1.ReadOnly = true;
            SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            String qry = "Select max(QID) from Add_Question";
            SqlCommand cmd = new SqlCommand(qry, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int id = Convert.ToInt32(dr[0]);
            id++;
            T1.Text = id.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (checkQuestion() == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Question is already Exists!!');", true);
                clear();
            }
            else
            {
                SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
                SqlCommand cmd = new SqlCommand("insert into Add_Question(QID,Question, lod, unit, sem, sub, course) values(@Qid, @Q, @LOD, @Mode, @sem, @sub, @course)", con);
                cmd.Parameters.AddWithValue("@QID", T1.Text);
                cmd.Parameters.AddWithValue("@Q", T2.Text);
                cmd.Parameters.AddWithValue("@LOD", DDL1.Text);
                cmd.Parameters.AddWithValue("@Mode", DDL2.Text);
                cmd.Parameters.AddWithValue("@sem", DDL3.Text);
                cmd.Parameters.AddWithValue("@sub", T3.Text);
                cmd.Parameters.AddWithValue("@course", T4.Text);
                con.Open();
                int t = cmd.ExecuteNonQuery();
                con.Close();
                if (t > 0)
                {

                    Response.Write("<script>alert('Question Details Added Successfully!!')</script>");
                    //GridView1.Visible = true;
                    //GV_Bind();
                }
                clear();
            }

        }

        private Boolean checkQuestion()
        {
            Boolean Questionavailable = false;
            string mycon = "Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True";
            string myquery = "select * from add_question where question='" + T2.Text + "'";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            sqlDataAdapter.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sqlDataAdapter.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Questionavailable = true;
            }
            con.Close();

            return Questionavailable;
        }

        protected void clear()
        {
            T2.Text = "";
            DDL1.SelectedValue = "";
            DDL2.SelectedValue = "";
            DDL3.SelectedValue = "";
            T3.Text = "";
            T4.Text = "";
        }

        protected void LBback_Click(object sender, EventArgs e)
        {
            Response.Redirect("U_Menu.aspx");
        }
    }
}