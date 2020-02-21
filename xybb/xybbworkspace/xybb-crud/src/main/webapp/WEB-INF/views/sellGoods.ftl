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
    <link rel="stylesheet" href="${base}/static/bootstrap/css/bootstrap-select.min.css">
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
                <li><a href="${base}/user/userInfo/${user.id}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;我的信息</a></li>
                <#if user.type == 2>
                    <li><a href="${base}/user/sellGoods/${user.id}" class="active"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;&nbsp;我要发布</a></li>
                    <li><a href="${base}/user/onSaleGoods/${user.id}/1"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span>&nbsp;&nbsp;我发布的</a></li>
                </#if>
                <li><a href="${base}/user/preBuy/${user.id}/1"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;&nbsp;我看上的</a></li>
                <li><a href="${base}/user/allBuy/${user.id}/1"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;我的账单</a></li>
            </ul>
        </div>
    </div>
    <div class="userinfo fr">
        <form id="goods-form" style="margin: 10px 20px 20px 20px;" class="form form-vertical" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-sm-1">
                    <label style="line-height:30px;">名&nbsp;&nbsp;称</label>
                </div>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="name" name="name" value="${goods.name}" placeholder="请输入商品名称">
                    <input type="hidden" id="id" name="id" value="${goods.id}">
                    <input type="hidden" id="userId" name="userId" value="${user.id}">
                </div>
                <div class="col-sm-1">
                    <label>类&nbsp;&nbsp;别</label>
                </div>
                <div class="col-sm-5">
                    <select class="selectpicker" name="type" title="请选择">
                        <#list typeList as type>
                            <option value="${type.id}">${type.name}</option>
                        </#list>
                    </select>
                </div>
            </div>
            <div style="margin-top: 20px;" class="row">
                <div class="col-sm-1">
                    <label style="line-height:30px;">价&nbsp;&nbsp;格</label>
                </div>
                <div class="col-sm-5">
                    <input class="form-control" id="price" name="price" placeholder="请输入价格" value="${goods.price}">
                </div>
                <div class="col-sm-1">
                    <label style="line-height:30px;">原&nbsp;&nbsp;价</label>
                </div>
                <div class="col-sm-5">
                    <input class="form-control" id="originalPrice" name="originalPrice" placeholder="请输入商品原价" value="${goods.originalPrice}">
                </div>
            </div>
            <div style="margin-top: 20px;" class="row">
                <div class="col-sm-1">
                    <label style="line-height:30px;">描&nbsp;&nbsp;述</label>
                </div>
                <div class="col-sm-11">
                    <textarea style="width:784px;" class="form-control" id="detail" name="detail" placeholder="请输入商品描述">${goods.detail}</textarea>
                </div>
            </div>
            <div style="margin-top: 20px;" class="row">
                <div class="col-sm-1">
                    <label style="line-height:30px;">图&nbsp;&nbsp;片</label>
                </div>
                <div class="col-sm-4 text-center">
                    <div class="htmleaf-container" style="width:790px;height:300px;  ">
                        <div class="kv-main">
                            <form enctype="multipart/form-data">
                                <input id="file-zh" name="files" type="file" multiple>
                            </form>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div class="text-center">
                        <button id="form-submit" style="margin: 10% auto auto auto;" type="button" class="btn btn-primary">发布</button>
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
<script src="${base}/static/bootstrap/js/bootstrap-select.min.js"></script>
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
        }
    });
    $(function () {
        //0.初始化fileinput
        var oFileInput = new FileInput();
        oFileInput.Init("file-zh", "${base}/goods/uploadGoods");
    });

    //初始化fileinput
    var FileInput = function () {
        var oFile = new Object();

        //初始化fileinput控件（第一次初始化）
        oFile.Init = function(ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            //初始化上传控件的样式
            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: uploadUrl, //上传的地址
                allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
                uploadAsync: false,
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                //dropZoneEnabled: false,//是否显示拖拽区域
                //minImageWidth: 50, //图片的最小宽度
                //minImageHeight: 50,//图片的最小高度
                //maxImageWidth: 1000,//图片的最大宽度
                //maxImageHeight: 1000,//图片的最大高度
                //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
                //minFileCount: 0,
                maxFileCount: 3, //表示允许同时上传的最大文件个数
                enctype: 'multipart/form-data',
                validateInitialCount:true,
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            });

            //导入文件上传完成之后的事件
            $('#file-zh').on('fileuploaded', function(event, data, previewId, index) {
                var form = data.form, files = data.files, extra = data.extra,
                        response = data.response, reader = data.reader;
                console.log(response);//打印出返回的json
                console.log(response.paths);//打印出路径
            });
        }
        return oFile;
    };
    $("#form-submit").on("click",function(){
        var form = new FormData(document.getElementById("goods-form"));
        $.ajax({
            url:"${base}/goods/uploadGoods",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                layer.msg(data.msg,{time:1000});
                setTimeout(function () {
                    window.location.reload();
                },1000);
            },
            error:function(e){
                alert("错误！！");
            }
        });
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
