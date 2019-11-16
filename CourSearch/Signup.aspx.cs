using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lblErrorMessage.Visible = false;
            if (!IsPostBack)
            {
               
            }

        }
        public bool IsValidEmail(string source)
        {
            return new EmailAddressAttribute().IsValid(source);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Email.Text.Trim() != "" & Password.Text.Trim() != "" & ConfirmPassword.Text.Trim() != "" & Name.Text.Trim() != ""
                & Contact.Text.Trim() != "" & IsValidEmail(Email.Text.Trim()) == true & Password.Text == ConfirmPassword.Text)
            {
                try
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
                    con.Open();

                    String query0 = @"select count(1) from ""User"" where email_id=@email";
                    SqlCommand cmd0 = new SqlCommand(query0, con);
                    cmd0.Parameters.AddWithValue("@email", Email.Text.Trim());
                    int count0 = Convert.ToInt32(cmd0.ExecuteScalar());
                    if (count0 == 0)
                    {
                        string insert1 = @"insert into ""User"" (email_id,password,type) values(@email,@pwd,@type)";
                        string insert2 = @"insert into ""Student"" (email,contact,name) values(@email,@contact,@name)";
                        SqlCommand cmd1 = new SqlCommand(insert1, con);
                        SqlCommand cmd2 = new SqlCommand(insert2, con);

                        
                        cmd1.Parameters.AddWithValue("@email", Email.Text);
                        cmd1.Parameters.AddWithValue("@pwd", Password.Text);
                        cmd1.Parameters.AddWithValue("@type", "s");



                        cmd2.Parameters.AddWithValue("@email", Email.Text);
                        cmd2.Parameters.AddWithValue("@contact", Contact.Text);
                        cmd2.Parameters.AddWithValue("@name", Name.Text);

                        cmd1.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();


                        Response.Redirect("Login.aspx");
                        
                    }
                    else if (count0 == 1)
                    {
                        lblErrorMessage.Text = "An account with this email address already exists";
                        lblErrorMessage.Visible = true;
                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                    
                }
            }
            else if(Password.Text != ConfirmPassword.Text)
            {
                //lblErrorMessage.Text = "Passwords don't match !";
                //lblErrorMessage.Visible = true;
            }
        }
    }

       
 }
