<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Student-MyCourses.aspx.cs" Inherits="CourSearch.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

     <div class="container-fluid">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Student-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active">My Courses</li>
                    </ol>
                    <%--<div class="page-heading text-md-right">
                        <div class="btn-group">
                            <a href="#" class="btn btn-white active"><i class="material-icons">list</i></a>
                            <a href="#" class="btn btn-white"><i class="material-icons">dashboard</i></a>
                        </div>
                    </div>--%>

         <asp:Panel ID="PanelAlternate" Visible="false" runat="server">
                                         <div class="jumbotron">
                       
                        <p class="lead">Time is not going to wait for you, so what are you waiting for? Take up a course. NOW.</p>
                    </div>
                                    </asp:Panel>    
          <asp:Panel ID="PanelMain" Visible="true" runat="server">
                   
                      <%--  <div class="card">
                            <div class="card__options">
                                <a href="student-take-course.html" class="btn btn-white btn-sm"><i class="material-icons">replay</i> </a>
                            </div>
                            <div class="card-header bg-white ">
                                <h4 class="card-title"><a href="#">Npm &amp; Advanced Workflow</a></h4>
                                <small class="text-muted">Lessons: 7 of 7</small>
                            </div>
                            <div class="progress rounded-0">
                                <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white ">
                                <a href="student-take-course.html" class="btn btn-success disabled btn-sm">Completed <i class="material-icons btn__icon--right">check</i></a>
                            </div>
                        </div>--%>

                                    <div class="row">
                        <div class="col-lg-12">
                            
                            <div class="card">
                                <div class="card-header bg-white">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="card-title">My Courses</h4>
<%--                                            <p class="card-subtitle">Start studying!</p>--%>
                                        </div>
                                       
                                    </div>
                                </div>
                                  
                                <ul class="list-group list-group-fit mb-0">
                                     <asp:DataList ID="DataList1" runat="server"  OnItemCommand="Restart_Click" ><ItemTemplate> <li class="list-group-item">
                                        <div class="media align-items-center">
                                     <div class="media-body">
                                              <a href="Student-MyClassroom.aspx?cid=<%# Eval("id") %>"  style="text-decoration:none" >
                                                  <asp:Label ID="Name" runat="server" Text=<%# Eval("name") %>></asp:Label>

                                            <span > <asp:Label ID="Progress" class="badge badge-pill badge-primary" runat="server" Text="23"></asp:Label></span>
                                     
<%--                                                <a href="student-take-course.html">Basics of HTML</a>--%>
                                                    <%-- <div class="progress" >
                                                        <asp:Panel runat="server" id="progressbar" class="progress-bar bg-primary" role="progressbar"   aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></asp:Panel>
                                                         </div>--%>
        </a>    <br>   <small class="text-muted">Your subscription ends on <asp:Label ID="Date" runat="server"  class="text-muted" Text=<%# DataBinder.Eval(Container.DataItem, "end_datetime", "{0:MM/dd/yyyy}")  %>></asp:Label></small>
                                          
                                     
                                      
                                        
                                   
 </div>
                                            <div class="media-right">
                                                <div class="text-center">

       <a style="text-decoration:none" href="Student-MyClassroom.aspx?ssid=<%# Eval("id") %>">
           <asp:Label ID="ContinueLabel"  class="btn btn-primary btn-sm" runat="server" Text=""><i class="material-icons">play_circle_outline</i></asp:Label></a> 
                                                                                    <asp:LinkButton     CommandName=<%# Eval("id") %>    ID="Restart" runat="server"  class="btn btn-white btn-sm"><i class="material-icons">replay</i> </asp:LinkButton>

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

                       
                      <%--  <div class="card">
                            <div class="card__options">
                                <a href="student-take-course.html" class="btn btn-white btn-sm"><i class="material-icons">replay</i> </a>
                            </div>
                            <div class="card-header bg-white ">
                                <h4 class="card-title"><a href="#">Github Webhooks for Beginners</a></h4>
                                <small class="text-muted">Lessons: 8 of 10</small>
                            </div>
                            <div class="progress rounded-0">
                                <div class="progress-bar progress-bar-striped bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white">
                                <a href="student-take-course.html" class="btn btn-primary btn-sm">Continue <i class="material-icons btn__icon--right">play_circle_outline</i></a>
                            </div>
                        </div>--%>

                 
              </asp:Panel>
         </div>
</asp:Content>
