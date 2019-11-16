<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-AddCourse.aspx.cs" Inherits="CourSearch.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="instructor-dashboard.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="instructor-courses.html">Courses</a></li>
                        <li class="breadcrumb-item active">Add course</li>
                    </ol>
                    <div class="media">
                        <div class="media-body">
                            <h1 class="page-heading h2">
                                Add Course
                            </h1>
                        </div>
                        <div class="media-right media-middle">
         <asp:Button ID="Button1" runat="server" class="btn btn-success" OnClick="Button1_Click" Text="ADD" />
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Basic Information</h4>
                                </div>
                                <div class="card-body">

                                    <div class="form-group">
                                        <label for="title">Title</label>
                                 <asp:TextBox ID="TextBox1"  class="form-control" runat  ="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="details">Description</label>
<asp:TextBox ID="TextBox2"  class="form-control" runat  ="server"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                            
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                         
                                <div class="card-body">
                                     <label for="title">Upload Image </label>
         <asp:FileUpload ID="FileUpload1" OnClick="" class="form-control" runat="server" />
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Meta</h4>
                                    <p class="card-subtitle">Extra Options </p>
                                </div>

                                <div class="form-horizontal card-body">
                                    <div class="form-group row">
                                        <label for="select" class="col-sm-6 col-form-label">Category</label>
                                        <div class="col-sm-6">
                                        <asp:TextBox ID="TextBox3"  class="form-control" runat  ="server"></asp:TextBox>
                                            </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="duration" class="col-sm-6 col-form-label">Duration</label>
                                        <div class="col-sm-6">
                                           <asp:TextBox ID="TextBox4"  class="form-control" runat  ="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="start" class="col-sm-6 col-form-label">Level</label>
                                        <div class="col-sm-6">
 <asp:TextBox ID="TextBox5"  class="form-control" runat  ="server"></asp:TextBox> <%--<asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>   
                                             <select class="custom-select form-control">
              <option value="#">HTML</option>
              <option value="#">Angular JS</option>
              <option value="#" selected>Vue.js</option>
              <option value="#">CSS / LESS</option>
              <option value="#">Design / Concept</option>
            </select>--%>
                                        </div>
                                    </div>
                                 

                                   
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="editLesson">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                // Edit Lesson
                            </div>
                        </div>
                    </div>

             
</asp:Content>
