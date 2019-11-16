using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        int cid;
        String videoFileName;
        String resourceFileName;
        int count;
        int lno;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (!IsPostBack)
            //{

                if (Request.QueryString["cid"] != null)
                {
                    cid = Convert.ToInt32(Request.QueryString["cid"]);
                    LinkButton1.PostBackUrl = "Admin-EditCourse.aspx?id=" + cid;
                    con.Open();
                    String query = @"select count(*) from ""Lessons"" where cid=@cid";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@cid", cid);
                    count = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                    //Response.Write(count);
                    //Response.Write(cid);


                    for (int i=1;i<=count+1;i++)
                    {
                        DropDownList2.Items.Add(new ListItem(i.ToString(), i.ToString()));

                    }
                    
                }
                else
                {
                    Response.Redirect("Admin-Home.aspx");
                }
               
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Response.Write(count);
            
            string insert;
            SqlCommand cmd1;
            con.Open();
            Guid obj = Guid.NewGuid();
            lno = Convert.ToInt32(DropDownList2.SelectedValue);

            string update = @"update ""Lessons"" set lesson_num=lesson_num+1 where cid=@cid and lesson_num>=@lno";
            SqlCommand cmd = new SqlCommand(update, con);
            cmd.Parameters.AddWithValue("@cid", cid);
            cmd.Parameters.AddWithValue("@lno", lno);
            cmd.ExecuteNonQuery();


            if (FileUpload2.HasFile && ResFileUpload.HasFile)
            {
                

                resourceFileName = Path.GetFileName(ResFileUpload.FileName);
                resourceFileName = obj.ToString() + "___" + resourceFileName.Replace(" ", "");
                ResFileUpload.SaveAs(Server.MapPath("~/assets/res/") + resourceFileName);

                // videoFileName = "assets/videos/" + lid + ".mp4";

                videoFileName = "assets/videos/" + Path.GetFileName(ResFileUpload.FileName)+".mp4";
                FileUpload2.SaveAs(Request.PhysicalApplicationPath + videoFileName);


                insert = @"insert into ""Lessons"" (name,description,cid,videoURL,lesson_num,resourceFile) values(@name,@des,@cid,@url,@no,@res)";
                cmd1 = new SqlCommand(insert, con);
                cmd1.Parameters.AddWithValue("@res", resourceFileName);
            }
            else
            {
                videoFileName = "assets/videos/" + obj.ToString() + Path.GetFileName(ResFileUpload.FileName)+".mp4";
                FileUpload2.SaveAs(Request.PhysicalApplicationPath + videoFileName);

                 insert = @"insert into ""Lessons"" (name,description,cid,videoURL,lesson_num) values(@name,@des,@cid,@url,@no)";
                cmd1 = new SqlCommand(insert, con);
            }


                cmd1.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd1.Parameters.AddWithValue("@des", TextBox2.Text);
                cmd1.Parameters.AddWithValue("@cid", Convert.ToInt32(Request.QueryString["cid"]));
                cmd1.Parameters.AddWithValue("@url", videoFileName);

                cmd1.Parameters.AddWithValue("@no", Convert.ToInt32(DropDownList2.SelectedValue));
                
               cmd1.ExecuteNonQuery();


               Response.Write(videoFileName);

               Response.Write(resourceFileName);


           
            Response.Redirect("Admin-EditCourse.aspx?id=" + cid);
            con.Close();
        }
    }

       
   
}