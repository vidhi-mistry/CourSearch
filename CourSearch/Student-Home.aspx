<%@ Page Title="" Language="C#" MasterPageFile="Template.Master" AutoEventWireup="true" CodeBehind="Student-Home.aspx.cs" Inherits="CourSearch.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
        <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Student-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
<%--                    <div class="card card-stats-primary">
                        <div class="card-body">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <i class="material-icons text-muted-light">credit_card</i>
                                </div>
                                <div class="media-body">
                                    Your subscription ends on <strong>25 February 2015</strong>
                                </div>
                                <div class="media-right">
                                    <a class="btn btn-success" href="student-pay.html">Upgrade</a>
                                </div>
                            </div>
                        </div>
                    </div>--%>
             <asp:Panel ID="PanelAlternate" Visible="false" runat="server">
                                         <div class="jumbotron">
                       
                        <p class="lead">Time is not going to wait for you, so what are you waiting for? Take up a course. NOW.</p>
                    </div>
                                    </asp:Panel>    
            
                <asp:Panel ID="PanelMain" Visible="true" runat="server">
            <div class="row">
                        <div class="col-lg-12">
                            
                            <div class="card">
                                <div class="card-header bg-white">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="card-title">My Courses</h4>
<%--                                            <p class="card-subtitle">Start studying!</p>--%>
                                        </div>
                                        <div class="media-right">
                                            <a class="btn btn-sm btn-warning" href="Student-Mycourses.aspx">View Details</a>
                                        </div>
                                    </div>
                                </div>
                                  
                                <ul class="list-group list-group-fit mb-0">
                                     <asp:DataList ID="DataList1" runat="server" ><ItemTemplate> <li class="list-group-item">
                                        <div class="media align-items-center">
                                     <div class="media-body">
                                              <a href="Student-MyClassroom.aspx?cid=<%# Eval("id") %>"  style="text-decoration:none" >
                                                  <asp:Label ID="Label1" runat="server" Text=<%# Eval("name") %>></asp:Label>
<%--                                                <a href="student-take-course.html">Basics of HTML</a>--%>
                                                     <div class="progress" >
                                                        <asp:Panel runat="server" id="progressbar" class="progress-bar bg-primary" role="progressbar"   aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></asp:Panel>
                                                         </div>
                                           </a> </div>
                                            <div class="media-right">
                                                <div class="text-center">
       <a style="text-decoration:none" href="Student-MyClassroom.aspx?ssid=<%# Eval("id") %>">
           <asp:Label ID="ContinueLabel"  class="btn btn-primary btn-sm" runat="server" Text=" &nbsp  Continue  &nbsp "></asp:Label></a> 
<%--    <asp:LinkButton ID="LinkButton1" runat="server" PostBackurl="Student-Classroom.aspx?id=<%# Eval("cid") %>" class="btn btn-primary btn-sm" >Continue <i class="material-icons">start</i></asp:LinkButton>--%>
                                               <div class="mb-1">
<%--                                                     
    <span class="badge badge-pill badge-primary">25%</span>--%>
                                                    </div>
                                                 
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                     </ItemTemplate>
                                    </asp:DataList>  
                           </ul>
                            
                                   
                                
                            </div>
                      
                        </div>
                    </div>
                    </asp:Panel>
                </div>
   

      
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" SelectCommand="SELECT * FROM [Study] WHERE ([sid] = @sid)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="sid" QueryStringField="sid" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
         
      <%--    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>--%>


         
 <%--     </form>

     --%>
</asp:Content>
