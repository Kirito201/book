<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-03-12
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理系统-后台管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/dist/css/skins/skin-blue.min.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>A</b>LT</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Admin</b>LTE</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <%--<div class="navbar-custom-menu">--%>
            <%--<ul class="nav navbar-nav">--%>
            <%--<!-- Messages: style can be found in dropdown.less-->--%>
            <%--<li class="dropdown messages-menu">--%>
            <%--<!-- Menu toggle button -->--%>
            <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
            <%--<i class="fa fa-envelope-o"></i>--%>
            <%--<span class="label label-success">4</span>--%>
            <%--</a>--%>
            <%--<ul class="dropdown-menu">--%>
            <%--<li class="header">You have 4 messages</li>--%>
            <%--<li>--%>
            <%--<!-- inner menu: contains the messages -->--%>
            <%--<ul class="menu">--%>
            <%--<li><!-- start message -->--%>
            <%--<a href="#">--%>
            <%--<div class="pull-left">--%>
            <%--<!-- User Image -->--%>
            <%--<img src="dist/img/user2-160x160.jpg" class="img-circle"--%>
            <%--alt="User Image">--%>
            <%--</div>--%>
            <%--<!-- Message title and timestamp -->--%>
            <%--<h4>--%>
            <%--Support Team--%>
            <%--<small><i class="fa fa-clock-o"></i> 5 mins</small>--%>
            <%--</h4>--%>
            <%--<!-- The message -->--%>
            <%--<p>Why not buy a new awesome theme?</p>--%>
            <%--</a>--%>
            <%--</li>--%>
            <%--<!-- end message -->--%>
            <%--</ul>--%>
            <%--<!-- /.menu -->--%>
            <%--</li>--%>
            <%--<li class="footer"><a href="#">See All Messages</a></li>--%>
            <%--</ul>--%>
            <%--</li>--%>
            <%--<!-- /.messages-menu -->--%>

            <%--<!-- Notifications Menu -->--%>
            <%--<li class="dropdown notifications-menu">--%>
            <%--<!-- Menu toggle button -->--%>
            <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
            <%--<i class="fa fa-bell-o"></i>--%>
            <%--<span class="label label-warning">10</span>--%>
            <%--</a>--%>
            <%--<ul class="dropdown-menu">--%>
            <%--<li class="header">You have 10 notifications</li>--%>
            <%--<li>--%>
            <%--<!-- Inner Menu: contains the notifications -->--%>
            <%--<ul class="menu">--%>
            <%--<li><!-- start notification -->--%>
            <%--<a href="#">--%>
            <%--<i class="fa fa-users text-aqua"></i> 5 new members joined today--%>
            <%--</a>--%>
            <%--</li>--%>
            <%--<!-- end notification -->--%>
            <%--</ul>--%>
            <%--</li>--%>
            <%--<li class="footer"><a href="#">View all</a></li>--%>
            <%--</ul>--%>
            <%--</li>--%>
            <%--<!-- Tasks Menu -->--%>
            <%--<li class="dropdown tasks-menu">--%>
            <%--<!-- Menu Toggle Button -->--%>
            <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
            <%--<i class="fa fa-flag-o"></i>--%>
            <%--<span class="label label-danger">9</span>--%>
            <%--</a>--%>
            <%--<ul class="dropdown-menu">--%>
            <%--<li class="header">You have 9 tasks</li>--%>
            <%--<li>--%>
            <%--<!-- Inner menu: contains the tasks -->--%>
            <%--<ul class="menu">--%>
            <%--<li><!-- Task item -->--%>
            <%--<a href="#">--%>
            <%--<!-- Task title and progress text -->--%>
            <%--<h3>--%>
            <%--Design some buttons--%>
            <%--<small class="pull-right">20%</small>--%>
            <%--</h3>--%>
            <%--<!-- The progress bar -->--%>
            <%--<div class="progress xs">--%>
            <%--<!-- Change the css width attribute to simulate progress -->--%>
            <%--<div class="progress-bar progress-bar-aqua" style="width: 20%"--%>
            <%--role="progressbar"--%>
            <%--aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">--%>
            <%--<span class="sr-only">20% Complete</span>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</a>--%>
            <%--</li>--%>
            <%--<!-- end task item -->--%>
            <%--</ul>--%>
            <%--</li>--%>
            <%--<li class="footer">--%>
            <%--<a href="#">View all tasks</a>--%>
            <%--</li>--%>
            <%--</ul>--%>
            <%--</li>--%>
            <%--<!-- User Account Menu -->--%>
            <%--<li class="dropdown user user-menu">--%>
            <%--<!-- Menu Toggle Button -->--%>
            <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
            <%--<!-- The user image in the navbar-->--%>
            <%--<img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">--%>
            <%--<!-- hidden-xs hides the username on small devices so only the image appears. -->--%>
            <%--<span class="hidden-xs">Alexander Pierce</span>--%>
            <%--</a>--%>
            <%--<ul class="dropdown-menu">--%>
            <%--<!-- The user image in the menu -->--%>
            <%--<li class="user-header">--%>
            <%--<img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">--%>

            <%--<p>--%>
            <%--Alexander Pierce - Web Developer--%>
            <%--<small>Member since Nov. 2012</small>--%>
            <%--</p>--%>
            <%--</li>--%>
            <%--<!-- Menu Body -->--%>
            <%--<li class="user-body">--%>
            <%--<div class="row">--%>
            <%--<div class="col-xs-4 text-center">--%>
            <%--<a href="#">Followers</a>--%>
            <%--</div>--%>
            <%--<div class="col-xs-4 text-center">--%>
            <%--<a href="#">Sales</a>--%>
            <%--</div>--%>
            <%--<div class="col-xs-4 text-center">--%>
            <%--<a href="#">Friends</a>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<!-- /.row -->--%>
            <%--</li>--%>
            <%--<!-- Menu Footer-->--%>
            <%--<li class="user-footer">--%>
            <%--<div class="pull-left">--%>
            <%--<a href="#" class="btn btn-default btn-flat">Profile</a>--%>
            <%--</div>--%>
            <%--<div class="pull-right">--%>
            <%--<a href="#" class="btn btn-default btn-flat">Sign out</a>--%>
            <%--</div>--%>
            <%--</li>--%>
            <%--</ul>--%>
            <%--</li>--%>
            <%--<!-- Control Sidebar Toggle Button -->--%>
            <%--<li>--%>
            <%--<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>--%>
            <%--</li>--%>
            <%--</ul>--%>
            <%--</div>--%>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="/static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Alexander Pierce</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>


            <!-- Sidebar Menu -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">导航菜单</li>
                <!-- Optionally, you can add icons to the links -->
                <li class="active"><a href="#"><i class="fa fa-flag"></i> <span>后台首页</span></a></li>
                <li><a href="javascript:void(0);" class="mainMenu" data-src="/admin/user"><i class="fa fa-user"></i>
                    <span>用户管理</span></a></li>
                <%--<li class="treeview">--%>
                <%--<a href="#"><i class="fa fa-link"></i> <span>Multilevel</span>--%>
                <%--<span class="pull-right-container">--%>
                <%--<i class="fa fa-angle-left pull-right"></i>--%>
                <%--</span>--%>
                <%--</a>--%>
                <%--<ul class="treeview-menu">--%>
                <%--<li><a href="#">Link in level 2</a></li>--%>
                <%--<li><a href="#">Link in level 2</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <iframe id="mainIframe" name="mainIframe" width="100%" scrolling="no" onload="this.height=100" frameborder="0"
                src=""></iframe>

    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            Anything you want
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2019 <a href="#">肆意。-</a>.</strong> All rights reserved.
    </footer>

</div>
<!-- ./wrapper -->


<!-- jQuery 3 -->
<script src="/static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/dist/js/adminlte.min.js"></script>
<script>
    $(".mainMenu").click(function () {
        var address = $(this).attr("data-src");
        $("#mainIframe").attr("src", address);
    })

    function reinitIframe() {
        var iframe = document.getElementById("mainIframe");
        try {
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            var height = Math.max(bHeight, dHeight);
            iframe.height = height;
            // console.log(height);
        } catch (ex) {
        }
    }
    window.setInterval("reinitIframe()", 200);
</script>
</body>
</html>
