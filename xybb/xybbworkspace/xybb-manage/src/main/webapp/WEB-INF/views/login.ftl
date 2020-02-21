<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="en">
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
<link href="${base}/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${base}/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="${base}/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${base}/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/lib/layer/2.4/skin/layer.css"></script>
<!--[if IE 6]>
<script type="text/javascript" src="${base}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="loginWraper">
  <div style="margin-top: 30px;" align="center"><p style="font-size: 50px;">校园宝贝后台管理系统</p></div>
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="phoneNum" name="phoneNum" type="text" placeholder="账户" class="input-text size-L phoneNum">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L password">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L captchaCode" name="captchaCode" type="text" placeholder="验证码" style="width:150px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <img id="imgObj" class="captchaImage" alt="验证码" src="${base}/a/captcha" title="点击刷新" onclick="changeImg()"/>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input id="login-btn" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;重&nbsp;&nbsp;&nbsp;&nbsp;置&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
</body>
<script type="text/javascript" src="${base}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${base}/lib/jquery.md5.js"></script>
<script type="text/javascript" src="${base}/lib/layer/2.4/layer.js"></script>
<script>
    $("#login-btn").click(function () {
        //检测手机号
        var phoneReg = /^1[3|4|5|6|7|8][0-9]\d{8}$/;
        if($('.phoneNum').val() == '' || $('.phoneNum').val() == undefined){
            $('.phoneNum').focus();
            return layer.tips('请输入手机号', '.phoneNum');
        }else if(!phoneReg.test($('.phoneNum').val())){
            $('.phoneNum').focus();
            return layer.tips('手机号格式有误', '.phoneNum');
        }

        //检测密码
        if($('.password').val() == '' || $('.password').val() == undefined){
            $('.password').focus();
            return layer.tips('请输入密码', '.password');
        }

        //检测图形验证码
        if($('.captchaCode').val() == '' || $('.captchaCode').val() == undefined){
            $('.captchaCode').focus();
            return layer.tips('请输入图形验证码', '.captchaCode');
        }

        var data = {
            phoneNum: $('.phoneNum').val(),
            password: $.md5($('.password').val()),
            captchaCode: $('.captchaCode').val()
        }

        var url = '${base}/a/goIndex';
        $.ajax({
            type:"POST",
            url:url,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,
            dataType: "json",
            error: function () {
                layer.msg("登录失败！");
            },
            success: function (result) {
                if (result) {
                    if (result.status == 1) {
                        window.location = "http://localhost:8091/xybb/a/index";
                        return;
                    } else {
                        layer.msg(result.msg);
                    }
                }
            }
        })

    });
    function changeImg() {
        var imgSrc = $("#imgObj");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", changeUrl(src));
    }
    //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function changeUrl(url) {
        var timestamp = (new Date()).valueOf();
        var index = url.indexOf("?",url);
        if (index > 0) {
            url = url.substring(0, index);
        }
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }
</script>
</html>