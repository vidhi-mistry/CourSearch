<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CourSearch.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Signup</title>

    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex"/>

    <!-- Simplebar -->
    <link type="text/css" href="assets/vendor/simplebar.css" rel="stylesheet"/>

    <!-- Material Design Icons  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>

    <!-- Roboto Web Font -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet"/>

    <!-- MDK -->
    <link type="text/css" href="assets/vendor/material-design-kit.css" rel="stylesheet"/>

    <!-- Sidebar Collapse -->
    <link type="text/css" href="assets/vendor/sidebar-collapse.min.css" rel="stylesheet"/>

    <!-- App CSS -->
    <link type="text/css" href="assets/css/style.css" rel="stylesheet"/>




</head>
 <body class="login">
    

       <nav class="navbar navbar-expand navbar-dark bg-primary m-0 fixed-top">

        <!-- Toggle sidebar -->
        <%--<button class="navbar-toggler d-block" data-toggle="sidebar" type="button" style="width:20px">
    <span class="material-icons">menu</span>
  </button>--%>

        <!-- Brand -->
        <a href="Home.aspx" class="navbar-brand"><i class="material-icons">school</i>CourSearch</a>

        <!-- Search -->
        <%--<form class="navbar-search-form d-none d-md-flex">
            <input type="text" class="form-control" placeholder="Search">
            <button class="btn" type="button"><i class="material-icons">search</i></button>
        </form>--%>
        <!-- // END Search -->

        <div class="navbar-spacer"></div>

        <!-- Menu -->
        <ul class="nav navbar-nav d-none d-md-flex">
            <li class="nav-item">
                <a class="nav-link" href="">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Login.aspx">Sign In</a>
            </li>
            <li class="nav-item">
                <a class="nav-link-active" href="Signup.aspx">Sign Up</a>
            </li>
        </ul>

        <!-- Menu -->
        <ul class="nav navbar-nav">

<%--            <li class="nav-item">
                <a href="fixed-student-cart.html" class="nav-link">
        <i class="material-icons">shopping_cart</i>
      </a>
            </li>--%>

            <!-- User dropdown -->
            <%--<li class="nav-item dropdown">
                <a class="nav-link active dropdown-toggle" data-toggle="dropdown" href="#" role="button"><img src="assets/images/people/50/guy-6.jpg" alt="Avatar" class="rounded-circle" width="40"></a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="fixed-student-account-edit.html">
      <i class="material-icons">edit</i> Edit Account
    </a>
                    <a class="dropdown-item" href="fixed-student-profile.html">
      <i class="material-icons">person</i> Public Profile
    </a>
                    <a class="dropdown-item" href="guest-login.html">
      <i class="material-icons">lock</i> Logout
    </a>
                </div>
            </li>--%>
            <!-- // END User dropdown -->

        </ul>
        <!-- // END Menu -->

    </nav>
        <div>

          <br />
            <br />
            <br />


    <div class="row">
        <div class="col-sm-8 col-md-4 col-lg-4 mx-auto">
            <div class="text-center m-2">
                <div class="icon-block rounded-circle">
                    <i class="material-icons align-middle md-36 text-muted">edit</i>
                </div>
            </div>
            <div class="card">
                <div class="card-header bg-white text-center">
                    <h4 class="card-title">Sign Up</h4>
                    <p class="card-subtitle">Create a new account</p>
                </div>
                <div class="card-body">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <%--<input type="text" class="form-control" placeholder="Full Name">--%>
                            <%--<asp:LoginName ID="LoginName1" runat="server" class="form-control" placeholder="Full Name"/>--%>
                              <asp:TextBox ID="Name" runat="server"  class="form-control" placeholder="Full Name"></asp:TextBox>  
                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Name required" ControlToValidate="Email" Enabled="True" Display="Dynamic"></asp:RequiredFieldValidator>


                        </div>


                        <div class="form-group">
                           <%-- <input type="email" class="form-control" placeholder="Email">--%>
                             <asp:TextBox ID="Email" runat="server"  class="form-control" placeholder="Email Address" ></asp:TextBox> 
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Email Address required" ControlToValidate="Email" Enabled="True" Display="Dynamic"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Incorrect Email Address" ControlToValidate="Email" Display="Dynamic" Font-Size="Smaller" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                        </div>
                        <div class="form-group">
                           <%-- <input type="password" class="form-control" placeholder="Password">--%>
                              <asp:TextBox ID="Password" runat="server"  type="password" class="form-control" placeholder="Your Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPwd" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Password required" ControlToValidate="Password" Enabled="True" Display="Dynamic"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidatorPwd" runat="server" ErrorMessage="Password must consist of at least 8 characters and not more than 15 characters" ControlToValidate="Password" Display="Dynamic" Font-Size="Smaller" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^([a-zA-Z0-9@*#]{8,15})$"></asp:RegularExpressionValidator>

                        </div>
                        <div class="form-group">
                            <%--<input type="password" class="form-control" placeholder="Confirm Password">--%>
                            <asp:TextBox ID="ConfirmPassword" runat="server" type="password" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCfPwd" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Field required" ControlToValidate="ConfirmPassword" Enabled="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidatorPwd" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Passwords don't match" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" Font-Size="smaller"></asp:CompareValidator>

                        </div>

                        
                         <div class="form-group">

                                 <asp:TextBox ID="Contact" runat="server"  class="form-control" placeholder="Mobile Number"></asp:TextBox>  
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorContact" runat="server" Style="color:red;font-size:smaller" ErrorMessage="Field required" ControlToValidate="Contact" Enabled="True" Display="Dynamic"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorContact" runat="server" ErrorMessage="Enter a valid contact number" ValidationExpression="/^(\+\d{1,3}[- ]?)?\d{10}$/" ControlToValidate="Contact" Display="Dynamic"  Style="color:red;font-size:smaller"></asp:RegularExpressionValidator>
                        </div>

                         <div class="text-center">
                            <asp:Label ID="lblErrorMessage" runat="server" style="color:red" Text=""></asp:Label>
                          
                        </div>
                        

                    <%--    <div class="form-group text-center">
                            <label class="custom-control custom-checkbox m-0">
                                <asp:CheckBox ID="CheckBox1" runat="server" Class="custom-control-input" />
             <input type="checkbox" class="custom-control-input" checked>
              <span class="custom-control-indicator"></span>
              I agree to the&nbsp;<a href="#">Terms of Use</a>
            </label>
                        </div>--%>


                        <p class="text-center">
                           <%-- <button type="submit" class="btn btn-primary btn-block">--%>
                                <asp:Button ID="Button1" runat="server" Text="Sign Up" class="btn btn-primary btn-block"  OnClick="Button1_Click"/>


              <%--<span class="btn-block-text">Sign Up</span>--%>
           
                        </p>
                        <div class="text-center">Already signed up? <a href="Login.aspx">Log in</a>
                                   </div>
                    </form>
                </div>
            </div>
        </div>
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



        </div>
   
</body>
</html>
