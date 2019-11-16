using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
              
                int year = 2017;
                for (year = 2017; year <= Convert.ToInt32(DateTime.Now.Year); year++)
                {
                    YearDropdown.Items.Add(new ListItem(year.ToString(), year.ToString()));
                }
                YearDropdown.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = true;
                getAnnualEnrollments(Convert.ToInt32(DateTime.Now.Year));
            }
            
           
        }

        private void getAnnualEnrollments(int year)
        {
            string[] months = DateTimeFormatInfo.CurrentInfo.MonthNames;

            con.Open();
            String query = @"select FORMAT( start_datetime, 'MMMM') as month ,count(*) as ct from ""Study""  where DATEPART(  YYYY ,start_datetime)=@year group by  FORMAT( start_datetime, 'MMMM')";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@year", year);
            //cmd.Parameters.AddWithValue("@enddt", end);
            SqlDataReader rdr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rdr);
           Series series = Enrollments.Series["Series1"];


            String query1 = @"select count(*) as ct from ""Study""  where DATEPART(  YYYY ,start_datetime)=@year";
            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.Parameters.AddWithValue("@year", year);
            //cmd.Parameters.AddWithValue("@enddt", end);
            int ct = Convert.ToInt32(cmd1.ExecuteScalar());
            lbl.Text = "" + ct;
            foreach (string month in months)
            {
               

                DataRow dataRow = dt.AsEnumerable().FirstOrDefault(r => r.Field<string>("month") == month);
                if (dataRow != null)
                {
                    series.Points.AddXY(month, dataRow[1]); 

                }
                else
                {
                    series.Points.AddXY(month, 0);

                }

                


            }
            
        }
        protected void report_Click(object sender, EventArgs e)
        {


            ReportDocument crystalReport = new ReportDocument(); // creating object of crystal report
            crystalReport.Load(Server.MapPath("~/trns.rpt")); // path of report 


            crystalReport.ExportToHttpResponse
            (CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "AllCourses");
            //here i have use [ CrystalDecisions.Shared.ExportFormatType.ExcelRecord ] to Export in Excel
        }
        protected void YearDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            //YearDropdown.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = true;
            getAnnualEnrollments(Convert.ToInt32(Convert.ToInt32(YearDropdown.SelectedValue)));
        }
    }
}