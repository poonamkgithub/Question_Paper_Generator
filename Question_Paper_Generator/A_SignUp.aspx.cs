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
    public partial class A_SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            T5.ReadOnly = true;
            SqlConnection con = new SqlConnection("Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True");
            String qry = "Select max(Uid) from Register";
            SqlCommand cmd = new SqlCommand(qry, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int id = Convert.ToInt32(dr[0]);
            id++;
            T5.Text = id.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(checkemail() == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Email ID already Exists!!');",true);
                clear();
            }
            else 
            {
                string mycon = "Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True";
                string myquery = "insert into Register(Uid,fullName,email,password,c_password) values('"+T5.Text+"','"+T1.Text+"','"+T2.Text+"','"+T3.Text+"','"+T4.Text+"')";
                SqlConnection con = new SqlConnection(mycon);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "p", "alert('Successfully Register!!')", true);
                Type cstype = this.GetType();
                string msg = "<script language='javascript'>" + "alert('Register Successfully')" + "</script>";
                ClientScript.RegisterStartupScript(cstype, "msg", msg);
                Response.Redirect("A_SignIN.aspx");
                clear();
            }
        }

        private Boolean checkemail()
        {
           Boolean emailavailable = false;
           string mycon = "Server=ACER-ASPIRE3\\SQLEXPRESS;Database=Demo;Trusted_Connection=True";
           string myquery = "select * from register where email='"+T2.Text+"'";
           SqlConnection con = new SqlConnection(mycon);
           SqlCommand cmd = new SqlCommand();
           cmd.CommandText = myquery;
           cmd.Connection = con;   
           SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
           sqlDataAdapter.SelectCommand = cmd;
           DataSet ds = new DataSet(); 
           sqlDataAdapter.Fill(ds);
           if (ds.Tables[0].Rows.Count > 0 )
           {
               emailavailable=true;
           }
           con.Close();
           
           return emailavailable;
        }

        protected void clear()
        {
            T1.Text = "";
            T2.Text = "";
            T3.Text = "";
            T4.Text = "";
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            //clear();
            T1.Text = "";
            T2.Text = "";
            T3.Text = "";
            T4.Text = "";
        }
    }
}