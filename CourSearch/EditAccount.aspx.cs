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
    public partial class EditAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        string CS = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        string str = null;
       // byte up;
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            con.Open();
           // str = "Select * from  user";
               
            String query = @"select type from ""User"" where password=@pwd";
            SqlCommand cmd = new SqlCommand(query, con);
           // SqlDataReader reader = cmd.ExecuteReader();
            cmd.Parameters.AddWithValue("@pwd", Password.Text);
            String type = Convert.ToString(cmd.ExecuteScalar()).ToUpper();
           
                if(type.ToUpper() == "ADMIN")
                {
                    str ="update user set Password=@pwd where type='" + Session["type"].ToString() + "'";
                    SqlCommand com = new SqlCommand(str, con);
                    com.Parameters.Add(new SqlParameter("@pwd", SqlDbType.VarChar, 50));
                    com.Parameters["@pwd"].Value = Password.Text;
                    com.ExecuteNonQuery();
                    con.Close();
                    lblErrorMessage.Text = "Password changed Successfully";
                }
                else
                {
                    lblErrorMessage.Text = "Please enter correct Current password";
                }

          

            
                
        }
    }
}