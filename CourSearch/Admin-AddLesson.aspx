<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-AddLesson.aspx.cs" Inherits="CourSearch.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
       <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="Admin-Courses.aspx">Courses</a></li>
          <li class="breadcrumb-item">
              <asp:LinkButton ID="LinkButton1" runat="server">Edit Course</asp:LinkButton></li>

                        <li class="breadcrumb-item active">Add Lesson</li>
                    </ol>
                    <div class="media">
                        <div class="media-body">
                           
                            <h1 class="page-heading h2" style="padding-top:0px">
                                Add Lesson
                            </h1>
   
                        </div>
                        <div class="media-right media-middle">
         <asp:Button ID="Save" runat="server" class="btn btn-success" OnClick="Save_Click" Text="SAVE" />
                            
                        </div>
                             
                    </div>
      <asp:Panel ID="PanelSuccess"  runat="server" Visible="False">   
                                <div class="alert alert-success alert-dismissible fade show  " role="alert">
                                     <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
      </button>
                                <strong>Well done!</strong> <asp:Label ID="Message" runat="server" ></asp:Label>
                            </div>
                                </asp:Panel>
            
                 <div class="card">
                        <div class="card-body">
                            <form action="#">
                               <%-- <div class="form-group row">
                                    <label for="avatar" class="col-sm-3 form-control-label">Preview</label>
                                    <div class="col-sm-9">
                                        <div class="media">
                                            <div class="media-left">
                                                <img src="assets/images/1.png" alt="" width="100" class="rounded">
                                            </div>
                                            <div class="media-body media-middle">
                                                <label class="custom-file m-0">
                <input type="file" id="file">
                <span class="custom-file-control"></span>
              </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="form-group row">
                                    <label for="" class="form-control-label col-md-3">Title</label>
                                    <div class="col-md-6">
                                 <asp:TextBox ID="TextBox1"  class="form-control"   runat  ="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="intro" class="col-md-3  form-control-label">Description</label>
                                 <div class="col-md-6">
                                         
<asp:TextBox ID="TextBox2"   class="form-control" runat  ="server" ></asp:TextBox>
                                    
                                    </div>  
                                    </div>
                          
                              

                                <div class="form-group row">
                                    <label for="video" class="form-control-label col-md-3">Upload Video</label>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                <asp:FileUpload class="form-control" ID="FileUpload2" runat="server" />
                                        
<%--                                                    <input type="text" class="form-control" value="https://player.vimeo.com/video/97243285?title=0&amp;byline=0&amp;portrait=0" />--%>
                                                    <small class="help-block text-muted-light">
<%--                                                        <asp:Button ID="UploadVideo" class="btn btn-primary btn-sm" runat="server" Text="Upload" OnClick="UploadVideo_Click"/>  --%>
                                                        &nbsp; <i class="material-icons md-18">ondemand_video</i> <span class="icon-text">.mp4 files only and size less than 50 MB </span></small>
                                                </div>
                                            </div>
                                          
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                 <label for="res" class="form-control-label col-md-3">Upload Resource</label>
                                    <div class="col-md-9">
                                        <div class="row">
                                <div class="col-md-6">
                <asp:FileUpload class="form-control" ID="ResFileUpload" runat="server" />
                <small class="help-block text-muted-light">
<%--        <asp:Button ID="Button1" class="btn btn-primary btn-sm" runat="server" Text="Upload" OnClick="UploadVideo_Click"/>--%>
             &nbsp; <i class="material-icons md-18">file_copy</i> <span class="icon-text"> file size less than 50 MB </span></small>

                                </div>
                              
                            </div>
                                        </div>
                                    </div>
                                                                 <div class="form-group row">


                                    <label for="intro" class="col-md-3  form-control-label">Number</label>
                                 <div class="col-md-2">
                                         
<asp:DropDownList ID="DropDownList2" class="custom-select form-control" runat="server">
   <%-- <asp:ListItem Value="disabled">Disabled</asp:ListItem>
    <asp:ListItem Value="enabled">Enabled</asp:ListItem>--%>
                                            </asp:DropDownList>                                       
                                    </div>  
                                    </div>

                            </form>
                        </div>
                    </div>
                
              
   
</asp:Content>
