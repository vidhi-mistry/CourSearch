using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                UserName.Text = Convert.ToString(Session["User"]);
                if (Session["avatar_file"] != null)
                {
                    avatar.ImageUrl = Convert.ToString(Session["avatar_file"]);
                }
                else
                {
                    avatar.ImageUrl = "~/assets/images/people/110/default.jpg";
                }
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
    }
}