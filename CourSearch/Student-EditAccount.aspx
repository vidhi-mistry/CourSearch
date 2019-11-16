<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Student-EditAccount.aspx.cs" Inherits="CourSearch.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

    
    <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Student-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>

<%--         <asp:Panel ID="PanelSuccess"  runat="server" Visible="False">   
                             <div class="alert alert-success alert-dismissible fade show  " role="alert">
                       <%--              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
      </button>--%>
            <%--                    <strong> <asp:Label ID="Message" runat="server" ></asp:Label></strong> 
                            </div>
           </asp:Panel>--%>
            
           <div class="row">
                        <div class="col-lg-12">
                        
                                <div class="card">
                            <div class="tab-content card-body">
                
                                <form action="#" class="form-horizontal">
                                    <div class="form-group row">
                                        <label for="avatar" class="col-sm-3 col-form-label">Profile Picture</label>
                                        <%--<div class="col-sm-9">
                                            <div class="media">
                                                <div class="media-left">
                                                    <div class="icon-block rounded">
                                                        <i class="material-icons text-muted-light md-36">photo</i>
                                                    </div>
                                                </div>
                                                <div class="media-body media-middle">
                                                    <label class="custom-file m-0">
                                                        <input type="file" id="file"value="Browse">
                                                                 <span class="custom-file-control"></span>
                                                </label><%#("~/assets/images/people/110/")+Eval("picture").ToString()%>'
                                                </div>String.Concat("Image/", Eval("ProductImage"))  
                                            </div>
                                        </div>--%>
         <div class="card">
             <div class="card-body">
                   <asp:Image ID="Image"   runat="server" ImageUrl='<%# Eval("picture")%>' alt="Card image cap" width="100" class="rounded">  </asp:Image>

                                     <label for="title">Upload Image </label>
         <asp:FileUpload ID="FileUpload1"  class="form-control" runat="server" Font-Size="Small" />
                 
             </div>

         </div>
        
                                    </div>

                                    <div class="form-group row">
                                        <label for="name" class="col-sm-3 col-form-label">User Name</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="col-md-6">
                                       <asp:TextBox ID="TextBox1"   class="form-control" runat  ="server" placeholder=<%# Eval("name") %>></asp:TextBox>
                                                    </div>
                                                </div>
                                               
                                            </div>
                                        </div>
                                  
                                
                                <div class="form-group row">
                                        <label for="email" class="col-sm-3 col-form-label">Email</label>
                                        <div class="col-sm-8 col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">
                <i class="material-icons md-18 text-muted">mail</i>
              </span>
                         <%-- <input type="text" class="form-control" placeholder="<%# Eval("email") %>" >--%>
                                <asp:TextBox ID="TextBox2"   class="form-control" runat  ="server" placeholder=<%# Eval("email") %>></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <div class="form-group row">
                                        <label for="password" class="col-sm-3 col-form-label">Change Password</label>
                                        <div class="col-sm-6 col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon3">
                <i class="material-icons md-18 text-muted">lock</i>
              </span>
                                               <%-- <input type="text" class="form-control" placeholder="<%#Eval("password") %> --%>
                                                  <asp:TextBox ID="TextBox3" TextMode="Password"   class="form-control" runat  ="server" placeholder=<%# Eval("password") %>></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-8 offset-sm-8">
                                            <div class="media">
                                             
                                                             <div class="media-right media-middle">
         <asp:Button ID="Button1" runat="server" class="btn btn-success" OnClick="UpdateOnClick" Text="SAVE CHANGES" />
                            
                        </div>
                                                    <div class="text-center">
                            <asp:Label ID="lblErrorMessage" runat="server" style="color:green" Text=""></asp:Label>
                          
                        </div>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            
</div>
                            
                        </div>
                            </div>

                </div>            
                          
  </div>

</asp:Content>
