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
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

            if (Request.QueryString["Search"] == null)
            {


                DataList1.Visible = true;
                DataList2.Visible = false;
            }
            else
            {
                DataList2.Visible = true;
                DataList1.Visible = false;


                String query0 = @"select * from ""Courses"" where name like ('%" + Request.QueryString["Search"].ToString() + "%') ";
                SqlCommand cmd0 = new SqlCommand(query0, con);
                cmd0.ExecuteNonQuery();
                DataTable dt1 = new DataTable();
                SqlDataAdapter da1 = new SqlDataAdapter(cmd0);
                da1.Fill(dt1);
                DataList2.DataSource = dt1;
                DataList2.DataBind();

            }
            con.Close();
        }
    }
}