<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ViewCourse.aspx.cs" Inherits="CourSearch.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container-fluid">

<asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="Repeater1_ItemDataBound" >
    <ItemTemplate>
  
    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="student-dashboard.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="student-browse-courses.html">Courses</a></li>
                        <li class="breadcrumb-item active"><%# Eval("name") %></li>
                    </ol>
        <h1 class="page-heading h2"><%# Eval("name") %></h1>
      <div class="row">
          <div class="col-md-8">
                            <div class="card">
                             
                                <div class="card-body">
                                            <%# Eval("intro") %>
                                </div>
                            </div>
             
                            <!-- Lessons -->
                            <ul class="card list-group list-group-fit">
                                <li class="list-group-item">
                                    
                                    <div class="media">
                                       
                                        <div class="media-body">
                                           <h5> Course Includes :</h5>
                                        </div>
                                      
                                    </div>
                                </li>
                               <asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate>
                                <li class="list-group-item">
                                    
                                    <div class="media">
                                        <div class="media-left">
                                         <%--   <div class="text-muted">1.</div>--%>
                                        </div>
                                        <div class="media-body">
                                            <%# Eval("name") %>
                                        </div>
                                       <%-- <div class="media-right">
                                            <small class="text-muted-light">2:03</small>
                                        </div>--%>
                                    </div>
                                </li>
                          </ItemTemplate>

            </asp:Repeater>
                            </ul>
                        </div>



            <div class="col-md-4">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p>
                                        <a href="AddCourse.aspx?cid=<%# Eval("cid") %>" class="btn btn-success btn-block btn--col">
           
            <strong>Join Now!</strong>
                                            
          </a>
                                    </p>
                                   
                                </div>
                            </div>
                            <div class="card">
                                 <asp:Repeater ID="Repeater3" runat="server">
<ItemTemplate>

                                <div class="card-header bg-white">
                                    <div class="media">
                                        <div class="media-left media-middle">
                                            <img src="assets/images/people/110/guy-6.jpg" alt="About Adrian" width="50" class="rounded-circle">
                                        </div>
                                        <div class="media-body media-middle">
                                            <h4 class="card-title"><a href="student-profile.html">Adrian Demian</a></h4>
                                            <p class="card-subtitle">Instructor</p>
                                        </div>
                                    </div>
                                </div>
                               </ItemTemplate>
                                     </asp:Repeater>
                            </div>


                            <div class="card">
                                <ul class="list-group list-group-fit">
                                    <li class="list-group-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="material-icons text-muted-light">assessment</i>
                                            </div>
                                            <div class="media-body media-middle">
                                                <%# Eval("level") %>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="material-icons text-muted-light">schedule</i>
                                            </div>
                                            <div class="media-body media-middle">
                                                  <%# Eval("duration_days") %><small class="text-muted">days</small> &nbsp;<small class="text-muted">min</small>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        <%--    <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Ratings</h4>
                                </div>
                                <div class="card-body">
                                    <div class="rating">
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star_border</i>
                                    </div>
                                    <small class="text-muted">20 ratings</small>
                                </div>
                            </div>--%>
                        </div>
          </div>


        </ItemTemplate>
    </asp:Repeater>

                   
                
                </div>

   


</asp:Content>
