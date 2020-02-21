<#assign base=request.contextPath />
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${base}/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${base}/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${base}/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${base}/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${base}/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${base}/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${base}/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="${base}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="admin_add('添加管理员','${base}/a/addAdmin','500','400')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a></span> <span class="r">共有：<strong>${total}</strong> 名管理员</span> </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">员工列表</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="40">ID</th>
            <th width="80">用户名</th>
            <th width="80">手机</th>
            <th width="120">备注</th>
            <th width="130">加入时间</th>
            <th width="100">是否已启用</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list adminList as admin>
        <tr class="text-c">
            <td><input type="checkbox" value="${admin.id}" name="checkedAdminId"></td>
            <td>${admin.id}</td>
            <td>${admin.name}</td>
            <td>${admin.phone}</td>
            <td>${admin.autograph}</td>
            <td>${admin.createtime?string("yyyy-MM-dd HH:mm:ss")}</td>
            <td class="td-status">
                    <#if admin.type == 4>
                        <span class="label label-success radius">已启用</span>
                    <#elseif admin.type == 6>
                        <span class="label radius">已停用</span>
                    </#if>
            </td>
            <td class="td-manage">
                    <#if admin.type == 4>
                        <a style="text-decoration:none" onClick="admin_stop(this,${admin.id})" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
                    <#elseif admin.type == 6>
                        <a style="text-decoration:none" onClick="admin_start(this,${admin.id})" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a>
                    </#if>
                <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','${base}/a/adminEdit','${admin.id}','500','400')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                <a title="删除" href="javascript:;" onclick="admin_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
            </td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${base}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${base}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${base}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${base}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${base}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${base}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    /*管理员-增加*/
    function admin_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-删除*/
    function admin_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            var data={
                id:id
            }
            $.ajax({
                type:"POST",
                url:"${base}/a/delete",
                data:data,
                dataType: 'json',
                success: function(data){
                    layer.msg(data.msg,{time:1000});
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*管理员-编辑*/
    function admin_edit(title,url,id,w,h){
        layer_show(title,url+"?id="+id,w,h);
    }
    /*管理员-停用*/
    function admin_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            var data={
                id:id
            }
            $.ajax({
                type:"POST",
                url:"${base}/a/stop",
                data:data,
                dataType: 'json',
                success: function(data){
                    layer.msg(data.msg,{time:1000});
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*管理员-启用*/
    function admin_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            var data={
                id:id
            }
            $.ajax({
                type:"POST",
                url:"${base}/a/active",
                data:data,
                dataType: 'json',
                success: function(data){
                    layer.msg(data.msg,{time:1000});
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }
    
    function datadel() {
        var bb = "";
        var temp = "";
        var a = document.getElementsByName("checkedAdminId");
        for ( var i = 0; i < a.length; i++) {
            if (i==0 && a[i].checked) {
                temp = a[i].value;
                bb = temp
            }else if(a[i].checked){
                temp = a[i].value;
                bb = bb + "," + temp
            }
        }
        var data={
            ids:bb
        };
        $.ajax({
            type:"POST",
            url:"${base}/a/deleteCheckedAdmins",
            data:data,
            dataType: 'json',
            success: function(data){
                layer.msg(data.msg,{time:1000});
                setTimeout(function () {
                    window.location.reload();
                }, 1000);
            },
            error:function(data) {
                console.log(data.msg);
            },
        });
    }
</script>
</body>
</html>