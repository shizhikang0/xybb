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
</head>
    <body>
        <div class="container_12">
            <div class="grid_3">
                <hgroup>
                  <h1 id="site_logo" ><a href="${base}/index"><img src="${base}/static/images/logo.png" alt="校园宝贝"/></a></h1>
                </hgroup>
            </div><!-- .grid_3 -->

            <div class="grid_3">
                  <form class="search" method="post" action="${base}/goodsSearch/1">
                      <input type="text" name="search" class="entry_form" value="${search}" placeholder="输入关键字搜索"/>
                  </form>
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

        <div class="clear"></div>

        <div class="container_12">
            <div class="grid_12">
                <div class="slidprev"><span>Prev</span></div>
                <div class="slidnext"><span>Next</span></div>
                <div id="slider">
                  <div id="slide1">
                    <a href="${base}/goodsDetail/${broadcast0.id}"><img src="${broadcast0.picture1}" width="100%"/></a>
                  </div>

                  <div id="slide2">
                      <a href="${base}/goodsDetail/${broadcast0.id}"><img src="${broadcast0.picture1}" width="100%"/></a>
                  </div>

                  <div id="slide3">
                      <a href="${base}/goodsDetail/${broadcast0.id}"><img src="${broadcast0.picture1}" width="100%"/></a>
                  </div>
                </div><!-- .slider -->
                <div id="myController">
                  <div class="control"><span>1</span></div>
                  <div class="control"><span>2</span></div>
                  <div class="control"><span>3</span></div>
                </div>


            </div>
        </div>
        <div class="clear"></div>

        <section class="home">
            <div class="container_12">

              <div class="carousex">
                <div class="c_header">
                  <div class="grid_10">
                    <h2>最新上架 Top 10</h2>
                  </div>

                  <div class="grid_2">
                    <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
                    <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
                   </div><!-- .grid_2 -->
                </div><!-- .c_header -->

                <div class="list_carousel">
                    <ul id="list_product" class="list_product">
                        <#list newList as newgoods>
                            <li>
                                <div class="grid_3 product">
                                    <div class="prev">
                                        <a href="${base}/goodsDetail/${newgoods.id}"><img src="${newgoods.picture1}"/></a>
                                    </div><!-- .prev -->
                                    <h3 class="title">${newgoods.detail}</h3>
                                    <div class="cart">
                                        <div class="price">
                                            <div class="vert">
                                                <div class="price_new">￥${newgoods.price}</div>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" title="${base}/goods/${newgoods.id}/preBuy.do" class="bay" onclick="preBuy(this)"></a>
                                    </div>
                                </div>
                            </li>
                        </#list>
                    </ul>
                </div>
            </div>

              <div class="carousex">
                <div class="c_header">
                  <div class="grid_10">
                    <h2>最多浏览 Top 10</h2>
                  </div><!-- .grid_10 -->

                  <div class="grid_2">
                    <a id="next_c2" class="next arows" href="#"><span>Next</span></a>
                    <a id="prev_c2" class="prev arows" href="#"><span>Prev</span></a>
                  </div>
                </div>

                <div class="list_carousel">
                    <ul id="list_product2" class="list_product">
                          <#list popularList as pgoods>
                              <li>
                                  <div class="grid_3 product">
                                      <div class="prev">
                                          <a href="${base}/goodsDetail/${pgoods.id}"><img src="${pgoods.picture1}" alt="" title="" /></a>
                                      </div>
                                      <h3 class="title">${pgoods.detail}</h3>
                                      <div class="cart">
                                          <div class="price">
                                              <div class="vert">
                                                  <div class="price_new">￥${pgoods.price}</div>
                                              </div>
                                          </div>
                                          <a href="javascript:void(0);" title="${base}/goods/${pgoods.id}/preBuy.do" class="bay" onclick="preBuy(this)"></a>
                                      </div>
                                  </div>
                              </li>
                          </#list>
                    </ul>
                </div>
              </div>

            </div>
          </section>

          <div class="clear"></div>

        <script src="${base}/static/js/jquery-2.1.4.min.js" ></script>
        <script src="${base}/static/js/jquery.cookie.js" ></script>
        <script src="${base}/static/js/html5.js" ></script>
        <script src="${base}/static/js/jflow.plus.js" ></script>
        <script src="${base}/static/js/jquery.carouFredSel-5.2.2-packed.js"></script>
        <script src="${base}/static/layui/layui.all.js"></script>
        <script>
            $(document).ready(function(){
                $("#myController").jFlow({
                    controller: ".control", // must be class, use . sign
                    slideWrapper : "#jFlowSlider", // must be id, use # sign
                    slides: "#slider",  // the div where all your sliding divs are nested in
                    selectedWrapper: "jFlowSelected",  // just pure text, no sign
                    width: "984px",  // this is the width for the content-slider
                    height: "480px",  // this is the height for the content-slider
                    duration: 400,  // time in miliseconds to transition one slide
                    prev: ".slidprev", // must be class, use . sign
                    next: ".slidnext", // must be class, use . sign
                    auto: true
                });
                $("button").click(function(){
                    $(this).addClass('click')
                });
                $('#list_product').carouFredSel({
                    prev: '#prev_c1',
                    next: '#next_c1',
                    auto: false
                });
                $('#list_product2').carouFredSel({
                    prev: '#prev_c2',
                    next: '#next_c2',
                    auto: false
                });
                $(".caroufredsel_wrapper").css("width","1005px");
                $(window).resize();
            });
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
