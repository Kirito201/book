<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-03-12
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/static/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<body class="hold-transition login-page" style="overflow: hidden">
<div class="login-box">
    <div class="login-logo">
        <a href="#">图书管理系统</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">用户登录</p>

        <form id="loginForm" action="#" method="post">
            <div class="form-group has-feedback">
                <input id="userName" name="userName" type="text" class="form-control" placeholder="请输入用户名">
                <%--<span class="glyphicon glyphicon-user form-control-feedback"></span>--%>
            </div>
            <div class="form-group has-feedback">
                <input id="userPassword" name="userPassword" type="password" class="form-control" placeholder="请输入密码">
                <%--<span class="glyphicon glyphicon-lock form-control-feedback"></span>--%>
            </div>
            <div class="row" style="margin-top: 40px">
                <div class="col-xs-12">
                    <button type="button" id="login-btn" class="btn btn-primary btn-block btn-flat">
                        登录
                    </button>
                </div>
            </div>
        </form>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->


<!-- jQuery 3 -->
<script src="/static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- layer -->
<script src="/static/bower_components/layer-v3.1.1/layer/layer.js"></script>
<!-- jquery-cookie -->
<script src="/static/bower_components/jquery-cookie/jquery.cookie.js"></script>
<!-- jquery-validate -->
<script src="/static/bower_components/jquery-validation/dist/jquery.validate.js"></script>
<script src="/static/bower_components/jquery-validation/dist/localization/messages_zh.js"></script>
<script>

    $(function () {
        $("#loginForm").validate({
            onfocusin: function (element) {
                $(element).valid();
            },
            rules: {
                userName: {
                    required: true,
                },
                userPassword: {
                    required: true
                }
            },
            messages: {
                userName: {
                    required: "请输入用户名",
                },
                userPassword: {
                    required: "请输入密码",
                },
            }

        });
    });

    function showLoadLayer() {
        layer.msg('拼命加载中...', {icon: 16, shade: [0.5, '#f5f5f5'], scrollbar: false, offset: '5px', time: 100000});
    }

    function closeLoadLayer(index) {
        layer.close(index);
    }

    $("#login-btn").click(function () {
        var index;
        var userName = $.trim($("#userName").val());
        var userPassword = $.trim($("#userPassword").val());
        var data = {
            userName: userName,
            userPassword: userPassword
        };

        $.ajax({
            type: "POST",
            url: "/user/login",
            data: data,
            dataType: 'json',
            beforeSend: function () {
                index = showLoadLayer()
            },
            success: function (res) {
                closeLoadLayer(index);
                if (res.ret) {
                    layer.msg("登录成功！正在跳转...", {offset: '5px', icon: 1, time: 2000});
                    var token = res.data.token;
                    $.cookie('token', token);
                    // console.log($.cookie('token'));
                    setTimeout(function () {
                        window.location.href = "/admin/index";
                    }, 1000);

                } else {
                    layer.msg(res.msg, {offset: '5px', icon: 2});
                }
            }
        });
    })

    $("body").keydown(function () {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#login-btn').click();
        }
    });
</script>
</body>
</html>
