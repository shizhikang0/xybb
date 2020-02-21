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
    <link rel="stylesheet" href="${base}/static/bootstrap-fileinput-master/css/fileinput.min.css">
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
                <li><a href="${base}/user/userInfo/${user.id}" class="active"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;我的信息</a></li>
                <#if user.type == 2>
                    <li><a href="${base}/user/sellGoods/${user.id}"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;&nbsp;我要发布</a></li>
                    <li><a href="${base}/user/onSaleGoods/${user.id}/1"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span>&nbsp;&nbsp;我发布的</a></li>
                </#if>
                <li><a href="${base}/user/preBuy/${user.id}/1"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;&nbsp;我看上的</a></li>
                <li><a href="${base}/user/allBuy/${user.id}/1"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;我的账单</a></li>
            </ul>
        </div>
    </div>
    <div class="userinfo fr">
            <form id="user-form" style="margin: 10px 20px 20px 20px;" class="form form-vertical" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-sm-1">
                    <label style="line-height:30px;">昵&nbsp;&nbsp;称</label>
                </div>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="name" name="name" value="${user.name}" placeholder="请输入昵称">
                    <input type="hidden" id="id" name="id" value="${user.id}">
                </div>
                <div class="col-sm-2">
                    <label>性&nbsp;&nbsp;别</label>
                </div>
                <div class="col-sm-6">
                    <div class="radio radio-info radio-inline">
                        <input type="radio" value="1" name="sex">
                        <label>男</label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" value="2" name="sex">
                        <label>女</label>
                    </div>
                </div>
            </div>
            <div style="margin-top: 20px;" class="row">
                <div class="col-sm-1">
                    <label style="line-height:30px;">地&nbsp;&nbsp;址</label>
                </div>
                <div class="col-sm-3">
                    <textarea class="form-control" id="address" name="address" placeholder="请输入地址">${user.address}</textarea>
                </div>
                <div class="col-sm-2">
                    <label style="line-height:30px;">个性签名</label>
                </div>
                <div class="col-sm-5">
                    <textarea class="form-control" id="autograph" name="autograph" placeholder="请输入个性签名">${user.autograph}</textarea>
                </div>
            </div>
            <div style="margin-top: 20px;" class="row">
                <div class="col-sm-1">
                    <label style="line-height:30px;">头&nbsp;&nbsp;像</label>
                </div>
                <div class="col-sm-4 text-center">
                    <div class="kv-avatar">
                        <div class="file-loading">
                            <input id="avatar-2" name="avatar-2" type="file" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <hr>
                    <div class="text-center">
                        <button id="form-submit" type="button" class="btn btn-primary">修改信息</button>
                        <#if user.type == 1>
                            <button id="to-seller" type="button" class="btn btn-primary">我要开店</button>
                        <#else>
                            <button id="quit-seller" type="button" class="btn btn-primary">我要关店</button>
                        </#if>

                    </div>
                </div>
            </div>
        </form>
        <div id="kv-avatar-errors-1" class="center-block" style="width:800px;display:none"></div>
    </div>
</div>
<script src="${base}/static/js/jquery-2.1.4.min.js"></script>
<script src="${base}/static/js/jquery.cookie.js" ></script>
<script src="${base}/static/bootstrap/js/bootstrap.js"></script>
<script src="${base}/static/bootstrap-fileinput-master/js/fileinput.min.js"></script>
<script src="${base}/static/bootstrap-fileinput-master/js/locales/zh.js"></script>
<script src="${base}/static/layui/layui.all.js"></script>
<script>
    $(function(){
        var sex = ${user.sex};
        if(sex == 1 || sex == 2) {
            $("input[name=sex][value=" + sex + "]").attr("checked", true);
        }
        var head = "${user.head}";
        if(head != ""){
            $("#user-header-sider").attr("src",head);
            $("#user-header-main").attr("src",head);
        }
    });
    $("#avatar-2").fileinput({
        overwriteInitial: true,
        maxFileSize: 1500,
        showClose: false,
        showCaption: false,
        showBrowse: false,
        browseOnZoneClick: true,
        removeLabel: '',
        removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
        removeTitle: 'Cancel or reset changes',
        elErrorContainer: '#kv-avatar-errors-2',
        msgErrorClass: 'alert alert-block alert-danger',
        defaultPreviewContent: '<img id="user-header-main" style="width:160px;height:160px;" src="${base}/static/images/default.jpg" alt="Your Avatar"><h6 class="text-muted">点击上传</h6>',
        layoutTemplates: {main2: '{preview} ' + ' {remove} {browse}'},
        allowedFileExtensions: ["jpg", "png", "gif"]
    });
    $("#form-submit").on("click",function(){
        var form = new FormData(document.getElementById("user-form"));
        $.ajax({
            url:"${base}/user/uploadUser",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                location.href = "${base}/user/userInfo/"+data.data.id;
            },
            error:function(e){
                alert("错误！！");
            }
        });
    });
    $("#to-seller").on("click",function () {
        $.ajax({
            url:"${base}/user/changeToSeller/"+${user.id},
            type:"GET",
            success:function (data) {
                layer.msg(data.msg,{time:1000});
            }
        })
    });
    $("#quit-seller").on("click",function () {
        $.ajax({
            url:"${base}/user/quitSeller/"+${user.id},
            type:"GET",
            success:function (data) {
                layer.msg(data.msg,{time:1000});
                setTimeout(function () {
                    window.location.reload();
                }, 1000);
            }
        })
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
</script>
</body>
</html>
