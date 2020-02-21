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
    <link href="${base}/static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css">
</head>
    <body>
        <div class="container_12">
        <div class="grid_3">
        <hgroup>
          <h1 id="site_logo" ><a href="${base}/index"><img src="${base}/static/images/logo.png" alt="校园宝贝"/></a></h1>
        </hgroup>
        </div><!-- .grid_3 -->

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
            </nav>
        </div>
        </div>

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

        <section>
            <div class="container_12">
                <div id="content" class="grid_12">
                    <div class="grid_product">
                        <#list pageInfo.list as goods>
                            <div class="grid_3 product">
                                <div class="prev">
                                    <a href="${base}/goodsDetail/${goods.id}"><img src="${goods.picture1}" alt="" title="" /></a>
                                </div><!-- .prev -->
                                <h3 class="title">${goods.name  }</h3>
                                <div class="cart">
                                    <div class="price">
                                        <div class="vert">
                                            <div class="price_new">￥${goods.price?string(",##0.00")}</div>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" title="${base}/goods/${goods.id}/preBuy.do" class="bay" onclick="preBuy(this)"></a>
                                </div>
                            </div>
                        </#list>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div id="content" class="grid_12" style="text-align: center;">
                    <nav aria-label="Page navigation" style="display:inline;">
                        <ul class="pagination pagination-lg">
                            <#if pageInfo.pages gt 5 >
                                <#if pageInfo.pageNum lt 4>
                                    <li><a href="${base}/goods/${goodsTypeId}/1">1</a></li>
                                    <li><a href="${base}/goods/${goodsTypeId}/2">2</a></li>
                                    <li><a href="${base}/goods/${goodsTypeId}/3">3</a></li>
                                    <li><a href="${base}/goods/${goodsTypeId}/4">4</a></li>
                                    <li><a href="${base}/goods/${goodsTypeId}/5">5</a></li>
                                    <li>
                                        <a href="${base}/goods/${goodsTypeId}/${pageInfo.prePage}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </#if>
                                <#if pageInfo.pageNum gte 4>
                                    <li>
                                        <a href="${base}/goods/${goodsTypeId}/${pageInfo.prePage}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <#if (pageInfo.pages - pageInfo.pageNum) gte 2>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pageNum-2}">${pageInfo.pageNum-2}</a></li>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pageNum-1}">${pageInfo.pageNum-1}</a></li>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pageNum}">${pageInfo.pageNum}</a></li>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pageNum+1}">${pageInfo.pageNum+1}</a></li>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pageNum+2}">${pageInfo.pageNum+2}</a></li>
                                        <li>
                                            <a href="${base}/goods/${goodsTypeId}/${pageInfo.nextPage}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    <#else>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pages-4}">${pageInfo.pages-4}</a></li>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pages-3}">${pageInfo.pages-3}</a></li>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pages-2}">${pageInfo.pages-2}</a></li>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pages-1}">${pageInfo.pages-1}</a></li>
                                        <li><a href="${base}/goods/${goodsTypeId}/${pageInfo.pages}">${pageInfo.pages}</a></li>
                                    </#if>
                                </#if>
                            <#else>
                                <#list 1..pageInfo.pages as pn>
                                    <li><a href="${base}/goods/${goodsTypeId}/${pn}">${pn}</a></li>
                                </#list>
                            </#if>
                        </ul>
                    </nav>
                </div>
            </div>
        </section>

        <script src="${base}/static/js/jquery-2.1.4.min.js" ></script>
        <script src="${base}/static/js/jquery.cookie.js" ></script>
        <script src="${base}/static/bootstrap/js/bootstrap.js"></script>
        <script src="${base}/static/js/html5.js" ></script>
        <script src="${base}/static/js/jflow.plus.js" ></script>
        <script src="${base}/static/js/jquery.carouFredSel-5.2.2-packed.js"></script>
        <script src="${base}/static/layui/layui.all.js"></script>
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
                                var html = "<li><span>欢迎您！" + username + "</span></li><li class=\"separator\">|</li><li><a href=\"${base}/user/userInfo/"+result.data.id+"\">个人中心" + "</a></li><li class=\"separator\">|</li>" + "<li><a href=\"javascript:void(0)\" onclick=\"logout()\">退出</a></li>";
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
        </script>
    </body>
</html>
