<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-04-15
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/loading.jsp" %>
<html>
<head>
    <title>MYLIBRARY-图书检索</title>
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
    <style>
        .datagrid-header-row, .datagrid-row {
            height: 40px;
        }

        body {
            font-family: verdana, helvetica, arial, sans-serif;
        }

    </style>
</head>
<body>
<section class="content-header">
    <h1>
        图书检索
        <small>图书检索</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>借阅者</a></li>
        <li class="active">图书检索</li>
    </ol>
</section>

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info" style="margin-bottom: 2px">


                <div class="easyui-accordion" style="width:100%">
                    <div title="按条件查询:" data-options="iconCls:'icon-search'" style="overflow:auto;padding:10px">
                        ISBN:&nbsp;<input type="text" id="s_bookIsbn" size="20"
                                          onkeydown="if(event.keyCode==13) searchBook()"/>
                        书名:&nbsp;<input type="text" id="s_bookName" size="20"
                                        onkeydown="if(event.keyCode==13) searchBook()"/>
                        作者:&nbsp;<input type="text" id="s_bookAuthor" size="20"
                                        onkeydown="if(event.keyCode==13) searchBook()"/>

                        <a href="javascript:searchBook()" class="easyui-linkbutton" iconCls="icon-search"
                           plain="true">搜索</a>
                        <a href="javascript:resetSearchValue()" class="easyui-linkbutton" iconCls="icon-undo"
                           plain="true">重置</a>

                    </div>
                </div>
            </div>


            <table id="dg" title="图书信息列表" iconCls="icon-more" class="easyui-datagrid" width="100%"
                   url="/bookinfo/list"
                   pagination="true"
                   fitColumns="false">
                <thead>
                <th field="bookId" width="100" align="center">编号</th>
                <th field="bookIsbn" width="200" align="center">ISBN</th>
                <th field="bookName" width="400" align="center">名称</th>
                <th field="bookAuthor" width="200" align="center">作者</th>
                <th field="bookPublish" width="200" align="center">出版社</th>
                <th field="bookPrice" width="100" align="center">价格</th>
                <th field="ss" width="200" align="center" formatter="formatBookState">状态</th>
                <th field="types" width="200" align="center">所属分类</th>
                <th field="bookShelf" width="100" align="center">书架号</th>
                <th field="bookCreateTime" width="200" align="center">创建时间</th>
                <th field="bookLastModifyTime" width="200" align="center">更新时间</th>
                <th field="aa" width="200" align="center" formatter="formatOperate">操作</th>
                </thead>
            </table>


            <div id="w" class="easyui-window" title="图书详情" data-options="modal:true,closed:true,iconCls:'icon-ok'"
                 style="width:100%;height:700px;padding:10px;">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-book"></i>图书详情</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <strong>图书编号</strong>
                        <p class="text-muted" id="id"></p>
                        <hr>
                        <strong>图书ISBN</strong>
                        <p class="text-muted" id="isbn"></p>
                        <hr>
                        <strong>图书名称</strong>
                        <p class="text-muted" id="name"></p>
                        <hr>
                        <strong>图书作者</strong>
                        <p class="text-muted" id="author"></p>
                        <hr>
                        <strong>图书出版社</strong>
                        <p class="text-muted" id="publish"></p>
                        <hr>
                        <strong>图书价格</strong>
                        <p class="text-muted" id="price"></p>
                        <hr>
                        <strong>图书状态</strong>
                        <p class="text-muted" id="state"></p>
                        <hr>
                        <strong>图书书架号</strong>
                        <p class="text-muted" id="shelf"></p>
                        <hr>
                        <strong>图书分类</strong>
                        <p class="text-muted" id="type"></p>
                        <hr>
                        <strong>图书简介</strong>
                        <div id="introductions">
                        </div>

                    </div>
                    <!-- /.box-body -->
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

    function formatBookState(value, row) {
        if (row.bookState == 0) {
            return "<button class='btn-success' disabled>在馆</button>";
        } else {
            return "<button class='btn-warning' disabled>借出</button>";
        }
    }

    function formatOperate(value, row) {

        return "<button onclick=\"showBookDetail('" + row.bookId + "')\" class='btn-info'>查看详情</button>";
    }

    function showBookDetail(bookId) {
        $.ajax({
            type: "GET",
            url: "/bookinfo/detail?bookId=" + bookId,
            dateType: "json",
            success: function (res) {
                if (res.ret) {
                    var row = res.data[0];
                    $("#id").html(row.bookId)
                    $("#isbn").html(row.bookIsbn)
                    $("#name").html(row.bookName)
                    $("#author").html(row.bookAuthor)
                    $("#publish").html(row.bookPublish)
                    $("#price").html(row.bookPrice)
                    if (row.bookState == 0) {
                        $("#state").html("<button class='btn-success' disabled>在馆</button>")
                    } else {
                        $("#state").html("<button  class='btn-warning' disabled>借出</button >")
                    }
                    $("#shelf").html(row.bookShelf)
                    $("#type").html(row.types)
                    $("#introductions").html(row.bookIntroduction)
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });

        $("#w").window("open").window("center");
    }

    function searchBook() {
        $("#dg").datagrid("load", {
            "bookIsbn": $("#s_bookIsbn").val(),
            "bookName": $("#s_bookName").val(),
            "bookAuthor": $("#s_bookAuthor").val(),

        })
    }

    function resetSearchValue() {
        $("#s_bookIsbn").val("");
        $("#s_bookName").val("");
        $("#s_bookAuthor").val("");
        searchBook();
    }
</script>
</body>
</html>
