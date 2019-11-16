using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class Default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelSession.Visible = false;
            PanelSignIn.Visible = true;
            PanelSignUp.Visible = true;

            if (Session["User"] != null)
            {
                PanelSession.Visible = true;
                PanelSignIn.Visible = false;
                PanelSignUp.Visible = false;
                UserName.Text = Convert.ToString(Session["User"]);
                if (Session["avatar_file"] != null)
                {
                    avatar.ImageUrl =Convert.ToString(Session["avatar_file"]);
                }
                else
                {
                    avatar.ImageUrl = "~/assets/images/people/110/default.jpg";
                }
            }
            else
            {

            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Remove("User");
            Session.Remove("avatar_file");
          //  Session.Remove("sid");
            Response.Redirect("Home.aspx");
           
        }
    }
    
}