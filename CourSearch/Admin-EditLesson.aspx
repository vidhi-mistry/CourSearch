<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-EditLesson.aspx.cs" Inherits="CourSearch.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
           <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="Admin-Courses.aspx">Courses</a></li>
          <li class="breadcrumb-item">
              <asp:LinkButton ID="LinkButton1" runat="server">Edit Course</asp:LinkButton></li>

                        <li class="breadcrumb-item active">Edit Lesson</li>
                    </ol>
                    <div class="media">
                        <div class="media-body">
                           
                            <h1 class="page-heading h2" style="padding-top:0px">
                                Edit Lesson
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


                                    <label for="intro" class="col-md-3  form-control-label">Number</label>
                                 <div class="col-md-2">
                                         
<asp:DropDownList ID="DropDownList2" class="custom-select form-control" runat="server">
   <%-- <asp:ListItem Value="disabled">Disabled</asp:ListItem>
    <asp:ListItem Value="enabled">Enabled</asp:ListItem>--%>
                                            </asp:DropDownList>                                       
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
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <div class="embed-responsive embed-responsive-16by9">
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                             <%--           <video width="500" height="322" controls>
    <source src=<%# Eval("videoURL") %> type="video/mp4">
</video>--%>
<%--                                                        <iframe id="video"  class="embed-responsive-item" runat="server"  allowfullscreen=""></iframe>--%>
                                                    </div>
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
                                <div class="col-md-6">
                                    <div >
                                                                  
                                    <asp:Panel ID="ResourcePanel" runat="server" Visible="False">     
                            <div class="media-right">
                                 <i class="material-icons">attach_file</i>  
                                <asp:Label ID="Label2" class="fancytree-title" runat="server"  ></asp:Label>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; <asp:LinkButton ID="DelResource" runat="server" class="btn btn-white btn-sm" OnClick="DelResource_Click" Visible="False">
<i class="material-icons">delete</i></asp:LinkButton>            
                                <%--<a href="Admin-EditLesson.aspx?lid=<%# Eval("lid") %>" class="btn btn-white btn-sm">
                                    <i class="material-icons">delete</i> </a>--%>

                                                                                        

                                    </div>
                                        </asp:Panel>  
                                        </div>
                                
                                </div>
                            </div>
                                        </div>
                                    </div>
                            </form>
                        </div>
                    </div>
                
                     <%--   <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Basic Information</h4>
                                </div>
                                <div class="card-body">

                                    <div class="form-group">
                                        <label for="title">Title</label>
                                 <asp:TextBox ID="TextBox1"  class="form-control" placeholder=<%# Eval("name") %> AutoPostBack=true runat  ="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="details">Description</label>
<asp:TextBox ID="TextBox2"   class="form-control" runat  ="server" placeholder=<%# Eval("intro") %>></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Lessons </h4>
                                </div>
                                <div class="card-body">
                                    <ul class="card list-group list-group-fit">
                          
                                         <asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate>
                                <li class="list-group-item">
                                    
                                    <div class="media">
                                          
                                        <div class="media-left">
                                            <div class="text-muted"> <%# Eval("order") %>.</div>
                                        </div>
                                        <div class="media-body">
                              <a href="Admin-EditLesson.aspx?lid=<%# Eval("lid") %>" style="text-decoration:none">         <%# Eval("name") %> 
                               </a>         </div>
                                                
                                        <div class="media-right">
                                            <a href="Admin-EditLesson.aspx?lid=<%# Eval("lid") %>" class="btn btn-white btn-sm"><i class="material-icons">edit</i> </a>
    </button>
                                                                                        

                                    </div>
                                </li>
                          </ItemTemplate>

            </asp:Repeater>
                                        </ul>


                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                         
                                <div class="card-body">
                                                <asp:Image ID="Image"   runat="server" ImageUrl='<%# Eval("picture") %>' alt="Card image cap" width="100" class="rounded">  </asp:Image>

                                     <label for="title">Upload Image </label>
         <asp:FileUpload ID="FileUpload1"  class="form-control" runat="server" Font-Size="Small" />
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
                                        <asp:TextBox ID="TextBox3"  class="form-control" placeholder=<%# Eval("category") %>  runat  ="server"></asp:TextBox>
                                            </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="duration" class="col-sm-6 col-form-label">Duration</label>
                                        <div class="col-sm-6">
                                           <asp:TextBox ID="TextBox4" placeholder=<%# Eval("duration_days") %> class="form-control" runat  ="server"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="start" class="col-sm-6 col-form-label">Level</label>
                                        <div class="col-sm-6">
 <asp:TextBox ID="TextBox5"  class="form-control"  placeholder=<%# Eval("level") %> runat  ="server"></asp:TextBox>
                                        </div>
                                    </div>

                                 <div class="form-group row">
                                        <label for="start" class="col-sm-6 col-form-label">Status</label>
                                        <div class="col-sm-6">
<asp:DropDownList ID="DropDownList1" class="custom-select form-control" runat="server">
    <asp:ListItem Value="disabled">Disabled</asp:ListItem>
    <asp:ListItem Value="enabled">Enabled</asp:ListItem>
                                            </asp:DropDownList>   
                                          
                                        </div>
                                    </div>

                                   
                                </div>
                            </div>
                        </div>--%>
   
  
                   
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" SelectCommand="SELECT * FROM [Courses] WHERE ([cid] = @cid)">
    <SelectParameters>
        <asp:QueryStringParameter Name="cid" QueryStringField="id" Type="Int32" />
    </SelectParameters>
       </asp:SqlDataSource>
                
</asp:Content>
