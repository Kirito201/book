<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-04-10
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/loading.jsp" %>
<html>
<head>
    <title>MYLIBRARY-应用管理</title>
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
        应用管理
        <small>应用管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>系统管理</a></li>
        <li class="active">应用管理</li>
    </ol>
</section>

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info" style="margin-bottom: 2px">

                <table id="permissionList" class="easyui-treegrid" width="100%"
                       data-options="url:'/permission/list',idField:'permissionId',
                       treeField:'permissionName',fitColumns:true,singleSelect:false,
                       rownumbers:true">
                    <thead>

                    <th field="ck" checkbox="true"></th>
                    <th field="permissionName" width="250" align="center">应用名称</th>
                    <th field="permissionUrl" width="250" align="center">应用URL</th>
                    <th field="icon" width="250" align="center" formatter="formatPermissionIcon">应用图标</th>
                    <th field="permissionCreateTime" width="250" align="center">创建时间</th>
                    <th field="permissionLastModifyTime" width="250" align="center">更新时间</th>

                    </thead>
                </table>

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
    function formatPermissionIcon(value, row) {
        return "<i class='" + row.permissionIcon + "'></i>"
    }
</script>
</body>
</html>
