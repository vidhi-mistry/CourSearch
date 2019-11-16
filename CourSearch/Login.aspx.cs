using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.ComponentModel.DataAnnotations;

namespace CourSearch
{
    public partial class Login : System.Web.UI.Page
    {
        int cid;
        public bool IsValidEmail(string source)
        {
            return new EmailAddressAttribute().IsValid(source);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
             lblErrorMessage.Visible = false;
            if (Session["User"] != null)
            {
                Session.Remove("User");
                Session.Remove("avatar_file");
                Session.Remove("sid");

            }
            if (Request.QueryString["cid"] != null)
            {
                cid = Convert.ToInt32(Request.QueryString["cid"]);
            }
            
        }

        protected void Password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            
            try
            {
                if (Email.Text.Trim()!="" & Password.Text.Trim()!="" & IsValidEmail(Email.Text.Trim())==true)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
                    con.Open();                   
                    String query0 = @"select count(1) from ""User"" where email_id=@email";
                    SqlCommand cmd0 = new SqlCommand(query0, con);
                    cmd0.Parameters.AddWithValue("@email", Email.Text.Trim());
                    int count0 = Convert.ToInt32(cmd0.ExecuteScalar());
                    if (count0 == 1)
                    {
                        String query1 = @"select count(1) from ""User"" where email_id=@email and password=@pwd";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.Parameters.AddWithValue("@email", Email.Text.Trim());
                        cmd1.Parameters.AddWithValue("@pwd", Password.Text);
                        int count1 = Convert.ToInt32(cmd1.ExecuteScalar());
                        if (count1 == 1)
                        {
                            
                            String query2 = @"select type from ""User"" where email_id=@email and password=@pwd";
                            SqlCommand cmd2 = new SqlCommand(query2, con);
                            cmd2.Parameters.AddWithValue("@email", Email.Text.Trim());
                            cmd2.Parameters.AddWithValue("@pwd", Password.Text);
                            String type = Convert.ToString(cmd2.ExecuteScalar()).ToUpper();
                            //Response.Redirect(type+".aspx");

                            if (type.ToUpper() == "ADMIN")
                            {
                                Session["email"] = Email.Text;
                                Session["user"] = "ADMIN";
                                Response.Redirect("Admin-Home.aspx");
                            }

                            else if (type.ToUpper() == "S")
                            {

                                Session["email"] = Email.Text;
                                String query3 = @"select name from ""Student"" where email=@email";
                                SqlCommand cmd3 = new SqlCommand(query3, con);
                                cmd3.Parameters.AddWithValue("@email", Email.Text.Trim());
                               
                                String name = Convert.ToString(cmd3.ExecuteScalar());
                                Session["user"] = name;

                                String query4 = @"select picture from ""Student"" where email=@email";
                                SqlCommand cmd4 = new SqlCommand(query4, con);
                                cmd4.Parameters.AddWithValue("@email", Email.Text.Trim());

                                String picture = Convert.ToString(cmd4.ExecuteScalar());
                                Session["avatar_file"] = picture;

                                String query5 = @"select id from ""Student"" where email=@email";
                                SqlCommand cmd5 = new SqlCommand(query5, con);
                                cmd5.Parameters.AddWithValue("@email", Email.Text.Trim());

                                String sid = Convert.ToString(cmd5.ExecuteScalar());
                                Session["sid"] = sid;

                                if (Request.QueryString["cid"] != null)
                                {
                                    Response.Redirect("AddCourse.aspx?cid="+cid);
                                    //Response.Write("Adding course");
                                }
                                else
                                {
                                   

                                     Response.Redirect("Student-home.aspx");
                                }
                            }

                            else if (type.ToUpper() == "I")
                            {
                                //String query4 = @"select name from ""Instructor"" where email_id=@email";
                                //SqlCommand cmd4 = new SqlCommand(query4, con);
                                //cmd4.Parameters.AddWithValue("@email", Email.Text.Trim());

                                //String name = Convert.ToString(cmd4.ExecuteScalar());
                                //Session["user"] = name;
                                Response.Redirect("instructor.aspx");

                            }


                        }
                        else
                        {

                            lblErrorMessage.Text="Incorrect Password";
                            lblErrorMessage.Visible = true;

                        }
                    }
                    else
                    {
                        lblErrorMessage.Text = "Sorry, we can't find an account with this email address. Please try again or create a new account.";
                        lblErrorMessage.Visible = true;
                    }


                    


                    con.Close();
                }
            }
            catch (Exception ex)
            {
            Response.Write(ex);
            }
        }

        protected void Email_TextChanged(object sender, EventArgs e)
        {
           
        }
    }
}