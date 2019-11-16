<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-Users.aspx.cs" Inherits="CourSearch.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
      <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Manage Users</li>
                    </ol>
    <div class="card"> 
    <div class="card-header">
                            <h5 class="card-title">USER DATABASE</h5>
                        </div>
   
    <asp:GridView ID="GridView1" class="table table-striped table-hover table-sm" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="email_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="None">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="email_id" HeaderText="EMAIL" ReadOnly="True" SortExpression="email_id" />
            <asp:BoundField DataField="type" HeaderText="TYPE" SortExpression="type" />
        </Columns>
    </asp:GridView>
                                <div class="clearfix"></div>

    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconnect %>" DeleteCommand="DELETE FROM [User] WHERE [email_id] = @original_email_id AND [type] = @original_type" InsertCommand="INSERT INTO [User] ([email_id], [type]) VALUES (@email_id, @type)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [email_id], [type] FROM [User] WHERE ([type] &lt;&gt; @type)" UpdateCommand="UPDATE [User] SET [type] = @type WHERE [email_id] = @original_email_id AND [type] = @original_type">
        <DeleteParameters>
            <asp:Parameter Name="original_email_id" Type="String" />
            <asp:Parameter Name="original_type" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="email_id" Type="String" />
            <asp:Parameter Name="type" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="ADMIN" Name="type" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="original_email_id" Type="String" />
            <asp:Parameter Name="original_type" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
  
</asp:Content>
