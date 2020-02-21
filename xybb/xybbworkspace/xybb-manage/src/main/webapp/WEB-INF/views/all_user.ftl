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
    <title>卖家申请列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 卖家申请列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="80">ID</th>
                <th width="80">用户名</th>
                <th width="80">性别</th>
                <th width="80">手机号</th>
                <th width="80">地址</th>
                <th width="80">头像</th>
                <th width="120">个性签名</th>
                <th width="100">用户类型</th>
                <th width="80">操作</th>
            </tr>
            </thead>
            <tbody>
                <#list userList as user>
                <tr class="text-c">
                    <td><input type="checkbox" value="" name=""></td>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.sex}</td>
                    <td>${user.phone}</td>
                    <td>${user.address}</td>
                    <td><img width="40px" height="40px" class="picture-thumb" src="${user.head}"></td>
                    <td>${user.autograph}</td>
                    <td>
                        <#if user.type == 1>
                            买家身份
                            <#elseif user.type == 2>
                            卖家身份
                            <#elseif user.type == 3>
                            卖家身份申请中
                        <#elseif user.type == 5>
                            用户账号已冻结
                        </#if>
                    </td>
                    <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5" onClick="user_edit('编辑','${base}/editUser?id=${user.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" href="javascript:;" onClick="user_active(this,${user.id})" title="激活"><i class="Hui-iconfont">&#xe66b;</i></a><a style="text-decoration:none" class="ml-5" onClick="user_del(this,${user.id})" href="javascript:;" title="冻结"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
                </#list>
            </tbody>
        </table>
    </div>
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
    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "pading":false,
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,8]}// 不参与排序的列
        ]
    });

    function user_edit(title,url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    
    function user_del(obj,id){
        layer.confirm('确认要冻结吗？',function(index){
            var data={
                id:id
            }
            $.ajax({
                type: 'POST',
                url: '${base}/deleteUser',
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

    function user_active(obj,id){
        layer.confirm('确认要激活吗？',function(index){
            var data={
                id:id
            }
            $.ajax({
                type: 'POST',
                url: '${base}/activeUser',
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

</script>
</body>
</html>