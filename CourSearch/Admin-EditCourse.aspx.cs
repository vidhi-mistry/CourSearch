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
    public partial class WebForm11 : System.Web.UI.Page
    {
        int id;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
       

        protected void Page_Load(object sender, EventArgs e)
        {
            Message.Visible = false;
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    con.Open();
                    String query = @"select * from ""Courses"" where cid=@id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                    DataTable dt1 = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                   
                    TextBox1.Text = ds.Tables[0].Rows[0]["name"].ToString();
                    TextBox2.Text = ds.Tables[0].Rows[0]["intro"].ToString();
                    TextBox3.Text = ds.Tables[0].Rows[0]["category"].ToString();
                    TextBox4.Text = ds.Tables[0].Rows[0]["duration_days"].ToString();
                    TextBox5.Text = ds.Tables[0].Rows[0]["level"].ToString();
                    Image.ImageUrl = ds.Tables[0].Rows[0]["picture"].ToString();
                    DropDownList1.Items.FindByValue(ds.Tables[0].Rows[0]["status"].ToString()).Selected = true;
                    AddLesson.PostBackUrl = "Admin-AddLesson.aspx?cid=" + id;
                    //ReorderLesson.PostBackUrl = "Admin-ReorderLesson.aspx?cid=" + id;



                    String query2 = @"select * from ""Lessons"" where cid=@id order by lesson_num asc";
                    SqlCommand cmd3 = new SqlCommand(query2, con);
                    cmd3.Parameters.AddWithValue("@id", id);
                    cmd3.ExecuteNonQuery();
                    DataTable dt2 = new DataTable();
                    SqlDataAdapter da2 = new SqlDataAdapter(cmd3);
                    da2.Fill(dt2);
                    Repeater2.DataSource = dt2;
                    Repeater2.DataBind();


                    con.Close();



                    if (Request.QueryString["status"] != null)
                    {
                        if (Request.QueryString["status"] == "updated")
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

        protected void Update_Click(object sender, EventArgs e)
        {

            string update;
            id = Convert.ToInt32(Request.QueryString["id"].ToString());

            con.Open();

           

            SqlCommand cmd1;

            if (FileUpload1.HasFile)
            {
                //Guid obj = Guid.NewGuid();
                String fileName = "assets/images/" + id + ".JPG";
                FileUpload1.SaveAs(Request.PhysicalApplicationPath + fileName);

                update = @"update ""Courses"" set name=@name, intro=@intro, category=@category,picture=@picture, duration_days=@duration, level=@level ,status=@status where cid=@id";
                cmd1 = new SqlCommand(update, con);

                cmd1.Parameters.AddWithValue("@picture", fileName);

            }
            else
            {
                update = @"update ""Courses"" set name=@name, intro=@intro, category=@category, duration_days=@duration, level=@level,status=@status where cid=@id";
                cmd1 = new SqlCommand(update, con);

            }
            cmd1.Parameters.AddWithValue("@id", id);

            cmd1.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@intro", TextBox2.Text);
            cmd1.Parameters.AddWithValue("@category", TextBox3.Text);

            cmd1.Parameters.AddWithValue("@duration", TextBox4.Text);

            cmd1.Parameters.AddWithValue("@level", TextBox5.Text);
            cmd1.Parameters.AddWithValue("@status",DropDownList1.SelectedValue);

            //Response.Write(id);

            //Response.Write(TextBox1.Text);
            //Response.Write(TextBox2.Text);
            //Response.Write(TextBox3.Text);
            //Response.Write(TextBox4.Text);
            //Response.Write(TextBox5.Text);


                



            cmd1.ExecuteNonQuery();
            Response.Redirect("Admin-EditCourse.aspx?id=" + id + "&status=updated");





            con.Close();
        }


    }

}

      
