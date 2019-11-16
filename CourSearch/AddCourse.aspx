<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="CourSearch.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

      <div class="jumbotron">
                        <h2></h2>
                        <p class="lead">
          <asp:Label ID="Label1" runat="server" Font-Italic="True" Font-Size="Medium"></asp:Label><br /><br>
                            <asp:Button ID="Button1"  runat="server" class="btn btn-success  " OnClick="Button1_Click" Text="My Classroom" /></p>
                    </div>
        </div>
</asp:Content>
