<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-EditAccount.aspx.cs" Inherits="CourSearch.EditAcc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item"><a href="Admin-Courses.aspx">Courses</a></li>
                        <li class="breadcrumb-item active">Edit Account</li>
                    </ol>
                    <div class="media">
                        <div class="media-body">
                            <h1 class="page-heading h2">
                                Edit Admin Account 
                            </h1>
                        
                       
                        <div class="card-body">
                                  
                          
                               <div class="form-group">
                             <asp:TextBox ID="Email" runat="server" type="email_id" class="form-control" placeholder="Email Address" ></asp:TextBox>                        
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Email Address required" ControlToValidate="Email" Enabled="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Incorrect Email Address" ControlToValidate="Email" Display="Dynamic" Font-Size="Smaller" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                              
                             <asp:TextBox ID="Password" runat="server"  type="password" class="form-control" placeholder="Your Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPwd" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Password required" ControlToValidate="Password" Enabled="True" Display="Dynamic"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorPwd" runat="server" ErrorMessage="Password must consist of at least 8 characters and not more than 15 characters" ControlToValidate="Password" Display="Dynamic" Font-Size="Smaller" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^([a-zA-Z0-9@*#]{8,15})$"></asp:RegularExpressionValidator>

                            </div>

                        <div class="form-group">
                           
                            <asp:TextBox ID="ConfirmPassword" runat="server" type="password" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCfPwd" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Field required" ControlToValidate="ConfirmPassword" Enabled="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidatorPwd" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Passwords don't match" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" Font-Size="smaller"></asp:CompareValidator>

                        </div>

                         <div class="text-center">
                            <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
                          
                        </div>
                        
<%--style="color:red"--%> 
                        <p class="text-center">
                           
                                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary btn-block"  OnClick="Button1_Click"/>
                  </div>
           
                </div>
            
                    </div>
</asp:Content>
