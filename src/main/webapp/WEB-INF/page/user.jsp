<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-03-16
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/dist/css/skins/skin-blue.min.css">

    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/icon.css">
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/color.css">
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/demo/demo.css">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        用户管理
        <small>用户管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>用户管理</a></li>
        <li class="active">用户管理</li>
    </ol>
</section>

<!-- Main content -->
<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">

                <table id="dg" title="用户列表" class="easyui-datagrid"
                       url="/user/list"
                       toolbar="#tb" pagination="true"
                       rownumbers="true" fitColumns="true" singleSelect="true">
                    <thead>
                    <%--<th field="userId" width="10" align="center">编号</th>--%>
                    <th field="ck" checkbox="true"></th>
                    <th field="userName" width="30" align="center">用户名</th>
                    <th field="userEmail" width="60" align="center">邮箱</th>
                    <th field="userPhone" width="40" align="center">手机号</th>
                    <th field="userState" width="20" align="center" formatter="formatUserState">状态</th>
                    <th field="userCreateTime" width="52" align="center">创建时间</th>
                    <th field="userLastModifyTime" width="52" align="center">更新时间</th>
                    <th field="aa" width="50" align="center" formatter="formatOperate">操作</th>
                    </thead>
                </table>

                <div id="tb">
                    <div>
                        <a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add"
                           plain="true">添加</a>
                        <a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"
                           plain="true">修改</a>
                        <a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove"
                           plain="true">删除</a>
                    </div>
                    <div>
                        &nbsp;用户名：&nbsp;<input type="text" id="s_userName" size="20"
                                               onkeydown="if(event.keyCode==13) searchUser()"/>
                        <a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- /.content -->

<!-- jQuery 3 -->
<script src="/static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/dist/js/adminlte.min.js"></script>
<!-- layer -->
<script src="/static/bower_components/layer-v3.1.1/layer/layer.js"></script>
<!-- jquery-cookie -->
<script src="/static/bower_components/jquery-cookie/jquery.cookie.js"></script>
<!-- jquery easyui -->
<script src="/static/bower_components/jquery-easyui/jquery.easyui.min.js"></script>
<script src="/static/bower_components/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>

<script>
    if ($.fn.datagrid) {
        $.fn.datagrid.defaults.pageSize = 5;//这里一定要用datagrid.defaults.pageSize
        $.fn.datagrid.defaults.pageList = [5, 10, 15, 20];//这里一定要有，不然上面的也不起效
    }

    function formatUserState(value, row) {
        if (row.userState == 1) {
            return "<span class='label label-success'>启用</span>";
        } else {
            return "<span class='label label-warning'>停用</span>";
        }
    }

    function formatOperate(value, row) {
        return "<button onclick='enableUser(" + row.userId + ")' class='btn-success'>启用</button> <button onclick='disableUser(" + row.userId + ")' class='btn-warning'>停用</button> <button onclick=\"resetUserPassword('" + row.userId + "','" + row.userEmail + "')\" class='btn-danger'>重置密码</button> ";
    }

    function enableUser(userId) {
        alert(userId);
        //TODO
    }

    function disableUser(userId) {
        alert(userId);
        //TODO
    }

    function resetUserPassword(userId, userEmail) {
        alert(userId + "---" + userEmail);
        //TODO
    }


    function searchUser() {
        $("#dg").datagrid("load", {
            "userName": $("#s_userName").val()
        })
    }

    function openUserAddDialog() {
        alert(1);
        //TODO
    }

    function openUserModifyDialog() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要修改的数据！");
            return;
        } else {
            alert(selectedRows[0].userId)
        }
        //TODO
    }

    function deleteUser() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要删除的数据！");
            return;
        } else {
            alert(selectedRows[0].userId)
        }
        //TODO

    }


</script>
</body>
</html>
