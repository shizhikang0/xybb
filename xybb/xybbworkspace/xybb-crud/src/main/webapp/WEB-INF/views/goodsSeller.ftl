<#assign base=request.contextPath />
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <title>Home</title>

    <link rel="shortcut icon" href="${base}/static/favicon/favicon.ico">
    <link href="${base}/static/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="${base}/static/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${base}/static/css/build.css">
    <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${base}/static/css/public.css">
    <link rel="stylesheet" href="${base}/static/css/user.css">
    <style>
        .kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
            margin: 0;
            padding: 0;
            border: none;
            box-shadow: none;
            text-align: center;
        }
        .kv-avatar {
            display: inline-block;
        }
        .kv-avatar .file-input {
            display: table-cell;
            width: 213px;
        }
        .kv-reqd {
            color: red;
            font-family: monospace;
            font-weight: normal;
        }
    </style>

</head>
<body>
<div class="container_12">
    <div class="grid_3">
        <hgroup>
            <h1 id="site_logo" ><a href="${base}/index"><img src="${base}/static/images/logo.png" alt="校园宝贝"/></a></h1>
        </hgroup>
    </div><!-- .grid_3 -->

    <div class="grid_9">
        <nav class="private">
            <ul id="login-state">
                <li><a href="http://localhost:8090/xybb">登录</a></li>
                <li class="separator">|</li>
                <li><a href="http://localhost:8090/xybb/register">注册</a></li>
            </ul>
        </nav><!-- .private -->
    </div>
</div>

<div class="clear"></div>

<div id="main" class="clearfix">
    <div class="user-sider fl">
        <div class="user-info">
            <img id="user-header-sider" src="${base}/static/images/default2.jpg" class="user-header">
            <p class="username">${user.name}</p>
        </div>
        <div class="sider-nav">
            <ul>
                <li><a href="${base}/user/userInfo/${user.id}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;我的信息</a></li>
                <#if user.type == 2>
                    <li><a href="${base}/user/sellGoods/${user.id}"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;&nbsp;我要发布</a></li>
                    <li><a href="${base}/user/onSaleGoods/${user.id}/1" class="active"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span>&nbsp;&nbsp;我发布的</a></li>
                </#if>
                <li><a href="${base}/user/preBuy/${user.id}/1"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;&nbsp;我看上的</a></li>
                <li><a href="${base}/user/allBuy/${user.id}/1"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;我的账单</a></li>
            </ul>
        </div>
    </div>
    <div class="user-main fr">
        <ul>
            <#list pageInfo.list as goodsSeller>
                <li>
                    <div class="list-header">
                        <span>时间：${goodsSeller.updatetime?string("yyyy-MM-dd HH:mm:ss")}</span>
                    </div>
                    <div class="list-main clearfix">
                        <a href="${base}/goodsDetail/${goodsSeller.goods.id}" class="goods-images fl"><img src="${goodsSeller.goods.picture1}" ></a>
                        <div class="good-info fl">
                            <a href="${base}/goodsDetail/${goodsSeller.goods.id}" class="goods-title">${goodsSeller.goods.name}</a>
                            <p class="goods-price">￥<span>${goodsSeller.goods.price?string(",##0.00")}</span></p>
                        </div>
                        <div class="operation fr">
                            <a href="${base}/goodsDetail/${goodsSeller.goods.id}">查看详情</a>
                            <a href="javascript:;" class="delete-sell" onclick="cancelSell('${base}/user/cancelSell','${goodsSeller.goods.id}','${user.id}')">下架商品</a>
                        </div>
                    </div>
                </li>
            </#list>
        </ul>
        <nav aria-label="Page navigation" style="display:inline;">
            <ul class="pagination pagination-lg">
                            <#if pageInfo.pages gt 5 >
                                <#if pageInfo.pageNum lt 4>
                                    <li><a href="${base}/user/onSaleGoods/${user.id}/1">1</a></li>
                                    <li><a href="${base}/user/onSaleGoods/${user.id}/2">2</a></li>
                                    <li><a href="${base}/user/onSaleGoods/${user.id}/3">3</a></li>
                                    <li><a href="${base}/user/onSaleGoods/${user.id}/4">4</a></li>
                                    <li><a href="${base}/user/onSaleGoods/${user.id}/5">5</a></li>
                                    <li>
                                        <a href="${base}/user/onSaleGoods/${user.id}/${pageInfo.nextPage}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </#if>
                                <#if pageInfo.pageNum gte 4>
                                    <li>
                                        <a href="${base}/user/onSaleGoods/${user.id}/${pageInfo.prePage}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <#if (pageInfo.pages - pageInfo.pageNum) gte 2>
                                        <li><a href="${base}/user/onSaleGoods/${user.id}/${pageInfo.pageNum-2}">${pageInfo.pageNum-2}</a></li>
                                        <li><a href="${base}/user/onSaleGoods/${user.id}/${pageInfo.pageNum-1}">${pageInfo.pageNum-1}</a></li>
                                        <li><a href="${base}/user/onSaleGoods/${user.id}/${pageInfo.pageNum}">${pageInfo.pageNum}</a></li>
                                        <li><a href="${base}/user/onSaleGoods/${user.id}/${pageInfo.pageNum+1}">${pageInfo.pageNum+1}</a></li>
                                        <li><a href="${base}/user/onSaleGoods/${user.id}/${pageInfo.pageNum+2}">${pageInfo.pageNum+2}</a></li>
                                        <li>
                                            <a href="${base}/user/onSaleGoods/${user.id}/${pageInfo.nextPage}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </#if>
                                </#if>
                            <#else>
                                <#list 1..pageInfo.pages as pn>
                                    <li><a href="${base}/user/onSaleGoods/${user.id}/${pn}">${pn}</a></li>
                                </#list>
                            </#if>
            </ul>
        </nav>
    </div>
