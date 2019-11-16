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
    public partial class WebForm15 : System.Web.UI.Page
    {
        int lid;
        int cid;
        int lno;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["lid"] != null && Request.QueryString["cid"]!=null)
            {
                lid = Convert.ToInt32(Request.QueryString["lid"]);
                cid = Convert.ToInt32(Request.QueryString["cid"]);
                con.Open();

                String query = "select * from [Lessons] where [lid]=@lid";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@lid", lid);
                cmd.ExecuteNonQuery();
                DataTable dt1 = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);

                lno = Convert.ToInt32(ds.Tables[0].Rows[0]["lesson_num"].ToString());

                string videoPath = Server.MapPath(ds.Tables[0].Rows[0]["videoURL"].ToString());
                if (System.IO.File.Exists(videoPath))
                {
                    System.IO.File.Delete(videoPath);
                    Response.Write("v deletd");
                }
                if (ds.Tables[0].Rows[0]["resourceFile"].ToString() != "")
                {
                    string resPath =Server.MapPath( "assets/res/" + ds.Tables[0].Rows[0]["resourceFile"].ToString());
                    if (System.IO.File.Exists(resPath))
                    {
                        System.IO.File.Delete(resPath);
                        Response.Write("r deletd");

                    }

                }

                string update = @"update ""Lessons"" set lesson_num=lesson_num-1 where cid=@cid and lesson_num>@lno";
                cmd = new SqlCommand(update, con);
                cmd.Parameters.AddWithValue("@cid", cid);
                cmd.Parameters.AddWithValue("@lno", lno);
                cmd.ExecuteNonQuery();

                String del = "DELETE FROM [Lessons] WHERE [lid] = @lid";
                cmd = new SqlCommand(del, con);
                cmd.Parameters.AddWithValue("@lid", lid);
                cmd.ExecuteNonQuery();
                Response.Redirect("Admin-EditCourse.aspx?id="+cid);

                con.Close();
            }
            else
            {
                Response.Redirect("Admin-Home.aspx");
            }
        }
    }
}