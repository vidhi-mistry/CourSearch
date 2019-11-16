using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace CourSearch
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        int tot;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            getTotalUsers();
            getUserChart();
            getLatestEnrollments();
            getTopCourses();
            getMonthlyEnrollments();
        }

        private void getUserChart()
        {
            DateTime start = DateTime.Today.AddDays(-30);
            DateTime end = DateTime.Today;

            con.Open();
            String query = @"SELECT count(distinct s.id) - count(distinct ss.sid) as NotEnrolled , count(distinct ss.sid) as Enrolled FROM[Student] as s left join[Study] as ss on s.id = ss.sid";

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader rdr = cmd.ExecuteReader();
           
            if (rdr.Read())
            {
                int enrolled = Convert.ToInt32(rdr["Enrolled"].ToString());
                int notenrolled = Convert.ToInt32(rdr["NotEnrolled"].ToString());
                Series series = UserTypes.Series["Series1"];
                series.Points.AddXY("Enrolled", enrolled);
                series.Points.AddXY("Not Enrolled", notenrolled);
                //UserTypes.DataBindTable(rdr, "Date");
            }
            con.Close();

        }

        private void getMonthlyEnrollments()
        {

            DateTime start = DateTime.Today.AddDays(-30);
            DateTime end = DateTime.Today;

            con.Open();
            String query = @"select cast(datepart(day,start_datetime) as varchar(2)) +'-'+ cast(datepart(month,start_datetime) as varchar(2)) as Date ,count(*) as TotalEnrollments from ""Study"" where start_datetime between @startdt and @enddt group by start_datetime";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@startdt", start);
            cmd.Parameters.AddWithValue("@enddt", end);
            SqlDataReader rdr = cmd.ExecuteReader();
            monthlyenrollments.DataBindTable(rdr, "Date");
            con.Close();

            //chartArea.AxisX.Title = "X Axis";
            //chartArea.AxisY.Title = "Y Axis";
           
           // DataTable dt = new DataTable();
           // SqlDataAdapter da = new SqlDataAdapter(cmd);
           // da.Fill(dt);

            //foreach (DateTime day in EachCalendarDay(start, end))
            //{

            //    Response.Write("Date is : " + day.ToString("dd-MM-yyyy"));
            //}
        }

        public IEnumerable<DateTime> EachCalendarDay(DateTime startDate, DateTime endDate)
        {
            for (var date = startDate.Date; date.Date <= endDate.Date; date = date.AddDays(1)) yield
            return date;
        }

        private void getTopCourses()
        {
            con.Open();
            String query = @"select top 3 c.name as name, count(*) as ct from ""Study"" as ss,""Courses"" as c where c.cid=ss.cid group by c.name order by ct desc ";
            SqlCommand cmd = new SqlCommand(query, con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            DataList2.DataSource = dt;
            DataList2.DataBind();

            con.Close();
        }

        private void getLatestEnrollments()
        {
            con.Open();
            String query = @"select top 5 ss.start_datetime as date,ss.id as id, c.name from ""Study"" as ss,""Courses"" as c where c.cid=ss.cid order by start_datetime desc ";
            SqlCommand cmd = new SqlCommand(query, con);
             DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();

            con.Close();
        }

        private void getTotalUsers()
        {
            con.Open();
            String query = @"select count(*) from ""Student"" ";
            SqlCommand cmd = new SqlCommand(query, con);
            tot = Convert.ToInt32(cmd.ExecuteScalar());
            TotUsers.Text = tot.ToString();

            con.Close();
        }
    }

       
    
}