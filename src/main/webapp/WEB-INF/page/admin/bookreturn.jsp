<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-04-18
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/loading.jsp" %>
<html>
<head>
    <title>MYLIBRARY-图书归还</title>
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
        还书管理
        <small>还书管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>图书管理</a></li>
        <li class="active">还书管理</li>
    </ol>
</section>

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info" style="margin-bottom: 2px">

                <div id="p1" class="easyui-panel" style="width:100%;height:600px;padding:10px;">
                    <div style="margin-bottom:10px">
                        <input class="easyui-textbox" id="bookId" label="图书编号:" style="width:400px">
                        <input type="hidden" id="lendReturnId">
                        <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search"
                           plain="true">检索</a>
                        <a href="javascript:resetSearchValue()" class="easyui-linkbutton" iconCls="icon-undo"
                           plain="true">重置</a>
                    </div>

                    <div class="box-body">
                        <strong>借阅者编号:</strong>
                        <p class="text-muted" id="userId"></p>
                        <hr>
                        <strong>借阅者姓名:</strong>
                        <p class="text-muted" id="userName"></p>
                        <hr>
                        <strong>借书日期:</strong>
                        <p class="text-muted" id="lendDate"></p>
                        <hr>
                        <strong>书名:</strong>
                        <p class="text-muted" id="bookName"></p>
                        <hr>
                        <strong>图书状态:</strong>
                        <p class="text-muted" id="bookState"></p>
                        <hr>
                        <strong>是否超期:</strong>
                        <p class="text-muted" id="otherState"></p>
                        <hr>
                        <strong>是否损毁:</strong>
                        <div>
                            <label class="checkbox-inline">
                                <input type="radio" name="optionsRadiosinline" id="weisunhui"
                                       value="0" checked>未损毁
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="optionsRadiosinline" id="yisunhui"
                                       value="1">已损毁
                            </label>
                        </div>
                        <hr>

                        <div id="sunhui" style="display: none">
                            <strong>损毁级别:</strong>
                            <input id="jibie" name="jibie" required value="">
                            <hr>
                            <strong>损毁描述:</strong>
                            <input class="easyui-textbox" required id="sunhuimiaoshu" data-options="multiline:true"
                                   value=""
                                   style="width:300px;height:100px">

                        </div>
                    </div>


                </div>


            </div>


            <div class="box-footer">
                <button type="button" id="checkBookReturn" disabled onclick="checkBookReturn()"
                        class="btn btn-info pull-right">
                    办理还书
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
    var data = [
        {"text": "轻微损毁", "id": "轻微损毁"},
        {"text": "严重损毁", "id": "严重损毁"},
    ]

    $("#jibie").combobox({
        valueField: "id",
        textField: "text",
        panelHeight: "auto",
        data: data,
    });

    $(document).ready(function () {
        $('input[type=radio][name=optionsRadiosinline]').change(function () {
            if (this.value == 0) {
                $("#sunhui").css("display", "none")
            } else if (this.value == 1) {
                $("#sunhui").removeAttr("style")
            }
        });
    });

    function search() {
        var bookId = $("#bookId").val();
        if (bookId == "") {
            $.messager.alert("系统提示", "图书编号不能为空");
            return false;
        }
        $.ajax({
            type: "POST",
            url: "/book/bookInfoAndUserByBookId?bookId=" + bookId,
            dateType: "json",
            success: function (res) {
                if (res.ret) {
                    var row = res.data[0];
                    if (row == null) {
                        $.messager.alert("系统提示", "记录不存在");
                    } else {
                        $("#checkBookReturn").removeAttr("disabled")
                    }

                    // console.log(row)
                    $("#lendReturnId").val(row.lendReturnId)
                    $("#userId").html(row.userId);
                    $("#userName").html(row.user.userTrueName);
                    $("#lendDate").html(row.lendDate);
                    $("#bookName").html(row.bookInfo.bookName);
                    if (row.bookInfo.bookState == 0) {
                        $("#bookState").html("<button class='btn-success' disabled>正常</button>");
                    } else {
                        $("#bookState").html("<button  class='btn-warning' disabled>借出</button >")
                    }
                    if (row.extendedDays > 0) {
                        $("#otherState").html("<button class='btn-danger' disabled>已超期" + row.extendedDays + "天</button>");
                    } else {
                        $("#otherState").html("<button class='btn-success' disabled>未超期</button>");
                    }
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    function resetSearchValue() {
        $("#bookId").textbox("setValue", "");
        $("#lendReturnId").val("")
        $("#userId").html("")
        $("#userName").html("")
        $("#lendDate").html("")
        $("#bookName").html("")
        $("#bookState").html("")
        $("#otherState").html("")
        $("#jibie").combobox("setValue", "");
        $("#sunhuimiaoshu").textbox("setText", "");
        $("#checkBookReturn").attr("disabled", true);
    }

    function checkBookReturn() {
        var lendReturnId = $("#lendReturnId").val();
        var bookId = $("#bookId").val();
        var isDamage = $('input:radio[name="optionsRadiosinline"]:checked').val();
        var damageDegree = $('#jibie').combobox("getValue");
        var damageNote = $("#sunhuimiaoshu").textbox("getText");

        if (bookId == "") {
            $.messager.alert("系统提示", "图书编号不能为空");
            return false;
        }
        if (isDamage == 0) {
            $.messager.confirm('系统提示', '确定图书未损毁吗?',
                function (r) {
                    if (r) {
                        $.ajax({
                            type: "POST",
                            url: "/book/returnBook",
                            dateType: "json",
                            data: {
                                lendReturnId: lendReturnId,
                                bookId: bookId,
                                isDamage: isDamage,
                                damageDegree: damageDegree,
                                damageNote: damageNote
                            },
                            success: function (res) {
                                if (res.ret) {
                                    $.messager.alert("系统提示", "还书成功");
                                    resetSearchValue();
                                } else {
                                    $.messager.alert("系统提示", "还书失败");
                                }
                            }
                        });
                    }
                })
        } else {
            $.ajax({
                type: "POST",
                url: "/book/returnBook",
                dateType: "json",
                data: {
                    lendReturnId: lendReturnId,
                    bookId: bookId,
                    isDamage: isDamage,
                    damageDegree: damageDegree,
                    damageNote: damageNote
                },
                success: function (res) {
                    if (res.ret) {
                        $.messager.alert("系统提示", "还书成功");
                        resetSearchValue();
                    } else {
                        $.messager.alert("系统提示", "还书失败");
                    }
                }
            });
        }
    }
</script>

</body>
</html>
