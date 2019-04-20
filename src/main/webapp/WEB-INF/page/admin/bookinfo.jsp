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
    <title>MYLIBRARY-图书信息</title>
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
    <link rel="stylesheet" href="/static/bower_components/ztree/zTreeStyle.css">
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
        图书信息管理
        <small>图书信息管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>图书管理</a></li>
        <li class="active">图书信息管理</li>
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
                   toolbar="#tb" pagination="true"
                   fitColumns="false" singleSelect="false">
                <thead>
                <th field="ck" checkbox="true"></th>
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

            <div id="tb">
                <div>
                    <a href="javascript:openBookAddDialog()" class="easyui-linkbutton" iconCls="icon-add"
                       plain="true">添加</a>
                    <a href="javascript:openBookModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"
                       plain="true">修改</a>
                    <a href="javascript:deleteBook()" class="easyui-linkbutton" iconCls="icon-remove"
                       plain="true">删除</a>
                </div>
            </div>

            <div id="dlg" class="easyui-dialog" style="width:80%"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
                <form id="fm" novalidate style="margin:0;padding:20px 50px">

                    <div style="margin-bottom:10px">
                        <input name="bookIsbn" id="n_bookIsbn" class="easyui-textbox"
                               required="true"
                               label="ISBN:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookName" id="n_bookName" class="easyui-textbox"
                               label="名称:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookAuthor" id="n_bookAuthor" class="easyui-textbox"
                               label="作者:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookPublish" id="n_bookPublish" class="easyui-textbox"
                               label="出版社:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookPrice" id="n_bookPrice" class="easyui-textbox"
                               label="价格:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookType" id="n_bookType" class="easyui-textbox"
                               label="分类:" prompt="请选择分类" readonly required="true"
                               style="width:100%">
                        <input type="hidden" id="n_bookTypeId">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookShelf" id="n_bookShelf" class="easyui-textbox"
                               label="书架号:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <label>图书简介:</label>
                        <textarea id="n_bookIntroduction" name="bookIntroduction">
                        </textarea>
                        <%--                        <input class="easyui-textbox" name="bookIntroduction" id="n_bookIntroduction"--%>
                        <%--                               data-options="multiline:true" label="图书简介:" style="height:200px;width:100%">--%>
                    </div>
                </form>
            </div>
            <div id="dlg-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                   onclick="saveBookInfo()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
            </div>


            <div id="dlg1" class="easyui-dialog" style="width:500px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg1-buttons'">
                <div style="margin-bottom:10px;padding: 20px">
                    <ul id="bookTypeTree" class="ztree"></ul>
                </div>

            </div>
            <div id="dlg1-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                   onclick="chooseBookType()"
                   style="width:90px">选择</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg1').dialog('close')" style="width:90px">取消</a>
            </div>

            <div id="dlg2" class="easyui-dialog" style="width:80%"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg2-buttons'">
                <form id="fm1" novalidate style="margin:0;padding:20px 50px">

                    <div style="margin-bottom:10px">
                        <input name="bookIsbn" id="u_bookIsbn" class="easyui-textbox"
                               required="true"
                               label="ISBN:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookName" id="u_bookName" class="easyui-textbox"
                               label="名称:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookAuthor" id="u_bookAuthor" class="easyui-textbox"
                               label="作者:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookPublish" id="u_bookPublish" class="easyui-textbox"
                               label="出版社:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookPrice" id="u_bookPrice" class="easyui-textbox"
                               label="价格:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="types" id="u_bookType" class="easyui-textbox"
                               label="分类:" prompt="请选择分类" readonly required="true"
                               style="width:100%">
                        <input type="hidden" name="bookType" id="u_bookTypeId">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="bookShelf" id="u_bookShelf" class="easyui-textbox"
                               label="书架号:" required="true"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <label>图书简介:</label>
                        <textarea id="u_bookIntroduction" name="bookIntroduction">
                        </textarea>
                    </div>
                </form>
            </div>
            <div id="dlg2-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                   onclick="updateBookInfo()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg2').dialog('close')" style="width:90px">取消</a>
            </div>

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
<!-- ztree -->
<script src="/static/bower_components/ztree/jquery.ztree.all-3.5.min.js"></script>
<script src="/static/js/loading.js"></script>
<!-- ckeditor -->
<script src="/static/ckeditor/ckeditor.js"></script>
<script>
    CKEDITOR.replace("n_bookIntroduction", {
        height: 100
    });
    CKEDITOR.replace("u_bookIntroduction", {
        height: 100
    });

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

    var url;

    function openBookAddDialog() {
        $("#dlg").dialog("open").dialog("center").dialog("setTitle", "新增图书");
        $("#fm").form("clear");
        CKEDITOR.instances.n_bookIntroduction.setData("");
        url = "/bookinfo/save"
    }

    $(function () {
        $('#n_bookType').textbox('textbox').bind('click', function () {
            $("#dlg1").dialog("open").dialog("center").dialog("setTitle", "选择图书分类");
        });
    })

    $(function () {
        $('#u_bookType').textbox('textbox').bind('click', function () {
            $("#dlg1").dialog("open").dialog("center").dialog("setTitle", "选择图书分类");
        });
    })


    $(function () {
        var setting = {
            async: {
                enable: true,
                url: "/booktype/loadAllBookTypeData",
            },
            data: {
                key: {
                    name: "bookTypeName"
                }
            },
            callback: {//回调函数
                onAsyncSuccess: zTreeOnAsyncSuccess,// 异步加载正常结束的事件回调函数
                onClick: zTreeOnClick
            },
        }

        $.fn.zTree.init($("#bookTypeTree"), setting);
    })

    function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
        var treeObj = $.fn.zTree.getZTreeObj(treeId);
        var nodes = treeObj.getNodes();
        if (nodes.length > 0) {
            for (var i = 0; i < nodes.length; i++) {
                treeObj.expandNode(nodes[i], true, false, false);//默认展开第一级节点
            }
        }
    }

    var bookTypeId;
    var bookTypeName;

    function zTreeOnClick(event, treeId, treeNode) {
        bookTypeId = treeNode.bookTypeId;
        bookTypeName = treeNode.bookTypeName;
    };

    function chooseBookType() {
        $("#n_bookType").textbox("setValue", bookTypeName);
        $("#n_bookTypeId").val(bookTypeId);
        $("#u_bookType").textbox("setValue", bookTypeName);
        $("#u_bookTypeId").val(bookTypeId);
        $("#dlg1").dialog("close");
    }

    function saveBookInfo() {
        var bookIsbn = $("#n_bookIsbn").val()
        var bookName = $("#n_bookName").val()
        var bookAuthor = $("#n_bookAuthor").val()
        var bookPublish = $("#n_bookPublish").val()
        var bookPrice = $("#n_bookPrice").val()
        var bookType = $("#n_bookTypeId").val()
        var bookShelf = $("#n_bookShelf").val()
        var bookIntroduction = CKEDITOR.instances.n_bookIntroduction.getData();
        console.log(bookIntroduction)
        $.ajax({
            type: "POST",
            url: url,
            dateType: "json",
            beforeSend: function () {
                var isValid = $("#fm").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                bookIsbn: bookIsbn,
                bookName: bookName,
                bookAuthor: bookAuthor,
                bookPublish: bookPublish,
                bookPrice: bookPrice,
                bookType: bookType,
                bookShelf: bookShelf,
                bookIntroduction: bookIntroduction
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "新增成功！");
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    function openBookModifyDialog() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要修改的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg2").dialog("open").dialog("center").dialog("setTitle", "编辑图书");
        $("#fm1").form("load", row);
        CKEDITOR.instances.u_bookIntroduction.setData(row.bookIntroduction);
        url = "/bookinfo/update?bookId=" + row.bookId;
    }

    function updateBookInfo() {
        var bookIsbn = $("#u_bookIsbn").val()
        var bookName = $("#u_bookName").val()
        var bookAuthor = $("#u_bookAuthor").val()
        var bookPublish = $("#u_bookPublish").val()
        var bookPrice = $("#u_bookPrice").val()
        var bookType = $("#u_bookTypeId").val()
        var bookShelf = $("#u_bookShelf").val()
        var bookIntroduction = CKEDITOR.instances.u_bookIntroduction.getData();
        $.ajax({
            type: "PUT",
            url: url,
            dateType: "json",
            beforeSend: function () {
                var isValid = $("#fm1").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                bookIsbn: bookIsbn,
                bookName: bookName,
                bookAuthor: bookAuthor,
                bookPublish: bookPublish,
                bookPrice: bookPrice,
                bookType: bookType,
                bookShelf: bookShelf,
                bookIntroduction: bookIntroduction
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "编辑成功！");
                    $("#dlg2").dialog("close");
                    $("#dg").datagrid("reload");
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    function deleteBook() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要删除的数据！");
            return;
        }
        var bookId = selectedRows[0].bookId;
        $.messager.confirm("系统提示", "您确定要删除这条数据吗?", function (r) {
            if (r) {
                $.ajax({
                    type: "DELETE",
                    url: "/bookinfo/delete?bookId=" + bookId,
                    success: function (res) {
                        if (res.ret) {
                            $.messager.alert("系统提示", "删除成功！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert("系统提示", "删除失败！");
                        }
                    }
                });
            }
        });
    }

    $(document).ready(function () {

        $("#dg").datagrid({
            onDblClickRow: function (index, row) {
                $("#dlg2").dialog("open").dialog("center").dialog("setTitle", "编辑图书");
                $("#fm1").form("load", row);
                CKEDITOR.instances.u_bookIntroduction.setData(row.bookIntroduction);
                url = "/bookinfo/update?bookId=" + row.bookId;
            }
        });

    });

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
