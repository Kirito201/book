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
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <link rel="shortcut icon" href="/static/favicon.ico"/>
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/metro/easyui.css">
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/icon.css">
    <link rel="stylesheet" href="/static/bower_components/jquery-easyui/themes/color.css">

    <link href='http://fonts.font.im/css?family=Source+Sans+Pro:400,300,600,700,300italic,400italic,600italic'
          rel='stylesheet' type='text/css'>
    <style>
        .datagrid-header-row, .datagrid-row {
            height: 50px;
        }

        body {
            font-family: verdana, helvetica, arial, sans-serif;
        }

    </style>
</head>
<body>
<div id='loadingDiv' style="position: absolute; z-index: 1000; top: 0px; left: 0px;
width: 100%; height: 100%; background: white; text-align: center;">

    <img src="/static/bower_components/jquery-easyui/themes/metro/images/loading.gif"
         style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;margin: auto;width:25px;height:25px;"/>

</div>

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
            <div class="box box-primary" style="margin-bottom: 2px">


                <div class="easyui-accordion" style="width:100%">
                    <div title="按条件查询:" data-options="iconCls:'icon-search'" style="overflow:auto;padding:10px">
                        用户名:&nbsp;<input type="text" id="s_userName" size="20"
                                         onkeydown="if(event.keyCode==13) searchUser()"/>
                        邮箱:&nbsp;<input type="text" id="s_userEmail" size="20"
                                        onkeydown="if(event.keyCode==13) searchUser()"/>
                        手机号:&nbsp;<input type="text" id="s_userPhone" size="20"
                                         onkeydown="if(event.keyCode==13) searchUser()"/>

                        <a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search"
                           plain="true">搜索</a>
                        <a href="javascript:resetSearchValue()" class="easyui-linkbutton" iconCls="icon-undo"
                           plain="true">重置</a>
                        </fieldset>
                    </div>
                </div>
            </div>


            <table id="dg" title="用户列表" iconCls="icon-man" class="easyui-datagrid" width="100%"
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
            </div>

            <div id="dlg" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
                <form id="fm" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="userName" id="n_userName" class="easyui-textbox" required="true"
                               validType="userName" label="用户名:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input type="password" id="n_userPassword" name="userPassword" class="easyui-textbox"
                               required="true" validType="length[6,15]" label="密码:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input type="password" name="reUserPassword" class="easyui-textbox" required="true"
                               validType="equalTo['#n_userPassword']" invalidMessage="两次输入密码不匹配" label="确认密码:"
                               style="width:100%">
                    </div>

                    <div style="margin-bottom:10px">
                        <input name="userEmail" id="n_userEmail" class="easyui-textbox" required="true"
                               validType="email" label="邮箱:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="userPhone" id="n_userPhone" class="easyui-textbox" required="true"
                               validType="phone" label="手机号:"
                               style="width:100%">
                    </div>

                </form>
            </div>
            <div id="dlg-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
            </div>

            <div id="dlg1" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#dlg1-buttons'">
                <form id="fm1" novalidate style="margin:0;padding:20px 50px">
                    <div style="margin-bottom:10px">
                        <input name="userName" id="u_userName" class="easyui-textbox" required="true"
                               validType="userName" label="用户名:"
                               style="width:100%">
                    </div>

                    <div style="margin-bottom:10px">
                        <input name="userEmail" id="u_userEmail" class="easyui-textbox" required="true"
                               validType="email" label="邮箱:"
                               style="width:100%">
                    </div>
                    <div style="margin-bottom:10px">
                        <input name="userPhone" id="u_userPhone" class="easyui-textbox" required="true"
                               validType="phone" label="手机号:"
                               style="width:100%">
                    </div>

                </form>
            </div>
            <div id="dlg1-buttons">
                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateUser()"
                   style="width:90px">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                   onclick="javascript:$('#dlg1').dialog('close')" style="width:90px">取消</a>
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
        $.fn.datagrid.defaults.pageList = [5];//这里一定要有，不然上面的也不起效
    }

    $.extend($.fn.validatebox.defaults.rules, {
        /*必须和某个字段相等*/
        equalTo: {
            validator: function (value, param) {
                return $(param[0]).val() == value;
            }, message: '字段不匹配'
        },
        phone: {
            validator: function (value) {
                var reg = /^1[3-8]+\d{9}$/;
                return reg.test(value);
            },
            message: '请输入正确的手机号'
        },
        userName: {// 验证用户名
            validator: function (value) {
                return /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/i.test(value);
            },
            message: '用户名不合法（字母开头，允许5-16位，允许字母数字下划线'

        },
    });

    function closeLoading() {
        $("#loadingDiv").fadeOut("normal", function () {
            $(this).remove();
        });
    }

    var no;
    $.parser.onComplete = function () {
        if (no) clearTimeout(no);
        no = setTimeout(closeLoading, 1000);
    }


    function formatUserState(value, row) {
        if (row.userState == 1) {
            return "<button class='btn-success' disabled>正常</button>";
        } else {
            return "<button  class='btn-warning' disabled>禁用</button>";
        }
    }

    function formatOperate(value, row) {
        return "<button onclick='enableUser(" + row.userId + ")' class='btn-success'>启用</button> <button onclick='disableUser(" + row.userId + ")' class='btn-warning'>禁用</button> <button onclick=\"resetUserPassword('" + row.userId + "','" + row.userEmail + "')\" class='btn-danger'>重置密码</button> ";
    }

    function enableUser(userId) {
        $.messager.confirm("系统提示", "您确定要启用该用户吗?", function (r) {
            if (r) {
                $.ajax({
                    type: "POST",
                    url: "/user/enable",
                    data: {
                        userId: userId
                    },
                    headers: {"token": $.cookie("token")},
                    success: function (res) {
                        if (res.ret) {
                            $.messager.alert("系统提示", "启用成功！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert("系统提示", res.msg);
                        }
                    }
                });
            }
        });
    }

    function disableUser(userId) {
        $.messager.confirm("系统提示", "您确定要停用该用户吗?", function (r) {
            if (r) {
                $.ajax({
                    type: "POST",
                    url: "/user/disable",
                    data: {
                        userId: userId
                    },
                    headers: {"token": $.cookie("token")},
                    success: function (res) {
                        if (res.ret) {
                            $.messager.alert("系统提示", "停用成功！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert("系统提示", res.msg);
                        }
                    }
                });
            }
        });
    }

    function showLoadLayer() {
        layer.msg('拼命加载中...', {icon: 16, shade: [0.5, '#f5f5f5'], scrollbar: false, offset: '5px'});
    }

    function closeLoadLayer(index) {
        layer.close(index);
    }

    function resetUserPassword(userId, userEmail) {
        var index=null;
        $.messager.confirm("系统提示", "您确定重置密码吗?", function (r) {
            if (r) {
                $.ajax({
                    type: "POST",
                    url: "/user/sendMail",
                    data: {
                        userId: userId,
                        toMail: userEmail
                    },
                    headers: {"token": $.cookie("token")},
                    beforeSend: function () {
                        index = showLoadLayer()
                    },
                    success: function (res) {
                        closeLoadLayer(index);
                        if (res.ret) {
                            $.messager.alert("系统提示", "重置成功！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert("系统提示", res.msg);
                        }
                    }
                });
            }
        });
    }


    function searchUser() {
        $("#dg").datagrid("load", {
            "userName": $("#s_userName").val(),
            "userEmail": $("#s_userEmail").val(),
            "userPhone": $("#s_userPhone").val()
        })
    }

    function resetSearchValue() {
        $("#s_userName").val("");
        $("#s_userEmail").val("");
        $("#s_userPhone").val("");
        searchUser();
    }

    var url;

    function openUserAddDialog() {
        $("#dlg").dialog("open").dialog("center").dialog("setTitle", "新增用户");
        $("#fm").form("clear");
        url = "/user/save";
    }

    function saveUser() {
        $.ajax({
            type: "POST",
            url: url,
            dateType: "json",
            headers: {"token": $.cookie("token")},
            beforeSend: function () {
                var isValid = $("#fm").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                userName: $("#n_userName").val(),
                userPassword: $("#n_userPassword").val(),
                userEmail: $("#n_userEmail").val(),
                userPhone: $("#n_userPhone").val()
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "保存成功！");
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });

    }

    function openUserModifyDialog() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要修改的数据！");
            return;
        }
        var row = selectedRows[0];
        $("#dlg1").dialog("open").dialog("setTitle", "修改用户信息");
        $("#fm1").form("load", row);
        url = "/user/update?userId=" + row.userId;
    }

    function updateUser() {
        $.ajax({
            type: "PUT",
            url: url,
            dateType: "json",
            headers: {"token": $.cookie("token")},
            beforeSend: function () {
                var isValid = $("#fm1").form("validate");
                return isValid; // 返回false终止表单提交
            },
            data: {
                userName: $("#u_userName").val(),
                userEmail: $("#u_userEmail").val(),
                userPhone: $("#u_userPhone").val()
            },
            success: function (res) {
                if (res.ret) {
                    $.messager.alert("系统提示", "保存成功！");
                    $("#dlg1").dialog("close");
                    $("#dg").datagrid("reload");
                } else {
                    $.messager.alert("系统提示", res.msg);
                }
            }
        });
    }

    function deleteUser() {
        var selectedRows = $("#dg").datagrid("getSelections");
        if (selectedRows.length != 1) {
            $.messager.alert("系统提示", "请选择一条要删除的数据！");
            return;
        }
        var userId = selectedRows[0].userId;
        $.messager.confirm("系统提示", "您确定要删除这条数据吗?", function (r) {
            if (r) {
                $.ajax({
                    type: "DELETE",
                    url: "/user/delete?userId=" + userId,
                    headers: {"token": $.cookie("token")},
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


</script>
</body>
</html>
