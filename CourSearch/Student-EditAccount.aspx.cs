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
    public partial class WebForm2 : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {

                    int sid = Convert.ToInt32(Session["sid"]);
                    con.Open();
                    // String query = @"select * from ""Student"" where id=@sid";
                    String query = @"SELECT s.name as name,s.email as email,s.picture as picture,u.password as password FROM ""User"" as u,""Student"" as s where s.email = u.email_id and s.id=@sid";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@sid", sid);
                    cmd.ExecuteNonQuery();
                    DataTable dt1 = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    TextBox1.Text = ds.Tables[0].Rows[0]["name"].ToString();
                    TextBox2.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    TextBox3.Text = ds.Tables[0].Rows[0]["password"].ToString();
                    Image.ImageUrl = ds.Tables[0].Rows[0]["picture"].ToString();

                    TextBox2.ReadOnly = true;

                    con.Close();
                }
            }

            if (Session["user"] != null)
            {
                if (Session["avatar_file"] != null)
                {

                    Image masteravatar = (Image)Master.FindControl("avatar");
                    //masteravatar.ImageUrl = Convert.ToString(Session["avatar"]);
                    masteravatar.ImageUrl = Convert.ToString(Session["avatar_file"]);                 //check this for avtar image not coming
                }
            }



        }


        protected void UpdateOnClick(object sender, EventArgs e)
        {

            string update;
            int sid = Convert.ToInt32(Session["sid"]);
            String email = Convert.ToString(Session["email"]);
            con.Open();



            SqlCommand cmd1;
            SqlCommand cmd2;
            SqlCommand cmd3;

            if (FileUpload1.HasFile )
            {
                String fileName = "assets/images/people/110/" + sid + ".jpg";
                FileUpload1.SaveAs(Request.PhysicalApplicationPath + fileName);
               


                update = @"update ""Student"" set picture=@picture where id=@sid";
                cmd1 = new SqlCommand(update, con);
                cmd1.Parameters.AddWithValue("@sid", sid);
                cmd1.Parameters.AddWithValue("@picture", fileName);
                cmd1.ExecuteNonQuery();


                if (TextBox3.Text != "")
                {
                    String update1 = @"update ""User"" set password=@password where email_id=@email";
                    cmd2 = new SqlCommand(update1, con);
                    cmd2.Parameters.AddWithValue("@password", TextBox3.Text);
                    cmd2.Parameters.AddWithValue("@email", email);
                    cmd2.ExecuteNonQuery();
                }
                String update2 = @"update ""Student"" set name=@name where id=@sid";
                cmd3 = new SqlCommand(update2, con);
                cmd3.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd3.Parameters.AddWithValue("@sid", sid);
                cmd3.ExecuteNonQuery();

                Session["avatar_file"] = fileName;

                if (Session["avatar_file"] != null)
                {

                    Image masteravatar = (Image)Master.FindControl("avatar");
                    //masteravatar.ImageUrl = Convert.ToString(Session["avatar"]);
                    masteravatar.ImageUrl = Convert.ToString(Session["avatar_file"]);                 //check this for avtar image not coming
                }
                else
                {

                    Image masteravatar = (Image)Master.FindControl("avatar");
                    masteravatar.ImageUrl = Convert.ToString(Session["~/assets/images/people/110/default.jpg"]);
                }

                String query4 = @"select name from ""Student"" where email=@email";
                SqlCommand cmd4 = new SqlCommand(query4, con);
                cmd4.Parameters.AddWithValue("@email", TextBox2.Text);
                String name = Convert.ToString(cmd4.ExecuteScalar());
                Session["user"] = name;
                Label usertext = this.Master.FindControl("UserName") as Label;
                usertext.Text = Convert.ToString(Session["user"]);

           

            }
            else
            {
                if (TextBox3.Text != "")
                {
                    email = Convert.ToString(Session["email"]);
                    update = @"update ""User"" set  password=@password where email_id=@email";
                    SqlCommand cmd5 = new SqlCommand(update, con);
                    cmd5.Parameters.AddWithValue("@password", TextBox3.Text);
                    cmd5.Parameters.AddWithValue("@email", email);
                    cmd5.ExecuteNonQuery();
                }
                String update2 = @"update ""Student"" set name=@name where id=@sid";
                cmd3 = new SqlCommand(update2, con);
                cmd3.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd3.Parameters.AddWithValue("@sid", sid);
                cmd3.ExecuteNonQuery();
               

            }




            lblErrorMessage.ForeColor = System.Drawing.Color.Green;
            lblErrorMessage.Text = "PROFILE UPDATED SUCCESSFULLY";
           // lblErrorMessage.Visible = true;



            Response.Redirect("Student-EditAccount.aspx");





            con.Close();
        }

    }
}