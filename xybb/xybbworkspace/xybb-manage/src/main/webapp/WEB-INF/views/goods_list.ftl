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
    <title>图片列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 商品信息列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <form class="text-c" action="${base}/queryGoodsByCondition" method="post"> 日期范围：
        <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" name="startTime" class="input-text Wdate" style="width:120px;" value="${startTime}">
        -
        <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" name="endTime" class="input-text Wdate" style="width:120px;" value="${endTime}">
        <input type="text" name="name" id="name" placeholder=" 商品名称" style="width:250px" class="input-text" value="${name}">
        <button name="btn-search-goods" id="btn-search-goods" class="btn btn-success btn-search-goods" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
        <button name="btn-search-reset" id="btn-search-reset" class="btn btn-default" onclick="btn_search_reset()"><i class="Hui-iconfont">&#xe66b;</i> 重置</button>
    </form>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">
                <th width="40"><input name="" type="checkbox" value=""></th>
                <th width="80">ID</th>
                <th width="80">名称</th>
                <th width="100">描述</th>
                <th width="80">类型</th>
                <th width="80">状态</th>
                <th width="80">原价</th>
                <th width="80">现价</th>
                <th width="80">浏览量</th>
                <th width="80">图片1</th>
                <th width="80">图片2</th>
                <th width="80">图片3</th>
                <th width="150">更新时间</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list goodsList as goods>
            <tr class="text-c">
                <td><input name="" type="checkbox" value=""></td>
                <td>${goods.id}</td>
                <td>${goods.name}</td>
                <td>${goods.detail}</td>
                <td>${goods.goodsType.name}</td>
                <td>
                    <#if goods.status == 1>
                        审核中
                    <#elseif goods.status == 2>
                        审核通过
                    <#elseif goods.status == 3>
                        已经下架
                    </#if>
                </td>
                <td>${goods.originalPrice?string(",##0.00")}</td>
                <td>${goods.price?string(",##0.00")}</td>
                <td>${goods.pageViews}</td>
                <td><img width="40px" height="40px" class="picture-thumb" src="${goods.picture1}"></td>
                <td><img width="40px" height="40px" class="picture-thumb" src="${goods.picture2}"></td>
                <td><img width="40px" height="40px" class="picture-thumb" src="${goods.picture3}"></td>
                <td>${goods.updatetime?string("yyyy-MM-dd HH:mm:ss")}</td>
                <td class="td-manage"><a style="text-decoration:none" onClick="goods_down(this,${goods.id})" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a style="text-decoration:none" class="ml-5" onClick="goods_up('撤销',${goods.id})" href="javascript:;" title="撤销"><i class="Hui-iconfont">&#xe66b;</i></a></td>
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
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
        ]
    });

    function goods_up(obj,id){
        layer.confirm('确认要恢复销售该商品吗？',function(index){
            var data={
                id:id
            }
            $.ajax({
                type: 'POST',
                url: '${base}//goods/adopt',
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

    function goods_down(obj,id){
        layer.confirm('确认要下架该商品吗？',function(index){
            var data={
                id:id
            }
            $.ajax({
                type: 'POST',
                url: '${base}//goods/veto',
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

    function btn_search_reset() {
        $('input[name=startTime]').val("");
        $('input[name=endTime]').val("");
        $('input[name=name]').val("");
        window.location.reload();
    }

</script>
</body>
</html>