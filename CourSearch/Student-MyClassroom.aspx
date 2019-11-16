<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student-MyClassroom.aspx.cs" Inherits="CourSearch.WebForm16" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Student|MyClassroom </title>
   
    
     <meta name="robots" content="noindex">

     <!-- Simplebar -->
    <link type="text/css" href="`/assets/vendor/simplebar.css" rel="stylesheet">

    <!-- Material Design Icons  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Roboto Web Font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">

    <!-- MDK -->
    <link type="text/css" href="assets/vendor/material-design-kit.css" rel="stylesheet">

    <!-- Sidebar Collapse -->
    <link type="text/css" href="assets/vendor/sidebar-collapse.min.css" rel="stylesheet">

    <!-- App CSS -->
    <link type="text/css" href="assets/css/style.css" rel="stylesheet">

</head>
<body>
    
    <div class="d-flex flex-column h-100">
        <form runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand navbar-dark bg-primary m-0">

            <!-- Toggle sidebar -->
            <button class="navbar-toggler d-block" data-toggle="sidebar" type="button">
    <span class="material-icons">menu</span>
  </button>

            <!-- Brand -->
            <a href="Home.aspx" class="navbar-brand"><i class="material-icons">school</i>CourSearch</a>

            <!-- Search -->
            <form class="navbar-search-form d-none d-md-flex">
              <%--  <input type="text" class="form-control" placeholder="Search">
                <button class="btn" type="button"><i class="material-icons">search</i></button>--%>
            </form>
            <!-- // END Search -->

            <div class="navbar-spacer"></div>

            <!-- Menu -->
            <ul class="nav navbar-nav d-none d-md-flex">
               <%-- <li class="nav-item">
                    <a class="nav-link" href="student-forum.html">Forum</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="student-help-center.html">Get Help</a>
                </li>--%>
            </ul>

            <!-- Menu -->
            <ul class="nav navbar-nav">
                  <li class="nav-item">
                <a class="btn btn-default" style="color:#2196f3" href="Student-Home.aspx"><strong>My Classroom</strong></a>
            </li>
               <li class="nav-item">
                <a href="Student-EditAccount.aspx" class="nav-link">
                           <asp:Label ID="UserName" runat="server" ></asp:Label></a>

            </li>

                <!-- User dropdown -->
                <li class="nav-item dropdown">
<a class="nav-link active dropdown-toggle" data-toggle="dropdown" href="#" role="button">
                    <asp:Image ID="avatar" runat="server" alt="Avatar" class="rounded-circle"  width="40" /></a>
                    <div class="dropdown-menu dropdown-menu-right">
                            <asp:LinkButton ID="EditAccount" class="dropdown-item" runat="server"> <i class="material-icons">edit</i> Edit Account</asp:LinkButton>
