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
    public partial class WebForm16 : System.Web.UI.Page
    {
        int ssid, cid, sid, lid, lno, nextlno, nextlid;
        string checkpoint_lid;
        string resFile,videoFile,progress;

      
        string[] nos;

        int firstLesson, lastLesson;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (Session["User"] != null && Request.QueryString["ssid"]!=null)
            {

                if (Session["avatar_file"] != null)
                {
                    avatar.ImageUrl = Convert.ToString(Session["avatar_file"]);
                    UserName.Text=Convert.ToString(Session["user"]);
                }
                else
                {
                    avatar.ImageUrl = "~/assets/images/people/110/default.jpg";
                }

                ssid = Convert.ToInt32(Request.QueryString["ssid"]);
                con.Open();
                String query1 = @"SELECT s.id as ssid, s.sid as sid ,c.cid as cid ,c.name as name ,s.checkpoint_lid as checkpt,s.progress as progress FROM ""Courses"" as c,""Study"" as s where c.cid=s.cid and id=@ssid";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@ssid", ssid);
                cmd1.ExecuteNonQuery();
                DataSet ds1 = new DataSet();
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                da1.Fill(ds1);

                cid =Convert.ToInt32( ds1.Tables[0].Rows[0]["cid"]);
                sid = Convert.ToInt32(ds1.Tables[0].Rows[0]["sid"]);
                CourseBreadcrumbLabel.Text = ds1.Tables[0].Rows[0]["name"].ToString();
                CourseNameMenuLabel.Text = ds1.Tables[0].Rows[0]["name"].ToString();
                progress = ds1.Tables[0].Rows[0]["progress"].ToString();
                checkpoint_lid = ds1.Tables[0].Rows[0]["checkpt"].ToString();


                //Response.Write(ssid);
                //Response.Write(cid);
                // Response.Write(checkpoint_lid);

                // Response.Write(progress);

                ////  Response.Write(ssid);




                String query2 = @"SELECT * from ""Lessons"" where cid=@cid order by lesson_num asc";
                SqlCommand cmd2 = new SqlCommand(query2, con);
                cmd2.Parameters.AddWithValue("@cid", cid);
                cmd2.ExecuteNonQuery();
                DataTable dt1 = new DataTable();
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                da2.Fill(dt1);
                DataList1.DataSource = dt1;
                DataList1.DataBind();

                if (dt1.Rows.Count>0)
                {
                    firstLesson = dt1.Rows[0].Field<int>("lid");
                    lastLesson = dt1.Rows[dt1.Rows.Count - 1].Field<int>("lid");
                    //  Response.Write(firstLesson);
                    //    Response.Write(lastLesson);

                    nos = progress.Split(',');





                    if (Request.QueryString["lid"] != null)
                    {

                        lid = Convert.ToInt32(Request.QueryString["lid"]);


                    }
                    else
                    {
                        if (dt1.Rows.Count > 1 && checkpoint_lid.ToString()!="") 
                        //if (dt1.Rows.Count > 1 && nos.Length>1)
                        {
                            lid = Convert.ToInt32(checkpoint_lid);
                            //lno = Convert.ToInt32(nos[nos.Length - 2]);
                            //lid = dt1.Rows[lno - 1].Field<int>("lid");
                        }
                        else
                        {
                            lid = firstLesson;
                        }
                    }

                    string up = @"update ""Study"" set checkpoint_lid=@lid where id=@ssid ";
                    SqlCommand c = new SqlCommand(up, con);
                    c.Parameters.AddWithValue("@ssid", ssid);
                    c.Parameters.AddWithValue("@lid", lid);

                    //  c.Parameters.AddWithValue("@str", str);
                    c.ExecuteNonQuery();



                    String query3 = @"SELECT * from ""Lessons"" where lid=@lid";
                    SqlCommand cmd3 = new SqlCommand(query3, con);
                    cmd3.Parameters.AddWithValue("@lid", lid);
                    cmd3.ExecuteNonQuery();
                    DataSet ds2 = new DataSet();
                    SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
                    da3.Fill(ds2);

                    lno = Convert.ToInt32(ds2.Tables[0].Rows[0]["lesson_num"]);
                    LessonNameLabel.Text = ds2.Tables[0].Rows[0]["name"].ToString();
                    DescriptionLabel.Text = ds2.Tables[0].Rows[0]["description"].ToString();

                    if (ds2.Tables[0].Rows[0]["resourceFile"].ToString() != "")
                    {
                        resFile = ds2.Tables[0].Rows[0]["resourceFile"].ToString();

                    }
                    else
                    {
                        Button1.Visible = false;

                    }

                    VideoLiteral.Text = "<Video width=400 Controls><Source src=" + ds2.Tables[0].Rows[0]["videoURL"].ToString() + " type=video/mp4></video>";



                    int count = DataList1.Items.Count;
                    for (int i = 0; i < count; i++)
                    {
                        Label lnum = DataList1.Items[i].FindControl("menuLessonNum") as Label;
                        Panel done = DataList1.Items[i].FindControl("DonePanel") as Panel;
                        Panel card = DataList1.Items[i].FindControl("DataListCard") as Panel;
                        string no = lnum.Text;
                        int pos = Array.IndexOf(nos, no);
                        if (pos > -1)
                        {
                            done.Visible = true;
                            if ((i + 1) != lno)
                            {
                                card.BackColor = System.Drawing.Color.FromArgb(240, 255, 240);
                            }
                            else
                            {
                                card.BackColor = System.Drawing.Color.AliceBlue;

                            }
                            // the array contains the string and the pos variable
                            // will have its position in the array
                        }
                        else
                        {
                            done.Visible = false;
                            if ((i + 1) == lno)
                            {
                                card.BackColor = System.Drawing.Color.AliceBlue;

                            }

                        }


                    }



                    int p = Array.IndexOf(nos, lno.ToString());
                    if (p > -1)
                    {
                        DonePanel.Visible = false;
                        ReviewPanel.Visible = true;

                        // the array contains the string and the pos variable
                        // will have its position in the array
                    }
                    else
                    {
                        DonePanel.Visible = true;
                        ReviewPanel.Visible = false;

                    }

                    if (dt1.Rows.Count > 1)
                    {
                        if (lid == lastLesson)
                        {
                            Next.Text = "Previous";
                            nextlno = lno - 1;

                        }
                        else
                        {
                            nextlno = lno + 1;
                        }
                        String query4 = @"SELECT * from ""Lessons"" where cid=@cid and lesson_num=@lno";
                        SqlCommand cmd4 = new SqlCommand(query4, con);
                        cmd4.Parameters.AddWithValue("@cid", cid);
                        cmd4.Parameters.AddWithValue("@lno", nextlno);

                        cmd4.ExecuteNonQuery();
                        DataSet ds3 = new DataSet();
                        SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
                        da4.Fill(ds3);


                        nextlid = Convert.ToInt32(ds3.Tables[0].Rows[0]["lid"]);
                    }
                    else
                    {
                        Next.Visible = false;

                    }
                    //Response.Write(nextlno);

                    //Response.Write(nextlid);
                   

                }   
                else
                {
                    PanelMain.Visible = false;
                    PanelAlternate.Visible = true;
                }
                con.Close();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Remove("User");
            Response.Redirect("Home.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ContentType = "Application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename="+resFile);
            Response.TransmitFile(Server.MapPath("~/assets/res/"+resFile));
            Response.End();
        }

        protected void Next_Click(object sender, EventArgs e)
        {
            Response.Redirect("Student-MyClassroom.aspx?ssid=" + ssid + "&lid=" + nextlid);
            
        }

        protected void Done_Click(object sender, EventArgs e)
        {
            string str = lno+",";
            con.Open();
            string up = @"update ""Study"" set progress=progress+@str where id=@ssid ";
            SqlCommand c = new SqlCommand(up, con);
            c.Parameters.AddWithValue("@ssid", ssid);
            c.Parameters.AddWithValue("@str", str);
            c.ExecuteNonQuery();
            Response.Redirect("Student-MyClassroom.aspx?ssid=" + ssid + "&lid=" + lid);
            //Response.Write(str);
            //Response.Write(ssid);
            con.Close();
        }

        protected void ReviewButton_Click(object sender, EventArgs e)
        {
            string removestr = lno + ",";


            Response.Write("*"+progress);
            Response.Write("$"+removestr);

            int index = progress.IndexOf(removestr);
            string newprogress = (index < 0)
                ? progress
                : progress.Remove(index, removestr.Length);
            Response.Write("!"+newprogress);

            con.Open();
            string up = @"update ""Study"" set progress=@str where id=@ssid ";
            SqlCommand c = new SqlCommand(up, con);
            c.Parameters.AddWithValue("@ssid", ssid);
            c.Parameters.AddWithValue("@str", newprogress);
            c.ExecuteNonQuery();
            Response.Redirect("Student-MyClassroom.aspx?ssid=" + ssid + "&lid=" + lid);
            //Response.Write(str);
            //Response.Write(ssid);
            con.Close();
        }



    }
}