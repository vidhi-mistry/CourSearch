using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace CourSearch
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPasswordResetLinkValid())
                {
                    lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                    lblErrorMessage.Text = "Password Reset link has expired or is invalid";
                }
            }

        }
        private bool ExecuteSP(string SPName, List<SqlParameter> SPParameters)
        {
            string CS = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(SPName, con);
                cmd.CommandType = CommandType.StoredProcedure;

                foreach (SqlParameter parameter in SPParameters)
                {
                    cmd.Parameters.Add(parameter);
                }

                con.Open();
                return Convert.ToBoolean(cmd.ExecuteScalar());
            }
        }

        private bool IsPasswordResetLinkValid()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@GUID",
                    Value = Request.QueryString["uid"]
                }
            };

            return ExecuteSP("spPasswordResetLinkValid", paramList);
        }


        private bool ChangeUserPassword()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
                {
                    new SqlParameter()
                    {
                        ParameterName = "@GUID",
                        Value = Request.QueryString["uid"]
                    },
                     new SqlParameter()
                    {
                        ParameterName = "@Password",
                        Value = Password.Text
                    }
                };

            return ExecuteSP("spChangePassword", paramList);
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ChangeUserPassword())
            {
                lblErrorMessage.Text = "Password Changed Successfully!";
            }
            else
            {
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Password Reset link has expired or is invalid";
            }

        }
    }
}