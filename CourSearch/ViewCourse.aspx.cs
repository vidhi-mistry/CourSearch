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
    public partial class WebForm3 : System.Web.UI.Page
    {
        int id;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"].ToString() != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                con.Open();
                String query1 = @"select * from ""Courses"" where cid=@id";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@id",id);
                cmd1.ExecuteNonQuery();
                DataTable dt1 = new DataTable();
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                da1.Fill(dt1);
                Repeater1.DataSource = dt1;
                Repeater1.DataBind();


                
                con.Close();


            }
            else
            {
                Response.Redirect("Home.aspx");
                    
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
            var Repeater2 = (Repeater)e.Item.FindControl("Repeater2");
            
            String query2 = @"select * from ""Lessons"" where cid=@id";
            SqlCommand cmd3 = new SqlCommand(query2, con);
            cmd3.Parameters.AddWithValue("@id", id);
            cmd3.ExecuteNonQuery();
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd3);
            da2.Fill(dt2);
            Repeater2.DataSource = dt2;
            Repeater2.DataBind();


            var Repeater3 = (Repeater)e.Item.FindControl("Repeater3");

            //String query3 = @"select * from ""Instructer"" where id=@id";
            //SqlCommand cmd3 = new SqlCommand(query3, con);
            //cmd3.Parameters.AddWithValue("@id", <%# Eval("name") %>);
            //cmd3.ExecuteNonQuery();
            //DataTable dt3 = new DataTable();
            //SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
            //da2.Fill(dt3);
            //Repeater3.DataSource = dt3;
            //Repeater3.DataBind();
        }
    }
}