using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourSearch
{
    
    public partial class EditAcc : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            Email.Text = Convert.ToString(Session["email"]);
            Email.ReadOnly = true;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
            string query=@"select password from [user] where email_id='"+Email.Text+"'";
            SqlDataAdapter sda = new SqlDataAdapter(query,con);

            DataTable dt = new DataTable();
            sda.Fill(dt);

            if(dt.Rows.Count.ToString()=="1")
            {
                if(Password.Text==ConfirmPassword.Text)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(@"Update [User] set password='" + ConfirmPassword.Text+"' where email_id='" + Email.Text + "'",con);
                    cmd.ExecuteNonQuery();
                 
                    con.Close();
                    lblErrorMessage.Text = "Password changed sucessfully!!";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lblErrorMessage.Text = "Both Passwords don't match";
                }


            }

            else
            {
                lblErrorMessage.Text = "Enter correct Email-Id";
            }


        }
    }
}