</div>
<script src="${base}/static/js/jquery-2.1.4.min.js"></script>
<script src="${base}/static/js/jquery.cookie.js" ></script>
<script src="${base}/static/bootstrap/js/bootstrap.js"></script>
<script src="${base}/static/layui/layui.all.js"></script>
<script>
    $(function(){
        var head = "${user.head}";
        if(head != ""){
            $("#user-header-sider").attr("src",head);
        }
        var token = $.cookie("TOKEN");
        if(!token){
            return;
        }
        var url = 'http://localhost:8090/xybb/login/token/'+token;
        $.ajax({
            type:'GET',
            url:url,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "jsonp",
            jsonp:"callback",
            success: function (result) {
                if (result) {
                    if (result.status == 1) {
                        var username = result.data.name;
                        var html = "<li><span>欢迎您！" + username + "</span></li><li class=\"separator\">|</li>" + "<li><a href=\"javascript:void(0)\" onclick=\"logout()\">退出</a></li>";
                        $("#login-state").html(html);
                        return;
                    }
                }
            }
        });
    });
    function logout() {
        layer.confirm('您真的要退出吗？', {
                    btn: ['退出', '取消']
                },function () {
                    $.ajax({
                        type:"POST",
                        url:"http://localhost:8090/xybb/logout/token/"+$.cookie("TOKEN"),
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        dataType: "jsonp",
                        success:function (result) {
                            if(result == "1"){
                                window.location.href = "http://localhost:8089/xybb";
                                return;
                            }
                        }
                    });
                },function () {
                    return;
                }
        );
    }

    function cancelSell(url,goodsId,userId) {
        var data={
            goodsId:goodsId,
            userId:userId
        }
        $.ajax({
            type:"POST",
            url:url,
            data:data,
            dataType:'json',
            success: function(result){
                layer.msg(result.msg,{time:1000});
                setTimeout(function () {
                    window.location.reload();
                }, 1000);
            },
            error:function(result) {
                console.log(result.msg);
            },
        });
    }
</script>
</body>
</html>
