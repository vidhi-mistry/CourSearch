<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-Transactions.aspx.cs" Inherits="CourSearch.Admin_Transactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
             <form id="form1">
             <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Transactions </li>
                    </ol>
    <div class="card"> 
    <div class="card-header">
                            <h5 class="card-title">LATEST TRANSACTIONS</h5>
                        </div>

<%--           <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" class="table table-striped table-hover table-sm" DataKeyNames="name" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="start_datetime" HeaderText="DATE-TIME" ReadOnly="True"  DataFormatString="{0:MM-dd-yyyy hh:mm tt}" />
            <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" />

        </Columns>
    </asp:GridView>
                                <div class="clearfix"></div>

    </div>



    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbconnect %>" SelectCommand="SELECT distinct s.[start_datetime], c.[name] FROM [Courses] as c , [Study] as s where c.[status] like 'enabled' group by start_datetime,name" >
     
     
        <SelectParameters>
            <asp:Parameter DefaultValue="ADMIN" Name="type" Type="String" />
              <asp:Parameter Name="start_datetime" Type="DateTime"  />
            <asp:Parameter Name="name" Type="String" />
        </SelectParameters>
   
    </asp:SqlDataSource>--%>

        <asp:GridView ID="GridView1" class="table table-striped table-hover table-sm"  DataSourceID="SqlDataSource1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="DATE" HeaderText="DATE" SortExpression="DATE" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
<%--               <asp:BoundField DataField="ID" HeaderText="COUNT" ReadOnly="True" SortExpression="COUNT" />--%>
            </Columns>


        </asp:GridView>
                   <div class="clearfix"></div>
        </div>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" 
                 SelectCommand="select top 10 ss.start_datetime as date,ss.id as id, c.name from [Study] as ss,[Courses] as c where c.cid=ss.cid order by start_datetime desc "></asp:SqlDataSource>
  

             
             </form>
</asp:Content>
