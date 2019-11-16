<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-AllCourses.aspx.cs" Inherits="CourSearch.WebForm19" %>
<%--<%@ Register assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
      <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active">All Courses</li>
                    </ol>
     
    <div class="card">
                <div class="card-header">COURSES DATA 
                 
                </div>
        

        <div class="card-body">
                      
            <div class="form-group float-md-left">
                        <asp:Label runat="server" ID="Label1" Text="Select Year " ></asp:Label>
                                     <asp:DropDownList AutoPostBack="True"   OnSelectedIndexChanged="YearDropdown_SelectedIndexChanged" class="custom-select" ID="YearDropdown" runat="server"></asp:DropDownList>
                                                                                                           <asp:Button visible="false" OnClick="report_Click" CssClass="btn btn-primary" id="report" Text="Download Report" runat="server"></asp:Button>

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
                 
                      <asp:Chart ID="CourseChart"  runat="server" Palette="BrightPastel">
          <Series>
              <asp:Series Name="Series1"  ChartType="Pie" Color="White" IsValueShownAsLabel="True" LabelForeColor="White"></asp:Series>
          </Series><Legends>  
            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="True" Name="Default"  
                LegendStyle="Column" IsEquallySpacedItems="True" IsDockedInsideChartArea="True" MaximumAutoSize="100" />  
        </Legends> 
          <ChartAreas>
              <asp:ChartArea Name="ChartArea1">
                  
                                <AxisX >
                  </AxisX>
                  <AxisY ></AxisY>
              </asp:ChartArea>
          </ChartAreas>
      </asp:Chart>    
                    </div>
                 </div>

                    <div class="card">
                        <div class="card-header bg-white text-center">
                            <h5 class="card-title">Total : <span class="text-primary"><asp:Label runat="server" ID="lbl" Text="" ></asp:Label></span></h5>

                            </div>

             
                    </div>
      
<%--    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />--%>
</asp:Content>