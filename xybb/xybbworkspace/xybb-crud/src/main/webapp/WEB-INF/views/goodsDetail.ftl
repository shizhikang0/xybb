<#assign base = request.contextPath />
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
    <link rel="stylesheet" href="${base}/static/css/detail.css">
    <link rel="stylesheet" href="${base}/static/css/public.css">
    <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap.css">
</head>
<body>
    <div class="container_12">
        <div class="grid_3">
            <hgroup>
                <h1 id="site_logo" ><a href="${base}/index"><img src="${base}/static/images/logo.png" alt="校园宝贝"/></a></h1>
            </hgroup>
        </div>

        <div style="float:right;" class="grid_6">
            <ul id="cart_nav">
                <li>
                    <a class="cart_li" href="#">淘宝框</a>
                    <ul class="cart_cont">

                            <#if pre_buy_list?exists>
                                <#list pre_buy_list as item>
                                    <li>
                                        <a href="${base}/goodsDetail/${item.id}" class="prev_cart">
                                            <div class="cart_vert"><img src="${item.picture1}"/></div>
                                        </a>
                                        <div class="cont_cart">
                                            <h4>${item.name}</h4>
                                            <div class="price">${item.price}</div>
                                        </div>
                                        <a title="close" class="close" href="javascript:void(0);" linkadd="${base}/goods/cancelPreBuy/${item.id}" onclick="cancelPreBuy(this)"></a>
                                        <div class="clear"></div>
                                    </li>
                                </#list>
                                <li class="no_border">
                                    <a href="${base}/user/preBuy/${user.id}/1" class="view_cart">查看详情</a>
                                    <a href="javascript:void(0);" title="${base}/goods/cancelPreBuyAll/${user.id}" class="checkout" onclick="preBuyAll(this)">一键清空</a>
                                </li>
                            <#else>
                                <li class="no_border"><p>亲，您还没有登录呢！</p></li>
                            </#if>
                    </ul>
                </li>
            </ul>

            <nav class="private">
                <ul id="login-state">
                    <li><a href="http://localhost:8090/xybb">登录</a></li>
                    <li class="separator">|</li>
                    <li><a href="http://localhost:8090/xybb/register">注册</a></li>
                </ul>
            </nav><!-- .private -->
        </div><!-- .grid_6 -->
    </div><!-- .container_12 -->

    <div class="clear"></div>

    <div class="container_12">
        <div class="grid_12">
            <div id="block_nav_primary">
                <ul class="layui-nav layui-bg-blue" lay-filter="">
                    <li class="layui-nav-item"><a href="${base}/index">首页</a></li>
                        <#list goodsTypeList as goodsType>
                            <li class="layui-nav-item">
                                <a href="${base}/goods/${goodsType.id}/1">${goodsType.name}</a>
                            </li>
                        </#list>
                </ul>
            </div><!-- .block_nav_primary -->
        </div>
    </div>
    <div class="clear"></div>

    <div id="main" class="clearfix">
        <div class="detail fl clearfix">

            <div class="title">
                <!-- <h2>商品标题商品标题</h2> -->
                <span class="publish-time fl">发布时间：${goods.updatetime?string("yyyy-MM-dd HH:mm:ss")}</span>
                <span class="view-number fl">浏览量：${goods.pageViews}</span>
            </div>
            <div id="MagnifierWrap2" class="fl">
                <div class="MagnifierMain">
                    <img class="MagTargetImg" src="${goods.picture1}">
                </div>
                <div class="spec-items">
                    <ul>

                        <li><img src="${goods.picture1}"></li>

                        <li><img src="${goods.picture2}"></li>

                        <li><img src="${goods.picture3}"></li>

                    </ul>
                    <hr style="width:350px;size: 1px;margin-top: 50px">
                </div>
            </div>
            <div class="good-info fr">
                <h2>${goods.name}</h2>
                <div class="info-line">
                    <span class="param-name">价格</span>
                    <span class="param-value good-price">￥${goods.price?string(",##0.00")}</span>
                </div>
                <div class="info-line">
                    <span class="param-name">原价</span>
                    <span class="param-value good-old-price">￥${goods.originalPrice?string(",##0.00")}</span>

                </div>

                <div class="info-line">
                    <span class="param-name">卖家</span>
                    <span class="param-value">${goods.goodsSeller.seller.name}</span>
                </div>
                <div class="info-line">
                    <span class="param-name">联系方式</span>
                    <span class="param-value">${goods.goodsSeller.seller.phone}</span>
                </div>
                <div class="info-line btns">
                    <button title="${base}/goods/${goods.id}/preBuy.do" class="btn btn-info" onclick="preBuy(this)">放入购物车</button>
                </div>
            </div>
            <div class="good-description">
                <div class="description-title"><span>宝贝详情</span></div>
                <div class="description-body">
                    <p>
                       ${goods.detail}
                    </p>
                </div>
            </div>
        </div>
        <div class="detail-sidebar fr">
            <div class="sidebar-header">猜你喜欢</div>
            <ul class="sidebar-list">
                <#list commonList as cgoods>
                    <li>
                        <a href="${base}/goodsDetail/${cgoods.id}" class="sidebar clearfix" style="text-decoration:none;background-color: #1e9fff0d;">
                            <img class="sidebar-image fl" src="${cgoods.picture1}">
                            <p class="sidebar-title">${cgoods.detail}</p>
                            <p class="sidebar-price">￥${cgoods.price}</p>
                        </a>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
    <script src="${base}/static/js/jquery-2.1.4.min.js" ></script>
    <script src="${base}/static/js/jquery.cookie.js" ></script>
    <script src="${base}/static/bootstrap/js/bootstrap.js"></script>
    <script src="${base}/static/js/html5.js" ></script>
    <script src="${base}/static/js/jflow.plus.js" ></script>
    <script src="${base}/static/js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="${base}/static/layui/layui.all.js"></script>
    <script src="${base}/static/js/common.js"></script>
    <script src="${base}/static/js/detail.js"></script>
    <script src="${base}/static/js/MagnifierF.js"></script>
    <script>
        $(function(){
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
                            var html = "<li><span>欢迎您！" + username + "</span></li><li class=\"separator\">&nbsp;&nbsp;</li><li><a href=\"${base}/user/userInfo/"+result.data.id+"\">个人中心" + "</a></li><li class=\"separator\">|</li>" + "<li><a href=\"javascript:void(0)\" onclick=\"logout()\">退出</a></li>";
                            $("#login-state").html(html);
                            return;
                        }
                    }
                }
            });
        });
        function preBuy(that){
            var url = $(that).attr('title');
            $.ajax({
                type:"GET",
                url:url,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success:function (data) {
                    if(data.status == "1"){
                        layer.msg(data.msg,{time:1000});
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    }else {
                        layer.msg("您还没有登录呢！");
                    }
                },
                error:function (data) {
                    if(data == "login"){
                        layer.msg("您还未登录！");
                    }
                }
            });
        }
        function cancelPreBuy(that) {
            var url = $(that).attr("linkadd");
            $.ajax({
                type:"POST",
                url:url,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success:function(data){
                    layer.msg(data.msg,{time:1000});
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                },
                error:function () {
                    alert("取消失败");
                }
            });
        }
        function preBuyAll(that) {
            var url = $(that).attr("title");
            $.ajax({
                type:"POST",
                url:url,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success:function (data) {
                    if(data){
                        if(data.status == "1"){
                            layer.msg(data.msg,{time:1000});
                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);
                        }
                    }
                }
            });
        }
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
    </script>
</body>
</html>