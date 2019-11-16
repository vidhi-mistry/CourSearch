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
    public partial class WebForm18 : System.Web.UI.Page
    {
        int sid, cid, ssid;
        string progress;

       

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            con.Open();
            sid = Convert.ToInt32(Session["sid"]);
            //con.Open();
            String query1 = @"SELECT s.id as id, s.end_datetime ,s.sid,c.cid,c.name as name,s.progress as progress FROM ""Courses"" as c,""Study"" as s where c.cid=s.cid  and s.sid=@sid and s.end_datetime>=GETDATE()";
            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.Parameters.AddWithValue("@sid", sid);
            cmd1.ExecuteNonQuery();
            DataTable dt1 = new DataTable();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            da1.Fill(dt1);
            DataList1.DataSource = dt1;
            DataList1.DataBind();

            if (dt1.Rows.Count > 0)
            {


                int count = DataList1.Items.Count;
                for (int i = 0; i < count; i++)
                {
                    progress = dt1.Rows[i].Field<string>("progress");
                    //Panel progressbar = DataList1.Items[i].FindControl("progressbar") as Panel;
                    //Literal btn = DataList1.Items[i].FindControl("Literalbtn") as Literal;
                    //Label lbl = DataList1.Items[i].FindControl("ContinueLabel") as Label;
                    Label date = DataList1.Items[i].FindControl("Date") as Label;
                    Label prog = DataList1.Items[i].FindControl("Progress") as Label;


                    //Label icon = DataList1.Items[i].FindControl("Icon") as Label;

                    String q = @"SELECT count(*) from ""Lessons"" where cid=@cid";
                    SqlCommand c = new SqlCommand(q, con);
                    c.Parameters.AddWithValue("@cid", dt1.Rows[i].Field<int>("cid"));

                    int ct = Convert.ToInt32(c.ExecuteScalar());

                    string[] res = progress.Split(',');


                    //  Response.Write("<br>"+(res.Length-2));
                    //  Response.Write("/"+ct+"=");
                    if (ct != 0 && res.Length - 2 != 0)
                    {
                        double bar = Convert.ToDouble(res.Length - 2) / Convert.ToDouble(ct) * 100;
                        //   Response.Write(bar+"   ");
                        // progressbar.Style.Add("width", bar.ToString() + "%");

                        prog.Text = bar.ToString()+"%";

                        if (Convert.ToInt32(bar) == 100)
                        {
                            prog.CssClass = "badge badge-pill badge-success";
                            //lbl.Text = "Completed";
                            //progressbar.CssClass = "progress-bar-striped bg-success";
                            // icon.Text = "play_circle_outline";

                        }
                    }
                    else
                    {
                        prog.Text = "2%";

                        // progressbar.Style.Add("width", "2%");

                    }
                }
            }
            else
            {
                PanelMain.Visible = false;
                PanelAlternate.Visible = true;
            }

            con.Close();
        }

        protected void Restart_Click(object sender, DataListCommandEventArgs e)
        {

            //Response.Write(e.CommandName.ToString());
            con.Open();
            sid = Convert.ToInt32(Session["sid"]);
            int ssid = Convert.ToInt32(e.CommandName.ToString());
            String query1 = @"update ""Study"" set progress='0,' , checkpoint_lid=NULL where id=@ssid ";
            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.Parameters.AddWithValue("@ssid", ssid);
            cmd1.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Student-MyCourses.aspx");
        }
    }
}