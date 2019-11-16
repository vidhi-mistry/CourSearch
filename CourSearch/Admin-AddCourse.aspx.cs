using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            Guid obj = Guid.NewGuid();
            String fileName= "assets/images/" + obj.ToString() + ".JPG" ;
            FileUpload1.SaveAs(Request.PhysicalApplicationPath + fileName);

            string insert = @"insert into ""Courses"" (name,level,duration_days,category,picture,intro) values(@name,@level,@duration,@category,@picture,@intro)";
            
            SqlCommand cmd1 = new SqlCommand(insert, con);

            cmd1.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@intro",TextBox2.Text);
            cmd1.Parameters.AddWithValue("@category", TextBox3.Text);
            cmd1.Parameters.AddWithValue("@picture", fileName);

            cmd1.Parameters.AddWithValue("@duration", TextBox4.Text);

            cmd1.Parameters.AddWithValue("@level", TextBox5.Text);



           
            cmd1.ExecuteNonQuery();
           


            Response.Redirect("Admin-Courses.aspx");


            con.Close();
        }
    }
}