<%--                   <asp:LinkButton ID="PublicProfile" class="dropdown-item" runat="server"> <i class="material-icons">person</i> Public Profile</asp:LinkButton>--%>
                      <asp:LinkButton ID="Logout" class="dropdown-item" runat="server" CausesValidation="false" OnClick="Logout_Click"> <i class="material-icons">lock</i> Logout</asp:LinkButton>
               
                    </div>
                </li>
                <!-- // END User dropdown -->

            </ul>
            <!-- // END Menu -->

        </nav>
        <!-- // END Navbar -->

        <div class="mdk-drawer-layout js-mdk-drawer-layout flex" data-fullbleed data-push data-has-scrolling-region>
            <div class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Student-Home.aspx">Home</a></li>
                        <li class="breadcrumb-item active"><asp:Label ID="CourseBreadcrumbLabel" runat="server">CourseName</asp:Label></li>
                        <li class="breadcrumb-item active"><asp:Label ID="LessonBreadcrubLabel" runat="server" >ll</asp:Label></li>
                    </ol>
                  <asp:Panel ID="PanelMain" runat="server">
                     <div class="media">
                        <div class="media-body">
                           
                            <h1 class="page-heading h2" style="padding-top:0px">
                                <asp:Label ID="LessonNameLabel" runat="server" Text="Lesson Name"></asp:Label>  
                            </h1>
   
                        </div>
                        <div class="media-right media-middle">
                            <asp:LinkButton ID="Button1" runat="server" class="btn btn-primary" OnClick="Button1_Click"   >Download Resources <i class="material-icons ">vertical_align_bottom</i></asp:LinkButton>
         <asp:LinkButton ID="Next" runat="server" class="btn btn-secondary" OnClick="Next_Click" Text="Next"></asp:LinkButton>
                                     

                            
                        </div>
                             
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="embed-responsive embed-responsive-16by9">
<%--                                    <iframe class="embed-responsive-item" src="https://player.vimeo.com/video/97243285?title=0&amp;byline=0&amp;portrait=0" allowfullscreen=""></iframe>--%>
                                <asp:Literal ID="VideoLiteral" runat="server"></asp:Literal></div>
                                <div class="card-body">
                            <asp:Label ID="DescriptionLabel" runat="server" Text=" Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum dicta eius enim inventoreus optio ratione veritatis. Beatae deserunt illum ipsam magniima mollitia officiis quia tempora!"></asp:Label>       
                                </div>
                            </div>

                            <div class="card">
                                
  
                                
                                <div  class="card-body">
                                    <div class="media">
                                        <div class ="media-body">
                                            
                                                                     </div>
                            <div class="media-right">
                                 <asp:Panel ID="DonePanel" runat="server" >
                                <asp:LinkButton ID="DoneButton" class="btn btn-success  " runat="server" OnClick="Done_Click">I Understand this lesson</asp:LinkButton>
                                     </asp:Panel>  
                         <asp:Panel ID="ReviewPanel" runat="server" >
                                <asp:LinkButton ID="ReviewButton" class="btn btn-warning  "  runat="server" OnClick="ReviewButton_Click" >I need more review</asp:LinkButton>
    </asp:Panel>
                            </div>
                             </div>
                                </div>
                            </div>
                            <!-- Lessons -->
<%--                            <ul class="card list-group list-group-fit">
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">1.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Installation</a>
                                        </div>
                                        <div class="media-right">
                                            <small class="text-muted-light">2:03</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item active">
                                    <div class="media">
                                        <div class="media-left">
                                            2.
                                        </div>
                                        <div class="media-body">
                                            <a href="#">The MVC architectural pattern</a>
                                        </div>
                                        <div class="media-right">
                                            <small>25:01</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">3.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Database Models</a>
                                        </div>
                                        <div class="media-right">
                                            <small class="text-muted-light">12:10</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">4.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Database Access</a>
                                        </div>
                                        <div class="media-right">
                                            <small class="text-muted-light">1:25</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">5.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Eloquent Basics</a>
                                        </div>
                                        <div class="media-right">
                                            <small class="text-muted-light">22:30</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">6.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Take Quiz</a>
                                        </div>
                                        <div class="media-right">
                                            <small class="text-muted-light">10:00</small>
                                        </div>
                                    </div>
                                </li>
                            </ul>--%>
                        </div>
                       <%-- <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <a href="#" class="btn btn-primary btn-block btn--col">
          <i class="material-icons">get_app</i> Download Files
        </a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header bg-white">
                                    <div class="media">
                                        <div class="media-left media-middle">
                                            <img src="assets/images/people/110/guy-6.jpg" alt="About Adrian" width="50" class="rounded-circle">
                                        </div>
                                        <div class="media-body media-middle">
                                            <h4 class="card-title"><a href="instructor-profile.html">Adrian Demian</a></h4>
                                            <p class="card-subtitle">Instructor</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>Having over 12 years exp. Adrian is one of the lead UI designers in the industry Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere, aut.</p>
                                    <a href="#" class="btn btn-default"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="btn btn-default"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="btn btn-default"><i class="fa fa-github"></i></a>
                                </div>
                            </div>

                            <div class="card">
                                <ul class="list-group list-group-fit">
                                    <li class="list-group-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="material-icons text-muted-light">schedule</i>
                                            </div>
                                            <div class="media-body media-middle">
                                                2 <small class="text-muted">hrs</small> &nbsp; 26 <small class="text-muted">min</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <i class="material-icons text-muted-light">assessment</i>
                                            </div>
                                            <div class="media-body media-middle">Beginner</div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Ratings</h4>
                                </div>
                                <div class="card-body">
                                    <div class="rating">
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star_border</i>
                                    </div>
                                    <small class="text-muted">20 ratings</small>
                                </div>
                            </div>

                            <a href="student-help-center.html" class="btn btn-default btn-block">
      <i class="material-icons btn__icon--left">help</i> Get Help
    </a>
                        </div>--%>
                    </div>
                    </asp:Panel>
