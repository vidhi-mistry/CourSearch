using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using System.Web.UI.DataVisualization.Charting;
using CrystalDecisions.CrystalReports.Engine;

namespace CourSearch
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                
                int year = 2017;
                for (year = 2017; year <= Convert.ToInt32(DateTime.Now.Year); year++)
                {
                    YearDropdown.Items.Add(new ListItem(year.ToString(), year.ToString()));
                }
                YearDropdown.Items.Add(new ListItem("All time", "All time"));

                YearDropdown.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = true;
                getAnnualCourseChart(DateTime.Now.Year.ToString());

            }
            report.Visible = false;

        }

        private void getAnnualCourseChart(string year)
        {

            con.Open();
            String query1 = @"select count(*) as ct from ""Courses""  where status='enabled'";
            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.Parameters.AddWithValue("@year", year);
            //cmd.Parameters.AddWithValue("@enddt", end);
            int ct = Convert.ToInt32(cmd1.ExecuteScalar());
            lbl.Text = "" + ct;

            if (year != "All time")
            {
                String query = @"select c.name as Name, count(*) as ct from ""Study"" as ss,""Courses"" as c where c.cid=ss.cid and DATEPART(  YYYY ,start_datetime)=@year group by c.name order by ct desc ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@year", year);
                SqlDataReader rdr = cmd.ExecuteReader();

                Series series = CourseChart.Series["Series1"];
                while (rdr.Read())
                {

                    series.Points.AddXY(rdr["Name"], rdr["ct"]);

                }

            }
            else
            {
                String query = @"select c.name as Name, count(*) as ct from ""Study"" as ss,""Courses"" as c where c.cid=ss.cid  group by c.name order by ct desc ";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@year", year);
                SqlDataReader rdr = cmd.ExecuteReader();

                Series series = CourseChart.Series["Series1"];
                while (rdr.Read())
                {

                    series.Points.AddXY(rdr["Name"], rdr["ct"]);

                }
            }

            //foreach (string month in months)
            //{


            //    DataRow dataRow = dt.AsEnumerable().FirstOrDefault(r => r.Field<string>("month") == month);
            //    if (dataRow != null)
            //    {
            //        series.Points.AddXY(month, dataRow[1]);

            //    }
            //    else
            //    {
            //        series.Points.AddXY(month, 0);

            //    }



        }

        protected void YearDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
           // YearDropdown.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = true;
            getAnnualCourseChart(YearDropdown.SelectedValue);
            if (YearDropdown.SelectedValue == "All time")
            {
                report.Visible = true;
            }
        }

        protected void report_Click(object sender, EventArgs e)
        {
            

            ReportDocument crystalReport = new ReportDocument(); // creating object of crystal report
            crystalReport.Load(Server.MapPath("~/allcourse.rpt")); // path of report 
          

            crystalReport.ExportToHttpResponse
            (CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "AllCourses"+DateTime.Now.ToString());


            //ReportDocument crystalReport1 = new ReportDocument(); // creating object of crystal report
            //crystalReport1.Load(Server.MapPath("~/myreport.rpt")); // path of report 

            //crystalReport1.ExportToHttpResponse
            //(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "course-status"+ DateTime.Now.ToString());
            ////here i have use [ CrystalDecisions.Shared.ExportFormatType.ExcelRecord ] to Export in Excel
        }
    }

       
    

}