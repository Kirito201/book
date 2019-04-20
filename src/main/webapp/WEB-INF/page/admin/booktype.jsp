<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-04-09
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/loading.jsp" %>
<html>
<head>
    <title>MYLIBRARY-图书分类</title>
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
            height: 45px;
        }

        body {
            font-family: verdana, helvetica, arial, sans-serif;
        }

    </style>
</head>
<body>
<section class="content-header">
    <h1>
        图书分类管理
        <small>图书分类管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>图书管理</a></li>
        <li class="active">图书分类管理</li>
    </ol>
</section>

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info" style="margin-bottom: 2px">

                <div class="easyui-panel" title="Nested Panel"
                     data-options="width:'100%',minHeight:600,noheader:true,border:true" style="padding:10px;">
                    <div class="easyui-layout" data-options="fit:true">
                        <div data-options="region:'west',split:false" style="width:250px;padding:5px">
                            <ul id="bookTypeTree" class="ztree"></ul>
                        </div>
                        <div data-options="region:'center'" style="padding:5px">
                            <table class="easyui-datagrid" id="bookTypeList" width="100%"
                                   rownumbers="true" fitColumns="true" singleSelect="false"
                                   url="/booktype/listByBookTypeId" toolbar="#tb" title="分类列表" iconCls="icon-more">
                                <thead>
                                <th field="bookTypeId" width="30" align="center">分类编号</th>
                                <th field="bookTypeName" width="100" align="center">分类名称</th>
                                <th field="bookTypeNote" width="60" align="center">分类描述</th>
                                <th field="bookTypeCreateTime" width="60" align="center">创建时间</th>
                                <th field="bookTypeLastModifyTime" width="60" align="center">更新时间</th>
                                </thead>
                            </table>
                            <div id="tb">
                                <div>
                                    <a href="javascript:openBookTypeSameLevelAddDialog()" class="easyui-linkbutton"
                                       iconCls="icon-add"
                                       plain="true">新增同级分类</a>
                                    <a href="javascript:openBookTypeLowerLevelAddDialog()" class="easyui-linkbutton"
                                       iconCls="icon-add"
                                       plain="true">新增下级分类</a>
                                    <a href="javascript:openBookTypeModifyDialog()" class="easyui-linkbutton"
                                       iconCls="icon-edit"
                                       plain="true">修改当前分类</a>
                                    <a href="javascript:deleteBookType()" class="easyui-linkbutton"
                                       iconCls="icon-remove"
                                       plain="true">删除当前分类</a>
                                </div>
                            </div>

                            <div id="dlg1" class="easyui-dialog" style="width:400px"
                                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg1-buttons'">
                                <form id="fm1" novalidate style="margin:0;padding:20px 50px">

                                    <div style="margin-bottom:10px">
                                        <input name="bookTypeName" id="ns_bookTypeName" class="easyui-textbox"
                                               required="true"
                                               label="分类名称:"
                                               style="width:100%">
                                    </div>
                                    <div style="margin-bottom:10px">
                                        <input name="bookTypeNote" id="ns_bookTypeNote" class="easyui-textbox"
                                               label="分类描述:"
                                               style="width:100%">
                                    </div>
                                </form>
                            </div>
                            <div id="dlg1-buttons">
                                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                                   onclick="saveSameLevelBookType()"
                                   style="width:90px">保存</a>
                                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                                   onclick="javascript:$('#dlg1').dialog('close')" style="width:90px">取消</a>
                            </div>

                            <div id="dlg3" class="easyui-dialog" style="width:400px"
                                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg3-buttons'">
                                <form id="fm3" novalidate style="margin:0;padding:20px 50px">

                                    <div style="margin-bottom:10px">
                                        <input name="bookTypeName" id="nl_bookTypeName" class="easyui-textbox"
                                               required="true"
                                               label="分类名称:"
                                               style="width:100%">
                                    </div>
                                    <div style="margin-bottom:10px">
                                        <input name="bookTypeNote" id="nl_bookTypeNote" class="easyui-textbox"
                                               label="分类描述:"
                                               style="width:100%">
                                    </div>
                                </form>
                            </div>
                            <div id="dlg3-buttons">
                                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                                   onclick="saveLowerLevelBookType()"
                                   style="width:90px">保存</a>
                                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                                   onclick="javascript:$('#dlg3').dialog('close')" style="width:90px">取消</a>
                            </div>

                            <div id="dlg2" class="easyui-dialog" style="width:400px"
                                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg2-buttons'">
                                <!--隐藏域分类Id-->
                                <form id="fm2" novalidate style="margin:0;padding:20px 50px">
                                    <div style="margin-bottom:10px">
                                        <input type="hidden" id="u_bookTypeId" name="bookTypeId" class="easyui-textbox"
                                               required="true"/>
                                    </div>

                                    <div style="margin-bottom:10px">
                                        <input name="bookTypeName" id="u_bookTypeName" class="easyui-textbox"
                                               required="true"
                                               label="分类名称:"
                                               style="width:100%">
                                    </div>
                                    <div style="margin-bottom:10px">
                                        <input name="bookTypeNote" id="u_bookTypeNote" class="easyui-textbox"
                                               label="分类描述:"
                                               style="width:100%">
                                    </div>
                                </form>
                            </div>
                            <div id="dlg2-buttons">
                                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                                   onclick="saveEditBookType()"
                                   style="width:90px">保存</a>
                                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                                   onclick="javascript:$('#dlg2').dialog('close')" style="width:90px">取消</a>
                            </div>
                        </div>
                    </div>
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
<script>

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

    $(function () {

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
    var bookTypeParentId;
    var bookTypeName;
    var bookTypeNote;

    function zTreeOnClick(event, treeId, treeNode) {
        $('#bookTypeList').datagrid('reload', {
            bookTypeId: treeNode.bookTypeId
        });
        bookTypeId = treeNode.bookTypeId;
        bookTypeParentId = treeNode.bookTypeParentId;
        bookTypeName = treeNode.bookTypeName;
        bookTypeNote = treeNode.bookTypeNote;
        // console.log(treeNode)
        // alert(treeNode.getParentNode().bookTypeId + ", " + treeNode.bookTypeName);
    };

    var url;

    function openBookTypeSameLevelAddDialog() {
        var treeObj = $.fn.zTree.getZTreeObj("bookTypeTree");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length == 0) {
            $.messager.alert("系统提示", "请选择一个节点！");
            return;
        }
        if (bookTypeParentId == null) {
            $.messager.alert("系统提示", "无法新增同级节点！");
            return;
        } else {
            $("#dlg1").dialog("open").dialog("center").dialog("setTitle", "新增同级分类");
            $("#fm1").form("clear");
            url = "/booktype/save";
        }
    }

    function saveSameLevelBookType() {
        $.ajax({
            type: "POST",
            url: url,
            dateType: "json",
            beforeSend: function () {
                var isValid = $("#fm1").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                bookTypeParentId: bookTypeParentId,
                bookTypeName: $("#ns_bookTypeName").val(),
                bookTypeNote: $("#ns_bookTypeNote").val(),
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "新增成功！");
                    $("#dlg1").dialog("close");
                    $("#bookTypeList").datagrid("reload", {total: 0, rows: []});
                    $.fn.zTree.init($("#bookTypeTree"), setting);
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    function openBookTypeLowerLevelAddDialog() {
        var treeObj = $.fn.zTree.getZTreeObj("bookTypeTree");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length == 0) {
            $.messager.alert("系统提示", "请选择一个节点！");
            return;
        } else {
            $("#dlg3").dialog("open").dialog("center").dialog("setTitle", "新增下级分类");
            $("#fm3").form("clear");
            url = "/booktype/save";
        }
    }

    function saveLowerLevelBookType() {
        $.ajax({
            type: "POST",
            url: url,
            dateType: "json",
            beforeSend: function () {
                var isValid = $("#fm3").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                bookTypeParentId: bookTypeId,
                bookTypeName: $("#nl_bookTypeName").val(),
                bookTypeNote: $("#nl_bookTypeNote").val(),
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "新增成功！");
                    $("#dlg3").dialog("close");
                    $("#bookTypeList").datagrid("reload", {total: 0, rows: []});
                    $.fn.zTree.init($("#bookTypeTree"), setting);
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    function openBookTypeModifyDialog() {
        var treeObj = $.fn.zTree.getZTreeObj("bookTypeTree");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length == 0) {
            $.messager.alert("系统提示", "请选择一个节点！");
            return;
        }
        if (bookTypeParentId == null) {
            $.messager.alert("系统提示", "无法修改根节点！");
            return;
        } else {
            $("#dlg2").dialog("open").dialog("center").dialog("setTitle", "修改当前分类");
            $("#u_bookTypeId").textbox("setValue", bookTypeId);
            $("#u_bookTypeName").textbox("setValue", bookTypeName);
            $("#u_bookTypeNote").textbox("setValue", bookTypeNote);
            url = "/booktype/update";

        }
    }


    function saveEditBookType() {
        $.ajax({
            type: "PUT",
            url: url,
            dateType: "json",
            beforeSend: function () {
                var isValid = $("#fm2").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                bookTypeId: $("#u_bookTypeId").textbox("getValue"),
                bookTypeName: $("#u_bookTypeName").textbox("getValue"),
                bookTypeNote: $("#u_bookTypeNote").textbox("getValue")
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "修改成功！");
                    $("#dlg2").dialog("close");
                    $("#bookTypeList").datagrid("reload", {total: 0, rows: []});
                    $.fn.zTree.init($("#bookTypeTree"), setting);

                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    function deleteBookType() {
        var treeObj = $.fn.zTree.getZTreeObj("bookTypeTree");
        var nodes = treeObj.getSelectedNodes();
        if (nodes.length == 0) {
            $.messager.alert("系统提示", "请选择一个节点！");
            return;
        }
        if (bookTypeParentId == null) {
            $.messager.alert("系统提示", "无法删除根节点！");
            return;
        } else {
            $.messager.confirm("系统提示", "您确定要删除该节点吗?", function (r) {
                if (r) {
                    $.ajax({
                        type: "DELETE",
                        url: "/booktype/delete?bookTypeId=" + bookTypeId,
                        success: function (res) {
                            if (res.ret) {
                                $.messager.alert("系统提示", "删除成功！");
                                $("#bookTypeList").datagrid("reload", {total: 0, rows: []});
                                $.fn.zTree.init($("#bookTypeTree"), setting);
                            } else {
                                $.messager.alert("系统提示", "删除失败！");
                            }
                        }
                    });
                }
            });
        }
    }
</script>
</body>
</html>
