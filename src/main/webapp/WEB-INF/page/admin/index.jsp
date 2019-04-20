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
    <title>MYLIBRARY-后台首页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/dist/css/skins/skin-blue.min.css">
    <link rel="shortcut icon" href="/static/favicon.ico"/>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/metro/easyui.css">
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/icon.css">
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/color.css">
</head>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <%--<span class="logo-mini"><b>A</b>LT</span>--%>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg">图书管理系统</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown tasks-menu">
                        <!-- Menu Toggle Button -->
                        <a href="javascript:void(0);" class="btn" onclick="modifyPassword()">
                            <i class="fa fa-cog"></i>
                            <span>修改密码</span>
                        </a>

                    </li>
                    <!-- User Account Menu -->
                    <li class="dropdown tasks-menu">
                        <!-- Menu Toggle Button -->
                        <a href="/logout"  class="btn">
                            <i class="fa fa-lock"></i>
                            <span>安全退出</span>
                        </a>
                    </li>
                </ul>
            </div>
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
                    <p>欢迎:&nbsp; ${user.userName}</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> ${user.roles}</a>
                </div>
            </div>

            <%@include file="../common/menu.jsp" %>

            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <iframe id="mainIframe" name="mainIframe" width="100%" onload="this.height=700" scrolling="no" frameborder="0"
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
<div id="dlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
    <form id="fm" novalidate style="margin:0;padding:20px 50px">
        <div style="margin-bottom:10px">
            <input type="password" name="oldPassword" id="u_oldPassword" class="easyui-textbox" required="true"
                   label="原密码:"
                   style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input type="password" id="u_userPassword" name="userPassword" class="easyui-textbox"
                   required="true" validType="length[6,15]" label="新密码:"
                   style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input type="password" name="reUserPassword" class="easyui-textbox" required="true"
                   validType="equalTo['#u_userPassword']" invalidMessage="两次输入密码不匹配" label="确认新密码:"
                   style="width:100%">
        </div>

    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateUserPassword()"
       style="width:90px">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
</div>


<!-- jQuery 3 -->
<script src="/static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/dist/js/adminlte.min.js"></script>
<!-- jquery easyui -->
<script src="/static/bower_components/jquery-easyui/jquery.easyui.min.js"></script>
<script src="/static/bower_components/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
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

    $.extend($.fn.validatebox.defaults.rules, {
        /*必须和某个字段相等*/
        equalTo: {
            validator: function (value, param) {
                return $(param[0]).val() == value;
            }, message: '字段不匹配'
        },
    });

    var url;

    function modifyPassword() {
        $("#dlg").dialog("open").dialog("center").dialog("setTitle", "修改密码");
        $("#fm").form("clear");
        url = "/user/modifyPassword";
    }

    function updateUserPassword() {
        $.ajax({
            type: "POST",
            url: url,
            dateType: "json",
            // headers: {"token": $.cookie("token")},
            beforeSend: function () {
                var isValid = $("#fm").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                oldPassword: $("#u_oldPassword").val(),
                newPassword: $("#u_userPassword").val(),
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "修改成功！");
                    $("#dlg").dialog("close");
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

</script>
</body>
</html>
