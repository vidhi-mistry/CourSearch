<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-Home.aspx.cs" Inherits="CourSearch.WebForm4" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <%-- <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
                        <li class="breadcrumb-item active">Notifications</li>
                    </ol>--%>
   
    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>

    <div class="jumbotron alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
      </button>
                        <h2>Welcome Admin !</h2>
                        <p class="lead">This is your Dashboard.</p>
     
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header bg-white">
                                    <h4 class="card-title">Enrollments</h4>
                                    <p class="card-subtitle">Last 30 Days</p>
                                </div>
                                <div class="card__options">
                                    <a href="Admin-Enrollments.aspx" class="btn btn-sm btn-primary"><i class="material-icons">trending_up</i></a>
                                </div>
                                <div class="card-body text-center">
                                  <%--  <div class="chart" id="earnings-month" style="height:200px"></div>--%>
                                    <asp:Chart class="chart"   ID="monthlyenrollments" runat="server" Palette="None">
                        <Series>
                            <asp:Series Name="Series1"   XValueMember="Date" YValueMembers="TotalEnrollments" XValueType="Date"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">

                                <AxisX Title="Date">                      <MajorGrid Enabled ="False" />

                  </AxisX>
                  <AxisY Title=" Total Enrollments">                      <MajorGrid Enabled ="False" />
</AxisY>
                            </asp:ChartArea>
  

                        </ChartAreas>
                    </asp:Chart>

                                </div>
                            </div>
                            
                            <div class="card">
                                <div class="card-header bg-white">
                                    <h4 class="card-title">Latest Enrollments</h4>
                                </div>
                                <div class="card__options">
                                    <a href="Admin-Transactions.aspx" class="btn btn-sm btn-primary"><i class="material-icons">receipt</i></a>
                                </div>
                                <table class="table table-middle text-center">
                                    <tbody>
                                        <asp:DataList ID="DataList1" runat="server">
                                            <ItemTemplate>                                       
                                                <tr>
                                            <td>
                                                <div class="badge badge-light ">
                        <asp:Label ID="d1_date" runat="server" Text=<%#  DataBinder.Eval(Container.DataItem, "date", "{0:MM/dd/yyyy}") %>></asp:Label></div>
                                            </td>
                                            <td>
                            <asp:Label ID="d1_name" runat="server" Text=<%# Eval("name") %> Font-Bold="False" ForeColor="#0099FF" Font-Underline="False"></asp:Label></td>
                                            <td>#
                                <asp:Label ID="d1_id" runat="server" Text=<%# Eval("id") %>></asp:Label></td>
                                            <td></td>
                                        </tr>
                                                </ItemTemplate>
                                        
                                       
                                        </asp:DataList>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header bg-white">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="card-title">Top 3 Courses</h4>
                                            <p class="card-subtitle">All Time</p>
                                        </div>
                                        <div class="media-right media-middle">
                                            <a class="btn btn-sm btn-primary" href="Admin-AllCourses.aspx"><i class="material-icons">school</i></a>
                                        </div>
                                    </div>
                                </div>
                                <ul class="list-group list-group-fit mb-0">
                                    <asp:DataList ID="DataList2" runat="server">
                                        <ItemTemplate>
                                    <li class="list-group-item">
                                        <div class="media">
                                            <div class="media-body media-middle">
                                               
                                        <asp:Label ID="d2_name" runat="server"  ForeColor="#0099FF" Text=<%# Eval("name") %>></asp:Label>
                                            </div>
                                            <div class="media-right media-middle">
                                                <div class="text-center">
                                                    <span class="badge badge-pill  badge-success ">
                                            <asp:Label ID="d2_ct" runat="server" Text=<%# Eval("ct") %> ></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                            </ItemTemplate>
                                    </asp:DataList>
                                  
                                 
                                </ul>
                            </div>
                            <div class="card">
                                <div class="card-header bg-white media">
                                    <div class="media-body media-middle">
                                        <h4 class="card-title">Total Students : <asp:Label ID="TotUsers" runat="server" Text="Label"></asp:Label></h4>
                                    </div>
                                    <div class="media-right text-right" style="min-width: 80px;">
<%--                                        <a href="#" class="btn btn-outline-primary btn-sm"><i class="material-icons">keyboard_arrow_left</i></a>--%>
                                        <a href="Admin-Users.aspx" class="btn btn-primary btn-sm"><i class="material-icons">person</i></a>
                                    </div>
                                </div>
                                <div class="card-body media">
                                    <div class="media-left">
                                        <%--<a href="#">
            <img src="assets/images/people/110/guy-9.jpg" alt="Guy" width="40" class="rounded-circle">
          </a>--%>
                                    </div>
                                    <div class="media-body text-center"> 
                                        <asp:Chart class="chart"   ID="UserTypes" runat="server" Palette="None">
                        <Series>
                            <asp:Series Name="Series1" XValueType="Date" ChartType="Doughnut"></asp:Series>
                        </Series>
                                             <Legends>  
            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"  
                LegendStyle="Row" />  
        </Legends> 
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">

                                <AxisX Title="Date">
                  </AxisX>
                  <AxisY Title=" Total Enrollments"></AxisY>
                            </asp:ChartArea>
  

                        </ChartAreas>
                    </asp:Chart>

                                      <%--  <small class="text-muted">27 min ago</small><br>
                                        <a href="instructor-profile.html">mosaicpro</a>--%>
<%--                                        <small class="text-muted"> on your <a href="instructor-course-edit.html">Github Basics</a> course</small>--%>
                                        <p class="mb-0">
                       </p>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
    <!-- Last 30 days earnings chart -->
  <%--  <script>
        (function() {
            var earnings = []

            // Create a date range for the last 30 days
            var start = moment().subtract(30, 'days').format('YYYY-MM-DD') // 30 days ago
            var end = moment().format('YYYY-MM-DD') // today
            var range = moment.range(start, end)

            // Create the earnings graph data
            // Iterate the date range and assign a random ($) earnings value for each day
            range.by('days', function(moment) {
                earnings.push({
                    y: moment.format(),
                    a: Math.floor(Math.random() * 300) + 10
                })
            })

            new Morris.Area({
                element: 'earnings-month',
                data: earnings,
                xkey: 'y',
                ykeys: ['a'],
                labels: ['Earnings'],
                xLabels: 'day',
                dateFormat: function(date) {
                    return moment(date).calendar()
                },
                xLabelFormat: function(date) {
                    return moment(date).format('MM/D')
                },
                preUnits: '$',
                lineColors: [colors['chart-primary']],
                fillOpacity: .3,
                pointSize: 3,
                lineWidth: 2,
                gridTextColor: '000',
                resize: true
            })
        })()
    </script>--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" SelectCommand="SELECT count(distinct s.id)- count(distinct ss.sid) as NotEnrolled , count(distinct ss.sid) as Enrolled FROM [Student] as s left join [Study] as ss on s.id=ss.sid
"></asp:SqlDataSource>
</asp:Content>

