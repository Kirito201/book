<%--
  Created by IntelliJ IDEA.
  User: luhailiang
  Date: 2019-03-28
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/loading.jsp" %>
<html>
<head>
    <title>MYLIBRARY-角色管理</title>
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
        角色管理
        <small>角色管理</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>系统管理</a></li>
        <li class="active">角色管理</li>
    </ol>
</section>

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info" style="margin-bottom: 2px">


                <div class="easyui-accordion" style="width:100%">
                    <div title="按条件查询:" data-options="iconCls:'icon-search'" style="overflow:auto;padding:10px">
                        角色名:&nbsp;<input type="text" id="s_roleName" size="20"
                                         onkeydown="if(event.keyCode==13) searchRole()"/>

                        <a href="javascript:searchRole()" class="easyui-linkbutton" iconCls="icon-search"
                           plain="true">搜索</a>
                        <a href="javascript:resetSearchValue()" class="easyui-linkbutton" iconCls="icon-undo"
                           plain="true">重置</a>
                        </fieldset>
                    </div>
                </div>
            </div>


            <table id="dg" title="角色列表" iconCls="icon-man" class="easyui-datagrid" width="100%"
                   url="/role/list"
                   toolbar="#tb" pagination="true"
                   rownumbers="true" fitColumns="true" singleSelect="false">
                <thead>
                <%--<th field="userId" width="10" align="center">编号</th>--%>
                <th field="ck" checkbox="true"></th>
                <th field="roleName" width="55" align="center">角色名</th>
                <th field="roleCreateTime" width="55" align="center">创建时间</th>
                <th field="roleLastModifyTime" width="55" align="center">更新时间</th>
                <th field="aa" width="55" align="center" formatter="formatOperate">操作</th>
                </thead>
            </table>

            <div id="tb">
                <div>
                    <a href="javascript:openRoleAddDialog()" class="easyui-linkbutton" iconCls="icon-add"
                       plain="true">添加</a>
                    <a href="javascript:openRoleModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"
                       plain="true">修改</a>
                    <a href="javascript:deleteRole()" class="easyui-linkbutton" iconCls="icon-remove"
                       plain="true">删除</a>
                </div>
            </div>

            <div id="dlg" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
                <form id="fm" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="roleName" id="n_roleName" class="easyui-textbox" required="true" label="角色名:"
                               style="width:100%">
                    </div>
                </form>
            </div>
            <div id="dlg-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveRole()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
            </div>

            <div id="dlg1" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg1-buttons'">
                <form id="fm1" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="roleName" id="u_roleName" class="easyui-textbox" required="true" label="角色名:"
                               style="width:100%">
                    </div>
                </form>
            </div>
            <div id="dlg1-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateRole()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg1').dialog('close')" style="width:90px">取消</a>
            </div>

            <div id="dlg2" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg2-buttons'">
                <!--隐藏域角色Id-->
                <input type="hidden" id="roleId" name="roleId"/>
                <ul id="permissionTree" class="ztree"></ul>

            </div>
            <div id="dlg2-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok"
                   onclick="savePermissionSet()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg2').dialog('close')" style="width:90px">取消</a>
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
<!-- layer -->
<script src="/static/bower_components/layer-v3.1.1/layer/layer.js"></script>
<!-- jquery easyui -->
<script src="/static/bower_components/jquery-easyui/jquery.easyui.min.js"></script>
<script src="/static/bower_components/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- ztree -->
<script src="/static/bower_components/ztree/jquery.ztree.all-3.5.min.js"></script>
<script src="/static/js/loading.js"></script>

<script>
    if ($.fn.datagrid) {
        $.fn.datagrid.defaults.pageSize = 5;//这里一定要用datagrid.defaults.pageSize
        $.fn.datagrid.defaults.pageList = [5];//这里一定要有，不然上面的也不起效
    }

    function formatOperate(value, row) {
        return "<button onclick='openPermissionChooseDialog(" + row.roleId + ")' class='btn-success'>分配权限</button> ";
    }


    function resetSearchValue() {
        $("#s_roleName").val("");
        searchRole();
    }

    function searchRole() {
        $("#dg").datagrid("load", {
            "roleName": $("#s_roleName").val()
        })
    }


    var url;

    function openRoleAddDialog() {
        $("#dlg").dialog("open").dialog("center").dialog("setTitle", "新增角色信息");
        $("#fm").form("clear");
        url = "/role/save";
    }

    function saveRole() {
        $.ajax({
            type: "POST",
            url: url,
            dateType: "json",
            beforeSend: function () {
                var isValid = $("#fm").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                roleName: $("#n_roleName").val(),
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

    function openRoleModifyDialog() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要修改的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg1").dialog("open").dialog("center").dialog("setTitle", "修改角色信息");
        $("#fm1").form("load", row);
        url = "/role/update?roleId=" + row.roleId;
    }

    function updateRole() {
        $.ajax({
            type: "PUT",
            url: url,
            dateType: "json",
            beforeSend: function () {
                var isValid = $("#fm1").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                roleName: $("#u_roleName").val()
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "修改成功！");
                    $("#dlg1").dialog("close");
                    $("#dg").datagrid("reload");

                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    function deleteRole() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要删除的数据！");
            return;
        }
        var roleId = selectedRows[0].roleId;
        $.messager.confirm("系统提示", "您确定要删除这条数据吗?", function (r) {
            if (r) {
                $.ajax({
                    type: "DELETE",
                    url: "/role/delete?roleId=" + roleId,
                    success: function (res) {
                        if (res.ret) {
                            $.messager.alert("系统提示", "删除成功！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert("系统提示", res.msg);
                        }
                    }
                });
            }
        });
    }

    $(document).ready(function () {

        $("#dg").datagrid({
            onDblClickRow: function (index, row) {
                $("#dlg1").dialog("open").dialog("setTitle", "修改角色信息");
                $("#fm1").form("load", row);
                url = "/role/update?roleId=" + row.roleId;
            }
        });

    });


    function openPermissionChooseDialog(roleId) {
        $("#roleId").val(roleId);
        $("#dlg2").dialog("open").dialog("center").dialog("setTitle", "选择权限");
        var setting = {
            check: {
                enable: true
            },
            async: {
                enable: true,
                url: "/permission/loadRolePermissionData?roleId=" + roleId,
                // autoParam:["id=permissionId", "name=permissionName", "level=lv"]
            },
            data: {
                key: {
                    name: "permissionName"
                }
            },
            view: {
                selectedMulti: false,
                addDiyDom: function (treeId, treeNode) {
                    var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
                    if (treeNode.permissionIcon) {
                        icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.permissionIcon).css("background", "");
                    }

                }
            }
        };

        $.fn.zTree.init($("#permissionTree"), setting);

    }

    function savePermissionSet() {
        var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
        var nodes = treeObj.getCheckedNodes(true);
        if (nodes.length == 0) {
            $.messager.alert("系统提示", "请选择需要分配的权限信息！");
        } else {
            var roleId = $("#roleId").val();
            var strPermissionIds = [];
            for (var i = 0; i < nodes.length; i++) {
                strPermissionIds.push(nodes[i].permissionId);
            }
            var permissionIds = strPermissionIds.join(",");
            // console.log(roleId);
            // console.log(permissionIds);
            $.post("/role/savePermissionSet", {permissionIds: permissionIds, roleId: roleId}, function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "设置成功！");
                    $("#dlg2").dialog("close");
                } else {
                    $.messager.alert("系统提示", "设置失败，请联系管理员");
                }
            }, "json");
        }
    }
</script>
</body>
</html>
