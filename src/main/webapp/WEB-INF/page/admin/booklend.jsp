<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-04-17
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/loading.jsp" %>
<html>
<head>
    <title>MYLIBRARY-图书借阅</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <link rel="shortcut icon" href="/static/favicon.ico"/>
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/metro/easyui.css">
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/icon.css">
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/color.css">
</head>
<body>
<section class="content-header">
    <h1>
        借书管理
        <small>借书管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>图书管理</a></li>
        <li class="active">借书管理</li>
    </ol>
</section>

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info" style="margin-bottom: 2px">

                <div id="p1" class="easyui-panel" title="借阅者信息" style="width:100%;height:250px;padding:10px;">
                    <div style="margin-bottom:10px">
                        <input class="easyui-textbox" id="userId" label="借阅者编号:" style="width:400px">
                        <a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search"
                           plain="true">检索</a>
                        <a href="javascript:resetSearchUserValue()" class="easyui-linkbutton" iconCls="icon-undo"
                           plain="true">重置</a>
                    </div>

                    <div class="box-body">
                        <strong>姓名:</strong>

                        <p class="text-muted" id="userName"></p>

                        <hr>
                        <strong>状态:</strong>
                        <p class="text-muted" id="userState"></p>
                        <hr>
                    </div>


                </div>
                <div style="margin-bottom:10px"></div>
                <div id="p2" class="easyui-panel" title="图书信息" style="width:100%;height:250px;padding:10px;">
                    <div style="margin-bottom:10px">
                        <input class="easyui-textbox" id="bookId" label="图书编号:" style="width:400px">
                        <a href="javascript:searchBook()" class="easyui-linkbutton" iconCls="icon-search"
                           plain="true">检索</a>
                        <a href="javascript:resetSearchBookValue()" class="easyui-linkbutton" iconCls="icon-undo"
                           plain="true">重置</a>
                    </div>
                    <div class="box-body">
                        <strong>书名:</strong>
                        <p class="text-muted" id="bookName"></p>
                        <hr>
                        <strong>状态:</strong>
                        <p class="text-muted" id="bookState"></p>
                        <hr>
                    </div>

                </div>

                <div class="box-footer">
                    <input id="cc" name="days" value="">
                    <button type="button" id="checkBookLend" disabled onclick="checkBookLend()"
                            class="btn btn-info pull-right">
                        办理借阅
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- jQuery 3 -->
<script src="/static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/dist/js/adminlte.min.js"></script>
<!-- jquery easyui -->
<script src="/static/bower_components/jquery-easyui/jquery.easyui.min.js"></script>
<script src="/static/bower_components/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="/static/js/loading.js"></script>
<script>
    function resetSearchUserValue() {
        // $("#checkBookLend").removeAttr("disabled");
        $("#userId").textbox("setValue", "");
        $("#userName").html("")
        $("#userState").html("")
    }

    function resetSearchBookValue() {
        // $("#checkBookLend").removeAttr("disabled");
        $("#bookId").textbox("setValue", "");
        $("#bookName").html("")
        $("#bookState").html("")
    }

    function searchUser() {
        var userId = $("#userId").val();
        if (userId == "") {
            $.messager.alert("系统提示", "借阅者编号不能为空");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/user/userInfo?userId=" + userId,
            dateType: "json",
            success: function (res) {
                if (res.ret) {
                    var row = res.data;
                    $("#userName").html(row.userTrueName);
                    if (row.userState == 1) {
                        $("#userState").html("<button class='btn-success' disabled>正常</button>");
                        $("#checkBookLend").attr("disabled", false);
                    } else {
                        $("#userState").html("<button  class='btn-warning' disabled>禁用</button >")
                        $("#checkBookLend").attr("disabled", true);
                    }
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });


    }

    function searchBook() {
        var bookId = $("#bookId").val();
        if (bookId == "") {
            $.messager.alert("系统提示", "图书编号不能为空");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/bookinfo/info?bookId=" + bookId,
            dateType: "json",
            success: function (res) {
                if (res.ret) {
                    var row = res.data;
                    $("#bookName").html(row.bookName)
                    if (row.bookState == 0) {
                        $("#bookState").html("<button class='btn-success' disabled>在馆</button>")
                        $("#checkBookLend").attr("disabled", false);
                    } else {
                        $("#bookState").html("<button  class='btn-warning' disabled>借出</button >")
                        $("#checkBookLend").attr("disabled", true);
                    }
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    var data = [
        {"text": "10天", "id": "10"},
        {"text": "20天", "id": "20"},
        {"text": "30天", "id": "30"},
    ]

    $("#cc").combobox({
        valueField: "id",
        textField: "text",
        panelHeight: "auto",
        data: data,
        label: "请选择借阅天数:",
        labelPosition: "top"
    });

    function checkBookLend() {
        var userId = $("#userId").val();
        var bookId = $("#bookId").val();
        var shouldLendDays = $('#cc').combobox("getValue");
        if (userId == "") {
            $.messager.alert("系统提示", "借阅者编号不能为空");
            return false;
        }
        if (bookId == "") {
            $.messager.alert("系统提示", "图书编号不能为空");
            return false;
        }
        if (shouldLendDays == "") {
            $.messager.alert("系统提示", "借阅天数不能为空");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/book/lendBook",
            dateType: "json",
            data: {
                userId: userId,
                bookId: bookId,
                shouldLendDays: shouldLendDays
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "借阅成功");
                    resetSearchUserValue();
                    resetSearchBookValue();
                    $('#cc').combobox("setValue", "");
                } else {
                    $.messager.alert("系统提示", "借阅失败");
                }
            }
        });
    }
</script>
</body>
</html>
