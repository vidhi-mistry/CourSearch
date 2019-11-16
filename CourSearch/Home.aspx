<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CourSearch.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
    <div class="container-fluid">
           <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active"><a href="Home.aspx">Browse Courses</a></li>
    </ol>
        <asp:DataList ID="DataList1" class="card-columns" runat="server" DataKeyField="cid" DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Horizontal">
            <ItemTemplate>
                
                  <div class="card">


                      
                <div class="card-header bg-white text-center">
               <a href="ViewCourse.aspx?id=<%# Eval("cid") %>" style="text-decoration:none" >
                        <h4>
                            
                            <asp:Label ID="Name" class="card-title" OnClick="Link_Click" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </h4>
                        
                            <asp:Image ID="Image" OnClick="Link_Click" style="width:100%" runat="server" ImageUrl='<%# Eval("picture") %>' ></asp:Image>
                   </a>     
                   </div>
                    <div class="card-body">
                    
                             <small class="text-muted">
                                     <i class="material-icons text-muted-light">assessment</i>
                                 <asp:Label ID="Label3" runat="server" class="text-muted" Text='<%# Eval("level") %>' ></asp:Label> &nbsp; &nbsp; &nbsp;
                                        <i class="material-icons text-muted-light">schedule</i>&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("duration_days") %>'></asp:Label> <small class="text-muted"> days</small>
                            </small>
                       
                        <%--  <br>  <asp:Label ID="Label4" runat="server" Text='<%# Eval("intro") %>' ></asp:Label>...--%>
                       
                        </div>
         
                    </div>
                      </div>
            </ItemTemplate>

        </asp:DataList>

        
           <asp:DataList ID="DataList2" class="card-columns" runat="server" DataKeyField="cid"  RepeatColumns="2" RepeatDirection="Horizontal">
            <ItemTemplate>
                
                  <div class="card">


                      
                <div class="card-header bg-white text-center">
               <a href="ViewCourse.aspx?id=<%# Eval("cid") %>" style="text-decoration:none" >
                        <h4>
                            
                            <asp:Label ID="Name" class="card-title" OnClick="Link_Click" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </h4>
                        
                            <asp:Image ID="Image" OnClick="Link_Click" style="width:100%" runat="server" ImageUrl='<%# Eval("picture") %>' ></asp:Image>
                   </a>     
                   </div>
                    <div class="card-body">
                    
                             <small class="text-muted">
                                     <i class="material-icons text-muted-light">assessment</i>
                                 <asp:Label ID="Label3" runat="server" class="text-muted" Text='<%# Eval("level") %>' ></asp:Label> &nbsp; &nbsp; &nbsp;
                                        <i class="material-icons text-muted-light">schedule</i>&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("duration_days") %>'></asp:Label> <small class="text-muted"> days</small>
                            </small>
                       
                        <%--  <br>  <asp:Label ID="Label4" runat="server" Text='<%# Eval("intro") %>' ></asp:Label>...
                            
                            
                            
                            --%>
                       
                        </div>
         
                    </div>
                      </div>
            </ItemTemplate>

        </asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" SelectCommand="SELECT * FROM [Courses] WHERE ([status] = @status)">
    <SelectParameters>
        <asp:Parameter DefaultValue="enabled" Name="status" Type="String" />
    </SelectParameters>
           </asp:SqlDataSource>
          </div>

</asp:Content>
