<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin-Courses.aspx.cs" Inherits="CourSearch.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Admin-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Courses</li>
                    </ol>
    
                  
                    <div class="media">
                        <div class="media-body">
                            <h1 class=" page-heading h2" style="padding-top:0px">
                                Edit Course
                            </h1>
                           
                        </div>
                        <div class="media-right media-middle">
         <asp:Button ID="report" runat="server" class="btn btn-success"   OnClick="report_Click"  Text="Download Report" />
                            
                        </div>
                        
                    </div>

                         <asp:DataList ID="DataList1" class="card-columns" runat="server" DataKeyField="cid" DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Horizontal">
            <ItemTemplate>
                
              <div class="card">
                <div class="card-header bg-white">
                    <div class="media">
                        <div class="media-left media-middle">
                            <a href="Admin-EditCourse.aspx?id=<%# Eval("cid") %>">
            <asp:Image ID="Image" OnClick="Link_Click"  runat="server" ImageUrl='<%# Eval("picture") %>' alt="Card image cap" width="100" class="rounded">  </asp:Image>
          </a>
                        </div>
                        
                        <div class="media-body media-middle">
                            <a href="Admin-EditCourse.aspx?id=<%# Eval("cid") %>"> <asp:Label ID="Name"  OnClick="Link_Click" runat="server" Text='<%# Eval("name") %>' Font-Size="Small"></asp:Label>&nbsp;
                            </a>
                            <br />
                            <span class="badge badge-primary "><%# Eval("level") %></span> <span class="badge badge-light "><%# Eval("duration_days") %> days</span>
                           
                        
    
                            <asp:Label class="badge badge-primary" ID="NameLabel" runat="server" Text='<%# Eval("status").ToString() %>' 
BackColor='<%# (Eval("status").ToString()=="enabled") ? System.Drawing.Color.FromName("LimeGreen") : System.Drawing.Color.FromName("red") %>'/>
                        
                      <%--  <%if (Eval("status").ToString() == "enabled") { %>
           <span class="badge badge-primary " style="background-color:#99FF33"><%# Eval("status") %></span>
            <%} %>
            <%else { %>
          <span class="badge badge-primary " style="background-color:#999999"><%# Eval("status") %></span>
            <%} %>--%>

<%--                            <span class="badge badge-primary " style="background-color:#999999"><%# Eval("status") %></span>--%>
                        
                        

                            

                        </div>
                        <div class="media-right media-middle">
                            <a href="Admin-EditCourse.aspx?id=<%# Eval("cid") %>" class="btn btn-sm btn-white">Edit</a>
                             
                        </div>
                          <div class="media-right media-middle">
                             <a href="Admin-DeleteCourse.aspx?id=<%# Eval("cid") %>"   class="btn btn-sm btn-white">Delete
                                                        </a></div>
                    </div>
                </div>
            </div>
            </ItemTemplate>

        </asp:DataList>


    

                                                                 <!--DATALIST---2-->


                    <asp:DataList ID="DataList2" class="card-columns" runat="server" DataKeyField="cid" RepeatColumns="2" RepeatDirection="Horizontal">
            <ItemTemplate>
                
              <div class="card">
                <div class="card-header bg-white">
                    <div class="media">
                        <div class="media-left media-middle">
                            <a href="Admin-EditCourse.aspx?id=<%# Eval("cid") %>">
            <asp:Image ID="Image" OnClick="Link_Click"  runat="server" ImageUrl='<%# Eval("picture") %>' alt="Card image cap" width="100" class="rounded">  </asp:Image>
          </a>
                        </div>
                        
                        <div class="media-body media-middle">
                            <a href="Admin-EditCourse.aspx?id=<%# Eval("cid") %>"> <asp:Label ID="Name"  OnClick="Link_Click" runat="server" Text='<%# Eval("name") %>' Font-Size="Small"></asp:Label>&nbsp;
                            </a>
                            <br />
                            <span class="badge badge-primary "><%# Eval("level") %></span> <span class="badge badge-light "><%# Eval("duration_days") %> days</span>
                           
                        
    
                            <asp:Label class="badge badge-primary" ID="NameLabel" runat="server" Text='<%# Eval("status").ToString() %>' 
BackColor='<%# (Eval("status").ToString()=="enabled") ? System.Drawing.Color.FromName("LimeGreen") : System.Drawing.Color.FromName("red") %>'/>
                        
                      <%--  <%if (Eval("status").ToString() == "enabled") { %>
           <span class="badge badge-primary " style="background-color:#99FF33"><%# Eval("status") %></span>
            <%} %>
            <%else { %>
          <span class="badge badge-primary " style="background-color:#999999"><%# Eval("status") %></span>
            <%} %>--%>

<%--                            <span class="badge badge-primary " style="background-color:#999999"><%# Eval("status") %></span>--%>
                        
                        

                            

                        </div>
                        <div class="media-right media-middle">
                            <a href="Admin-EditCourse.aspx?id=<%# Eval("cid") %>" class="btn btn-sm btn-white">Edit</a>
                             
                        </div>
                          <div class="media-right media-middle">
                             <a href="Admin-DeleteCourse.aspx?id=<%# Eval("cid") %>"   class="btn btn-sm btn-white">Delete
                                                        </a></div>
                    </div>
                </div>
            </div>
            </ItemTemplate>

        </asp:DataList>
     <a href="Admin-AddCourse.aspx" style="text-decoration:none">
                             <button type="button" class="btn btn-primary">
      <i class="material-icons btn__icon--left">add</i> Add Course
    </button></a>
                          


                     
    
    
    


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Courses]">
     </asp:SqlDataSource>
</asp:Content>
