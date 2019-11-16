using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        int lid,cid,count,lno;
        String videoFileName;
        String resourceFileName;
        static bool noResource = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Message.Visible = false;
            if (!IsPostBack)
            {
                PanelSuccess.Visible = false;
               
                if (Request.QueryString["lid"] != null)
                    {

                        lid = Convert.ToInt32(Request.QueryString["lid"].ToString());
                        con.Open();
                        String query = @"select * from ""Lessons"" where lid=@lid";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@lid", lid);
                        cmd.ExecuteNonQuery();
                        DataTable dt1 = new DataTable();
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        LinkButton1.PostBackUrl = "Admin-EditCourse.aspx?id=" + ds.Tables[0].Rows[0]["cid"].ToString();

                        cid = Convert.ToInt32(ds.Tables[0].Rows[0]["cid"]);

                        TextBox1.Text = ds.Tables[0].Rows[0]["name"].ToString();
                        TextBox2.Text = ds.Tables[0].Rows[0]["description"].ToString();

                    lno= Convert.ToInt32(ds.Tables[0].Rows[0]["lesson_num"]);
                    if (ds.Tables[0].Rows[0]["resourceFile"].ToString()!="")
                    {
                        Label2.Text = ds.Tables[0].Rows[0]["resourceFile"].ToString();
                        DelResource.Visible = true;
                        Label2.Visible = true;
                        ResourcePanel.Visible = true;


                    }
                    else
                    {
                        Label2.Text = "No Resource File";
                        DelResource.Visible = false;
                        Label2.Visible = true;
                        ResourcePanel.Visible = true;

                    }
                    Literal1.Text = "<Video width=400 Controls><Source src=" + ds.Tables[0].Rows[0]["videoURL"].ToString() + " type=video/mp4></video>";

                    String ct = @"select count(*) from ""Lessons"" where cid=@cid";
                    SqlCommand cmd1 = new SqlCommand(ct, con);
                    cmd1.Parameters.AddWithValue("@cid", cid);
                    count = Convert.ToInt32(cmd1.ExecuteScalar());




                   

                   

                    for (int i = 1; i <= count; i++)
                    {
                        DropDownList2.Items.Add(new ListItem(i.ToString(), i.ToString()));

                    }

                    DropDownList2.Items.FindByValue(ds.Tables[0].Rows[0]["lesson_num"].ToString()).Selected = true;

                    con.Close();




                    if (Request.QueryString["status"] != null)
                        {
                            if (Request.QueryString["status"]=="updated")
                            {
                            
                                Message.Text = "Updated Succesfully";
                                Message.Visible = true;
                                PanelSuccess.Visible = true;
                            }
                        }
                    }








                    else
                    {
                        Response.Redirect("Admin-Home.aspx");

                    }
              
            }
        }

        protected void UploadVideo_Click(object sender, EventArgs e)
        {

            
             videoFileName = "assets/videos/" + lid + ".mp4";
          

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string update;
            lid = Convert.ToInt32(Request.QueryString["lid"].ToString());

            con.Open();


            String query = @"select * from ""Lessons"" where lid=@lid";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@lid", lid);
            cmd.ExecuteNonQuery();
            DataTable dt1 = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);

            int lno_old = Convert.ToInt32(ds.Tables[0].Rows[0]["lesson_num"]);
            cid = Convert.ToInt32(ds.Tables[0].Rows[0]["cid"]);
            int lno_new = Convert.ToInt32(DropDownList2.SelectedValue);
            SqlCommand cmd2;
            String up;
            if (lno_new > lno_old)
            {
                up = @"update ""Lessons"" set lesson_num=lesson_num-1 where cid=@cid and lesson_num between @lno_old and @lno_new";
            }
            else
            {
                up = @"update ""Lessons"" set lesson_num=lesson_num+1 where cid=@cid and lesson_num between @lno_old and @lno_new";

            }
            cmd2 = new SqlCommand(up, con);


            cmd2.Parameters.AddWithValue("@cid", cid);
            cmd2.Parameters.AddWithValue("@lno_old", lno_old);

            cmd2.Parameters.AddWithValue("@lno_new",lno_new);
            cmd.ExecuteNonQuery();

            Response.Write("$$CID="+cid+"$$");
            Response.Write("&&&&"+lno_old+"&" +lno_new+"&&&&");

            SqlCommand cmd1;

            if (ResFileUpload.HasFile && FileUpload2.HasFile)
            {
                //   Guid obj = Guid.NewGuid();
                resourceFileName = Path.GetFileName(ResFileUpload.FileName);
                resourceFileName = lid+"___"+resourceFileName.Replace(" ", "");
                ResFileUpload.SaveAs(Server.MapPath("~/assets/res/") + resourceFileName);
                //resourceFileName = "assets/res/" +lid + ".pdf";
               // ResFileUpload.SaveAs(Request.PhysicalApplicationPath + resourceFileName);

                videoFileName = "assets/videos/" + lid + ".mp4";
                FileUpload2.SaveAs(Request.PhysicalApplicationPath + videoFileName);

                update = @"update ""Lessons"" set name=@name, lesson_num=@lno, description=@intro, resourceFile=@pdf,  videoURL=@mp4  where lid=@lid";
                cmd1 = new SqlCommand(update, con);

                cmd1.Parameters.AddWithValue("@pdf", resourceFileName);
                cmd1.Parameters.AddWithValue("@mp4", videoFileName);
                Response.Write(videoFileName);
                Response.Write(resourceFileName);
                Response.Write("****Both****");

            }
            else if (ResFileUpload.HasFile)
            {
                // Guid obj = Guid.NewGuid();
                resourceFileName = Path.GetFileName(ResFileUpload.FileName);
                resourceFileName = lid + "___" + resourceFileName.Replace(" ", "");
                ResFileUpload.SaveAs(Server.MapPath("~/assets/res/") + resourceFileName);

                update = @"update ""Lessons"" set name=@name, lesson_num=@lno, description=@intro, resourceFile=@res where lid=@lid";
            cmd1 = new SqlCommand(update, con);
            Response.Write("****Only Resource****");
            Response.Write(resourceFileName);

            cmd1.Parameters.AddWithValue("@res", resourceFileName);

            }
            else if (FileUpload2.HasFile)
            {
                // Guid obj = Guid.NewGuid();
                videoFileName = "assets/videos/" + lid + ".mp4";
                FileUpload2.SaveAs(Request.PhysicalApplicationPath + videoFileName);

                update = @"update ""Lessons"" set name=@name,  lesson_num=@lno,description=@intro, videoURL=@mp4 where lid=@lid";
                cmd1 = new SqlCommand(update, con);

                Response.Write("****Only Video****");

                cmd1.Parameters.AddWithValue("@mp4", videoFileName);

            }
            else
            {
                if (noResource == true)
                {
                    update = @"update ""Lessons"" set  name=@name, lesson_num=@lno, description=@intro, resourceFile=NULL where lid=@lid";
                    cmd1 = new SqlCommand(update, con);
                    Response.Write("****No ResourceFile****");
                }
                else
                { update = @"update ""Lessons"" set  name=@name, lesson_num=@lno, description=@intro where lid=@lid";
                    cmd1 = new SqlCommand(update, con);
                    Response.Write("****None****");
                }

            }
            cmd1.Parameters.AddWithValue("@lid", lid);

            cmd1.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@intro", TextBox2.Text);
            cmd1.Parameters.AddWithValue("@lno", Convert.ToInt32(DropDownList2.SelectedValue));
            

            Response.Write(lid);

            Response.Write(TextBox1.Text);
            Response.Write(TextBox2.Text);
            Response.Write(videoFileName);
            Response.Write(resourceFileName);
            //Response.Write(TextBox4.Text);
            //Response.Write(TextBox5.Text);

          





          cmd1.ExecuteNonQuery();




            con.Close();
            Response.Redirect("Admin-EditLesson.aspx?lid=" + lid + "&status=updated");

        }

        protected void DelResource_Click(object sender, EventArgs e)
        {
            //con.Open();

            //string update= @"update ""Lessons"" set resourceFile=NULL where lid=@lid";
            //SqlCommand cmd1 = new SqlCommand(update, con);
            //cmd1.Parameters.AddWithValue("@lid", lid);
            //cmd1.ExecuteNonQuery();
            //con.Close();
            //Response.Redirect("Admin-EditLeson.aspx?lid=" + lid);

            Label2.Text = "No Resource File";
            DelResource.Visible = false;
            Label2.Visible = true;
            ResourcePanel.Visible = true;
            noResource = true;
            
        }

        // DelResource.PostBackUrl = "Admin-EditLesson.aspx?lid=" +lid;


    }
    
}