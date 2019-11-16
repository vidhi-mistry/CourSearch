using CrystalDecisions.CrystalReports.Engine;
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
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

            if (Request.QueryString["Search"] == null)
            {

                DataList1.Visible = true;
                DataList2.Visible = false;
            }
            else
            {
                DataList2.Visible = true;
                DataList1.Visible = false;


                String query0 = @"select * from ""Courses"" where name like ('%" + Request.QueryString["Search"].ToString() + "%') ";
                SqlCommand cmd0 = new SqlCommand(query0, con);
                cmd0.ExecuteNonQuery();
                DataTable dt1 = new DataTable();
                SqlDataAdapter da1 = new SqlDataAdapter(cmd0);
                da1.Fill(dt1);
                DataList2.DataSource = dt1;
                DataList2.DataBind();

            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //con.Open();

            //String query = "DELETE FROM [Courses] WHERE [cid] = @original_cid AND [name] = @original_name AND [level] = @original_level AND [duration_days] = " +
            //    "@original_duration_days AND [category] = @original_category AND [instructor_id] = @original_instructor_id AND (([picture] = @original_picture) OR " +
            //    "([picture] IS NULL AND @original_picture IS NULL)) AND (([intro] = @original_intro) OR ([intro] IS NULL AND @original_intro IS NULL))";
            //SqlCommand cmd = new SqlCommand(query, con);
            //var id = (Label)e.Item.FindControl("Id");
            //cmd.ExecuteNonQuery();
            //Response.Write("DEleted");

            //con.Close();
        }

        protected void report_Click(object sender, EventArgs e)
        {
            ReportDocument crystalReport1 = new ReportDocument(); // creating object of crystal report
            crystalReport1.Load(Server.MapPath("~/myreport.rpt")); // path of report 

            crystalReport1.ExportToHttpResponse
            (CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "course-status" + DateTime.Now.ToString());
            //here i have use [ CrystalDecisions.Shared.ExportFormatType.ExcelRecord ] to Export in Excel
        }
    }
}