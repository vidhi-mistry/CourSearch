<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-Enrollments.aspx.cs" Inherits="CourSearch.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
      <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Total Enrollments</li>
                    </ol>
     
    <div class="card">
        <div class="card-header text-center">ENROLLMENT DATA </div>
        <div class="card-body">
                    <div class="form-group float-md-left">
                        <asp:Label runat="server" ID="Label1" Text="Select Year " ></asp:Label>
                                     <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="YearDropdown_SelectedIndexChanged" class="custom-select" ID="YearDropdown" runat="server"></asp:DropDownList>
                                                                  <asp:Button visible="true" OnClick="report_Click" CssClass="btn btn-primary" id="report" Text="Download Report" runat="server"></asp:Button>

                            <%--<select class="custom-select">
        <option selected>2015</option>
        <option value="1">2014</option>
        <option value="2">2013</option>
        <option value="3">2012</option>
      </select>--%>
                        </div>
                        <div class="clearfix"></div>
        </div>
        <div class=" card-body text-center">
                     
                       <%-- <div class="chart" id="bar" style="height: 300px;"></div>--%>
                 
                      <asp:Chart ID="Enrollments" runat="server">
          <Series>
              <asp:Series Name="Series1" XValueType="String" IsXValueIndexed="True"></asp:Series>
          </Series>
          <ChartAreas>
              <asp:ChartArea Name="ChartArea1">
                  <AxisX Title="Month" IsLabelAutoFit="True" LabelAutoFitStyle="LabelsAngleStep90" Interval="1">
                 <MajorGrid Enabled ="False" /> </AxisX>
                  <AxisY Title="Total Enrollments">
                      <MajorGrid Enabled ="False" />
                  </AxisY>
              </asp:ChartArea>
          </ChartAreas>
      </asp:Chart>    
                    </div>
                 </div>

                    <div class="card">
                        <div class="card-header bg-white text-center">
                            <h5 class="card-title">Total : <span class="text-primary"><asp:Label runat="server" ID="lbl" Text="" ></asp:Label></span></h5>
                        </div>

                   <%--     <table class="table table-striped table-middle">
                            <thead>
                                <tr class="text-uppercase small">
                                    <th>Course</th>
                                    <th class="text-center" style="width:130px">Expense</th>
                                    <th class="text-center" style="width:130px">Income</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="media-left">
                                                <img src="assets/images/vuejs.png" alt="" width="80" class="rounded">
                                            </div>
                                            <div class="media-body media-middle">
                                                Vuejs Basics
                                                <div class="text-muted small">34 Sales</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">&dollar;120</td>
                                    <td class="text-center">&dollar;1,234</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="media-left">
                                                <img src="assets/images/nodejs.png" alt="" width="80" class="rounded">
                                            </div>
                                            <div class="media-body media-middle">
                                                NodeJs for Beginners
                                                <div class="text-muted small">34 Sales</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <i class="material-icons text-muted-light">remove</i>
                                    </td>
                                    <td class="text-center">&dollar;2,521</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="media-left">
                                                <img src="assets/images/gulp.png" alt="" width="80" class="rounded">
                                            </div>
                                            <div class="media-body">
                                                Advanced Gulp Workflows
                                                <div class="text-muted small">8 Sales</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <i class="material-icons text-muted-light">remove</i>
                                    </td>
                                    <td class="text-center">&dollar;1,413</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="media-left">
                                                <img src="assets/images/github.png" alt="" width="80" class="rounded">
                                            </div>
                                            <div class="media-body media-middle">
                                                Basics of GitHub
                                                <div class="text-muted small">31 Sales</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <i class="material-icons text-muted-light">remove</i>
                                    </td>
                                    <td class="text-center">&dollar;1,413</td>
                                </tr>
                            </tbody>
                        </table>--%>
                    </div>
</asp:Content>
