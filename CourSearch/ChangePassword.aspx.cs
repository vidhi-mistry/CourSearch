using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class ChangePassword : System.Web.UI.Page
    {
      

        public bool IsValidEmail(string source)
        {
            return new EmailAddressAttribute().IsValid(source);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            lblErrorMessage.Visible = true;
        }

       
        protected void Button1_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spResetPassword", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramemail = new SqlParameter("@email",SendEmail.Text.Trim());

                cmd.Parameters.Add(paramemail);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (Convert.ToBoolean(rdr["ReturnCode"]))
                    {
                        SendPasswordResetEmail(rdr["Email_Id"].ToString(), rdr["UniqueId"].ToString());
                        lblErrorMessage.Text = "An email with instructions to reset your password is sent to your registered email";
                    }
                    else
                    {
                        lblErrorMessage.Text = "Username not found!";
                    }
                }
            }


        }

        private void SendPasswordResetEmail(string ToEmail, string UniqueId)
        {
            // MailMessage class is present is System.Net.Mail namespace
            MailMessage mailMessage = new MailMessage("coursearch12@gmail.com", ToEmail);


            // StringBuilder class is present in System.Text namespace
            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear " + "User" + ",<br/><br/>");
            sbEmailBody.Append("Please click on the following link to reset your password");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("http://localhost:64770/ResetPassword.aspx?uid=" + UniqueId);
            sbEmailBody.Append("<br/><br/>");
           // sbEmailBody.Append("<b></b>");

            mailMessage.IsBodyHtml = true;

            mailMessage.Body = sbEmailBody.ToString();
            mailMessage.Subject = "Reset Your Password";
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "coursearch12@gmail.com",
                Password = "coursearchpassword"
            };

            smtpClient.EnableSsl = true;
            smtpClient.Send(mailMessage);
        }




        protected void Email_TextChanged(object sender, EventArgs e)
        {

        }
       
    }
}