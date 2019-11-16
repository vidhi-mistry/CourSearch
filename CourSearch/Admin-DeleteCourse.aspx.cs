using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
        int cid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"].ToString() != null)
            {
                cid = Convert.ToInt32(Request.QueryString["id"].ToString());
                con.Open();

                String query = "DELETE FROM [Courses] WHERE [cid] = @cid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@cid", cid);
                cmd.ExecuteNonQuery();

                String query1 = @"update ""Study"" set progress='0,' , checkpoint_lid=NULL where id=@cid";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@cid", cid);
                cmd1.ExecuteNonQuery();
                con.Close();

                Response.Redirect("Admin-Courses.aspx");

            }
        }
    }
}