<asp:Panel ID="PanelAlternate" Visible="false" runat="server">
    <div class="jumbotron">
                        <h2>Hey Smartypants!</h2>
                        <p class="lead">I am currently under maintainence.Thank you for your patience!</p>
                    </div>
</asp:Panel>
                </div>
            </div>




            <div class="mdk-drawer js-mdk-drawer" id="default-drawer">
                <div class="mdk-drawer__content ">
                    <div class="sidebar sidebar-left sidebar-light sidebar-transparent-sm-up o-hidden">
                        <div class="sidebar-p-y" data-simplebar data-simplebar-force-enabled="true">
                                                       <%-- <div class="sidebar-heading">My Classroom</div>

                                <div class="card bg-primary text-white text-center">
                                <div class="card-body">
                                    <p style="color:white">Heading</p>
                                </div>
                            </div>
                            <ul class="sidebar-menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="student-dashboard.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">account_box</i> Student
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="instructor-dashboard.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i> Instructor
            </a>
                                </li>
                            </ul>
                            <div class="sidebar-heading">Layout</div>
                            <ul class="sidebar-menu">
                                <li class="sidebar-menu-item active">
                                    <a class="sidebar-menu-button" href="student-take-course.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dashboard</i> Fluid Layout
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="fixed-student-take-course.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dashboard</i> Fixed Layout
            </a>
                                </li>
                            </ul>
                            <div class="sidebar-heading">Student</div>
                            <ul class="sidebar-menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="student-browse-courses.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">search</i> Browse Courses
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="student-view-course.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">import_contacts</i> View Course
            </a>
                                </li>
                                <li class="sidebar-menu-item active">
                                    <a class="sidebar-menu-button" href="student-take-course.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">class</i> Take Course 
              <span class="sidebar-menu-badge badge badge-default ml-auto">PRO</span>
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="student-take-quiz.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">dvr</i> Take a Quiz
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="student-quiz-results.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">poll</i> Quiz Results
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="student-account-edit.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">account_box</i> Edit Account
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="student-my-courses.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">school</i> My Courses
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="student-messages.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">comment</i> Messages 
              <span class="sidebar-menu-badge badge badge-default ml-auto">2</span>
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="student-billing.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">monetization_on</i> Billing
              <span class="sidebar-menu-badge badge badge-default ml-auto">$25</span>
            </a>
                                </li>
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button" href="guest-login.html">
              <i class="sidebar-menu-icon sidebar-menu-icon--left material-icons">lock_open</i> Logout
            </a>
                                </li>
                            </ul>--%>
                            <!-- Components menu -->
                        
                            
                                <div class="sidebar-heading">MY CLASSROOM</div>
                            <ul class="sidebar-menu">
                                <li class="sidebar-menu-item open">
                                    <a class="sidebar-menu-button sidebar-js-collapse" data-toggle="collapse" href="#ui-components">
     <asp:Label ID="CourseNameMenuLabel" runat="server" Font-Size="Medium"></asp:Label>
      <span class="ml-auto sidebar-menu-toggle-icon"></span>
    </a>
                                    
                                    <ul class="sidebar-submenu sm-condensed collapse card list-group list-group-fit" id="ui-components">
                                 
                                        <asp:DataList ID="DataList1" runat="server" >
                                                                          <ItemTemplate>
                                                                              <tr>
                          <asp:Panel ID="DataListCard" runat="server"  class="list-group-item" >
                                            <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">
                                        </div>
                                        </div>
                                                <div class="media-body"> 
                                                        <asp:Label ID="menuLessonNum" runat="server" Text=<%# Eval("lesson_num") %> ></asp:Label>
