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
    public partial class Add_User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            T1.ReadOnly = true;
            SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            String qry = "Select max(ID) from users";
            SqlCommand cmd = new SqlCommand(qry, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int id = Convert.ToInt32(dr[0]);
            id++;
            T1.Text = id.ToString();
        }

        protected void BtnSub_Click(object sender, EventArgs e)
        {

            if (checkuser() == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('This User is already Exists!!');", true);
                clear();
            }
            else
            {
                SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
                SqlCommand cmd = new SqlCommand("insert into users(id, fname, lname, email) values(@uid, @fname, @lname, @email)", con);
                cmd.Parameters.AddWithValue("@uid", T1.Text);
                cmd.Parameters.AddWithValue("@fname", T2.Text);
                cmd.Parameters.AddWithValue("@lname", T3.Text);
                cmd.Parameters.AddWithValue("@email", T4.Text);
                con.Open();
                int t = cmd.ExecuteNonQuery();
                con.Close();
                if (t > 0)
                {

                    Response.Write("<script>alert('User Details Added Successfully!!')</script>");

                }
                clear();
            }
        }

        private Boolean checkuser()
        {
            Boolean Questionavailable = false;
            string mycon = "Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True";
            string myquery = "select * from users where email='" + T4.Text +"'";
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
            T3.Text = "";
            T4.Text = "";
        }
    }
}