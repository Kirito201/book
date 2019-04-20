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
    <title>MYLIBRARY-借还记录</title>
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
        借还记录
        <small>借还记录</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>借阅者</a></li>
        <li class="active">借还记录</li>
    </ol>
</section>

<section class="content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info" style="margin-bottom: 2px">


                <div class="easyui-accordion" style="width:100%">
                    <div title="借阅者信息:" data-options="iconCls:'icon-search'" style="overflow:auto;padding:10px">
                        <div class="box-body">
                            <strong>借阅者编号</strong>
                            <p class="text-muted">${user.userId}</p>
                            <hr>
                            <strong>姓名</strong>
                            <p class="text-muted">${user.userTrueName}</p>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>


            <table id="dg" title="借还记录列表" iconCls="icon-more" class="easyui-datagrid" width="100%"
                   url="/book/lendreturnrecord"
                   pagination="true"
                   fitColumns="true" rownumbers="true">
                <thead>
                <th field="bookNames" width="300" align="center">书名</th>
                <th field="lendDate" width="200" align="center">借出日期</th>
                <th field="shouldReturnDate" width=200" align="center">应还日期</th>
                <th field="ReturnDate" width="200" align="center" formatter="formatReturnDate">归还日期</th>
                <th field="DamageDegree" width="200" align="center" formatter="formatDamageDegree">损毁程度</th>
                <th field="ExtendedDays" width="200" align="center" formatter="formatExtendedDays">超期天数</th>

                </thead>
            </table>


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

    if ($.fn.datagrid) {
        $.fn.datagrid.defaults.pageSize = 5;//这里一定要用datagrid.defaults.pageSize
        $.fn.datagrid.defaults.pageList = [5];//这里一定要有，不然上面的也不起效
    }

    function formatReturnDate(value, row) {
        if (row.returnDate == null || row.returnDate == "") {
            return "<button class='btn-warning' disabled>未归还</button>";
        } else {
            return "<button class='btn-info' disabled>" + row.returnDate + "</button>";
        }
    }

    function formatDamageDegree(value, row) {
        if (row.damageDegree == "" || row.damageDegree == null) {
            return "<button class='btn-success' disabled>未损毁</button>";
        } else {
            return "<button class='btn-danger' disabled>" + row.damageDegree + "</button>";
        }
    }

    function formatExtendedDays(value, row) {
        if (row.extendedDays < 0) {
            return "<button class='btn-info' disabled>未超期</button>";
        } else {
            return "<button class='btn-danger' disabled>已超期" + row.extendedDays + "天</button>";
        }
    }

    $(function () {
        $('#dg').datagrid({
            onLoadSuccess: function (data) {
                if (data.total == 0) {
                    //添加一个新数据行，第一列的值为你需要的提示信息，然后将其他列合并到第一列来，注意修改colspan参数为你columns配置的总列数
                    $(this).datagrid('appendRow', {bookNames: '<div style="text-align:center;color:red">没有相关记录！</div>'}).datagrid('mergeCells', {
                        index: 0,
                        field: 'bookNames',
                        colspan: 6
                    })
                    //隐藏分页导航条，这个需要熟悉datagrid的html结构，直接用jquery操作DOM对象，easyui datagrid没有提供相关方法隐藏导航条
                    $(this).closest('div.datagrid-wrap').find('div.datagrid-pager').hide();
                }
                    //如果通过调用reload方法重新加载数据有数据时显示出分页导航容器
                else $(this).closest('div.datagrid-wrap').find('div.datagrid-pager').show();
            },
        });
    });

</script>
</body>
</html>