&nbsp;&nbsp;
                                     <a href="Student-MyClassroom.aspx?ssid=<%= Convert.ToString(Request.QueryString["ssid"]) %>&lid=<%# Eval("lid") %>">  <%# Eval("name") %> </a>
                                      </div>
                                        <div class="media-right">
                                             <asp:Panel ID="DonePanel" visible="false" runat="server">

                                   <small class="text-muted-light"  ><i class=" material-icons" style="color:green">done</i></small>
                                 </asp:Panel>
                                                 </div>
                                    </div>
                                 
</asp:Panel>                                    
                                         </tr>
                                       </ItemTemplate>
                                           </asp:DataList>
                                       <%-- <li class="list-group-item ">
                                            <div class="media">
                                        <div class="media-left">
                                            2.
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Th</a>
                                        </div>
                                        <div class="media-right">
 <asp:Panel ID="Panelc" runat="server">
                                   <small class="text-muted-light" ><i class=" material-icons" style="color:lawngreen">done</i></small>
                                   </asp:Panel>                                           </div>
                                               
                                    </div> </li>--%>
                                    </ul>
                                </li>
                            </ul>
                                

                           
                            <!-- // END Components Menu -->

                        <%--    <ul class="sidebar-menu">
                                <li class="sidebar-menu-item">
                                    <a class="sidebar-menu-button sidebar-js-collapse" data-toggle="collapse" href="#res-components">
     <asp:Label ID="Label3" runat="server" Text="Resources" Font-Size="Medium"></asp:Label>
      <span class="ml-auto sidebar-menu-toggle-icon"></span>
    </a>
                                    
                                    <ul class="sidebar-submenu sm-condensed collapse card list-group list-group-fit" id="res-components">
                                     <li class="sidebar-menu-item">
                                            <a class="sidebar-menu-button" href="ui-buttons.html">Buttons</a>
                                        </li>
                                        <li class="sidebar-menu-item active">
                                            <a class="sidebar-menu-button" href="ui-cards.html">Cards</a>
                                        </li>
                                        <li class="sidebar-menu-item">
                                            <a class="sidebar-menu-button" href="ui-tabs.html">Tabs</a>
                                        </li>
                                        <li class="sidebar-menu-item">
                                            <a class="sidebar-menu-button" href="ui-tree.html">Tree</a>
                                        </li>
                                        <li class="sidebar-menu-item">
                                            <a class="sidebar-menu-button" href="ui-nestable.html">Nestable</a>
                                        </li>
                                        
                                    </ul>
                                </li>
                            </ul>--%>
                        </div>
                    </div>
                </div>
            </div>

        </div>
            </form>
    </div>

    <!-- jQuery -->
    <script src="assets/vendor/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/vendor/popper.min.js"></script>
    <script src="assets/vendor/bootstrap.min.js"></script>

    <!-- Simplebar -->
    <!-- Used for adding a custom scrollbar to the drawer -->
    <script src="assets/vendor/simplebar.js"></script>

    <!-- MDK -->
    <script src="assets/vendor/dom-factory.js"></script>
    <script src="assets/vendor/material-design-kit.js"></script>

    <!-- Sidebar Collapse -->
    <script src="assets/vendor/sidebar-collapse.js"></script>

    <!-- App JS -->
    <script src="assets/js/main.js"></script>


</body>
</html>
