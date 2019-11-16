<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-EditCourse.aspx.cs" Inherits="CourSearch.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
       <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="Admin-Courses.aspx">Courses</a></li>
                        <li class="breadcrumb-item active">Edit Course</li>
                    </ol>
                    <div class="media">
                        <div class="media-body">
                            <h1 class="page-heading h2" style="padding-top:0px">
                                Edit Course
                            </h1>
                           
                        </div>
                        <div class="media-right media-middle">
         <asp:Button ID="Button1" runat="server" class="btn btn-success" OnClick="Update_Click" Text="SAVE" />
                            
                        </div>
                        
                    </div>
    <asp:Panel ID="PanelSuccess"  runat="server" Visible="False">   
                                <div class="alert alert-success alert-dismissible fade show  " role="alert">
                                     <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
      </button>
                                <strong> <asp:Label ID="Message" runat="server" ></asp:Label></strong> 
                            </div>
                                </asp:Panel>
<%--    <asp:Repeater ID="Repeater1" runat="server">--%>
               
<%--        <ItemTemplate>    --%>
            <div class="row">
                        <div class="col-md-8">
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
                                    <div class="media">
                                    <div class="media-body">
                                        <h4 class="card-title">Lessons </h4>
                                        </div>
                                   <div class="media-right">
                                    <asp:LinkButton ID="AddLesson"  class="btn btn-primary btn-sm" runat="server">
      <i class="material-icons">add</i>
                                       Add
    </asp:LinkButton>
                                    <%--<asp:LinkButton ID="ReorderLesson"  class="btn btn-secondary btn-sm" runat="server">
      <i class="material-icons">list</i>Reorder
    </asp:LinkButton>--%>
                                       </div>
                                </div>
                                    </div>
                                <div class="card-body">
                                    <ul class="card list-group list-group-fit">
                                <%--<li class="list-group-item">
                                    
                                    <div class="media">
                                       
                                        <div class="media-body">
                                           <h5></h5>
                                        </div>
                                      
                                    </div>
                                </li>--%>
                                         <asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate>
                                <li class="list-group-item">
                                    
                                    <div class="media">
                                          
                                        <div class="media-left">
                                            <div class="text-muted"> <%# Eval("lesson_num") %>.</div>
                                        </div>
                                        <div class="media-body">
                              <a href="Admin-EditLesson.aspx?lid=<%# Eval("lid") %>" style="text-decoration:none">         <%# Eval("name") %> 
                               </a>         </div>
                                                
                                        <div class="media-right">
                                            <a href="Admin-EditLesson.aspx?lid=<%# Eval("lid") %>" class="btn btn-white btn-sm"><i class="material-icons">edit</i> </a>
                                               <a href="Admin-DeleteLesson.aspx?lid=<%# Eval("lid") %>&cid=<%# Eval("cid") %>" class="btn btn-white btn-sm"><i class="material-icons">delete</i> </a>

                                                                                        

                                    </div>
                                </li>
                          </ItemTemplate>

            </asp:Repeater>
                                        </ul>
<%--                                    <div class="form-group">
                                        <label for="title">Title</label>
                                 <asp:TextBox ID="TextBox6"  class="form-control" placeholder=<%# Eval("name") %> AutoPostBack=true runat  ="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="details">Description</label>
<asp:TextBox ID="TextBox7"   class="form-control" runat  ="server" placeholder=<%# Eval("intro") %>></asp:TextBox>
                                    </div>--%>

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
 <asp:TextBox ID="TextBox5"  class="form-control"  placeholder=<%# Eval("level") %> runat  ="server"></asp:TextBox> <%--<asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>   
                                             <select class="custom-select form-control">
              <option value="#">HTML</option>
              <option value="#">Angular JS</option>
              <option value="#" selected>Vue.js</option>
              <option value="#">CSS / LESS</option>
              <option value="#">Design / Concept</option>
            </select>--%>
                                        </div>
                                    </div>

                                 <div class="form-group row">
                                        <label for="start" class="col-sm-6 col-form-label">Status</label>
                                        <div class="col-sm-6">
<asp:DropDownList ID="DropDownList1" class="custom-select form-control" runat="server">
    <asp:ListItem Value="disabled">Disabled</asp:ListItem>
    <asp:ListItem Value="enabled">Enabled</asp:ListItem>
                                            </asp:DropDownList>   
                                             <%--<select >
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
   <%--     </ItemTemplate>

            </asp:Repeater>--%>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" SelectCommand="SELECT * FROM [Courses] WHERE ([cid] = @cid)">
    <SelectParameters>
        <asp:QueryStringParameter Name="cid" QueryStringField="id" Type="Int32" />
    </SelectParameters>
       </asp:SqlDataSource>
                  <%--  <div class="modal fade" id="editLesson">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                // Edit Lesson
                            </div>
                        </div>
                    </div>--%>

</asp:Content>
