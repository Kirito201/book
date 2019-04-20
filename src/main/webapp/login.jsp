<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-03-18
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MYLIBRARY-登录</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/static/css/login.css">
    <link rel="stylesheet" href="/static/css/bootstrap4.min.css">
    <link rel="shortcut icon" href="/static/favicon.ico"/>
</head>
<body>
<div class="container-fluid">
    <div class="row no-gutter">
        <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
        <div class="col-md-8 col-lg-6">
            <div class="login d-flex align-items-center py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-lg-8 mx-auto">
                            <h3 class="login-heading mb-4">欢迎使用MYLIBRARY图书管理系统</h3>
                            <form id="loginForm">
                                <div class="form-label-group">
                                    <input type="text" id="userName" class="form-control" placeholder="用户名" autofocus>
                                    <label for="userName">用户名</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="userPassword" class="form-control" placeholder="密码">
                                    <label for="userPassword">密码</label>
                                </div>

                                <div id="vaptchaContainer" class="form-label-group">
                                    <div class="vaptcha-init-main">
                                        <div class="vaptcha-init-loading">
                                            <a href="https://www.vaptcha.com" target="_blank">
                                                <img src="https://cdn.vaptcha.com/vaptcha-loading.gif"/>
                                            </a>
                                            <span class="vaptcha-text">Vaptcha启动中...</span>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="custom-control custom-checkbox mb-3">--%>
                                <%--<input type="checkbox" class="custom-control-input" id="customCheck1">--%>
                                <%--<label class="custom-control-label" for="customCheck1">Remember password</label>--%>
                                <%--</div>--%>
                                <button id="login-btn"
                                        class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
                                        type="button">登录
                                </button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery 3 -->
<script src="/static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- bootstrap -->
<script src="/static/js/bootstrap.bundle.min.js"></script>
<!-- layer -->
<script src="/static/bower_components/layer-v3.1.1/layer/layer.js"></script>
<!-- jquery-cookie -->
<%--<script src="/static/bower_components/jquery-cookie/jquery.cookie.js"></script>--%>
<!--手势验证码-->
<script src="https://cdn.vaptcha.com/v2.js"></script>
<script>
    $(function(){
        if(self!=top){  // 判断当前页面是否是顶层页面
            var topWindow=window; // 定义最顶层页面  把当前页面赋值给topWindow
            while(topWindow.parent!=topWindow){  // 不断的循环 把当前页面的父页面与顶层页面对象比较 直到相同
                topWindow=topWindow.parent;
            }
            topWindow.location.href="/login.jsp"; // 顶层页面跳转到 登录页面
        }
    });

    function showLoadLayer() {
        layer.msg('拼命加载中...', {icon: 16, shade: [0.5, '#f5f5f5'], scrollbar: false, offset: '5px'});
    }

    function closeLoadLayer(index) {
        layer.close(index);
    }


    $("body").keydown(function () {
        if (event.keyCode == "13") {//keyCode=13是回车键
            $('#login-btn').click();
        }
    });

    var vaptchaToken="";
    var obj;
    vaptcha({
        //配置参数
        vid: '5bc88f45fc650e71a4dedf32', // 验证单元id
        type: 'click', // 展现类型 点击式
        container: '#vaptchaContainer' // 按钮容器，可为Element 或者 selector
    }).then(function (vaptchaObj) {
        obj = vaptchaObj;
        vaptchaObj.render()// 调用验证实例 vaptchaObj 的 render 方法加载验证按钮
        vaptchaObj.listen('pass', function () {
            // 验证成功进行后续操作
            vaptchaToken = vaptchaObj.getToken();
            // console.log(vaptchaToken);
        })
    })

    $("#login-btn").click(function () {
        var index = null;
        var userName = $.trim($("#userName").val());
        var userPassword = $.trim($("#userPassword").val());
        var data = {
            userName: userName,
            userPassword: userPassword,
            vaptchaToken: vaptchaToken
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
                    // var token = res.data.token;
                    // $.cookie('token', token);
                    // console.log($.cookie('token'));
                    setTimeout(function () {
                        window.location.href = "/admin/index";
                    }, 1000);
                } else {
                    layer.msg(res.msg, {offset: '5px', icon: 2});
                    obj.reset();
                }
            }
        });

    })
</script>
</body>
</html>
