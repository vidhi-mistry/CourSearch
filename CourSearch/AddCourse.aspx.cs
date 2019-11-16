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
    public partial class WebForm12 : System.Web.UI.Page
    {
        int cid,sid;

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Student-Home.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["cid"] != null)
            {
                cid = Convert.ToInt32(Request.QueryString["cid"]);
                if (Session["User"] != null)
                {

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
                    con.Open();

                    sid = Convert.ToInt32(Session["sid"]);

                    //Response.Redirect(""+cid +" "+sid);


                    String query = @"select name from ""Courses"" where cid=@cid";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@cid", cid);
                    String name = Convert.ToString(cmd.ExecuteScalar());

                   
                    String query1 = @"select count(1) from ""Study"" where cid=@cid and sid=@sid and (status='active' or status='completed')";
                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    cmd1.Parameters.AddWithValue("@cid", cid);
                    cmd1.Parameters.AddWithValue("@sid", sid);
                    int count0 = Convert.ToInt32(cmd1.ExecuteScalar());
                    if (count0 == 0)
                    {

                        String query2 = @"select duration_days from ""Courses"" where cid=@cid";
                        SqlCommand cmd2 = new SqlCommand(query2, con);
                        cmd2.Parameters.AddWithValue("@cid", cid);
                        int days = Convert.ToInt32(cmd2.ExecuteScalar());

                        string insert = @"insert into ""Study"" (cid,sid,end_datetime,status) values(@cid,@sid,@end,@status)";

                        cmd2 = new SqlCommand(insert, con);
                        DateTime today = DateTime.Today;
                        DateTime end = today.AddDays(days);
                        cmd2.Parameters.AddWithValue("@cid", cid);
                        cmd2.Parameters.AddWithValue("@sid", sid);
                        cmd2.Parameters.AddWithValue("@end", end);
                        cmd2.Parameters.AddWithValue("@status", "active");

                        cmd2.ExecuteNonQuery();


                        con.Close();
                        Label1.Text = "You are now enrolled in " + name + ". Your Subscription for this course will end on " + end.ToString("d") + ".<br>Start learning now !";

                    }
                    else
                    {
                        String query3 = @"select end_datetime from ""Study"" where cid=@cid and sid=@sid and status='active'";
                        SqlCommand cmd3 = new SqlCommand(query3, con);
                        cmd3.Parameters.AddWithValue("@cid", cid);
                        cmd3.Parameters.AddWithValue("@sid", sid);

                        DateTime end = (DateTime)cmd3.ExecuteScalar();
                        Label1.Text = "You are already enrolled in " + name + ". Your Subscription for this course is ending on " + end.ToString("d") + ".<br>Start learning now ! ";
                    }

                }
                else
                {
                    Response.Redirect("Login.aspx?cid=" + cid);

                }
            }
            else
            {
                if (Session["User"] != null)
                {
                    Response.Redirect("Student-Home.aspx");
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}