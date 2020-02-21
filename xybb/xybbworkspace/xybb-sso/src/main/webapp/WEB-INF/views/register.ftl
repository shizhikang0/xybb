<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>校园宝贝</title>
    <link rel="shortcut icon" href="${base}/static/favicon/favicon.ico">
    <link rel="stylesheet" href="${base}/static/js/lib/layui/css/layui.css">
    <link rel="stylesheet" href="${base}/static/css/web/public.css?v=0.1">
    <link rel="stylesheet" href="${base}/static/css/web/login.css">
</head>
<body style="background: url(${base}/static/images/bj.jpg);height:672px;no-repeat;">
    <div id="register-main" class="clearfix">
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">
                <li id="xy-register">注册</li>
                <li id="xy-login">登录</li>
            </ul>
            <div class="layui-tab-content">
                <form class="layui-tab-item layui-form layui-show xy-register-content" action="${base}/register">
                    <div class="layui-form-item">
                        <input type="text" name="phoneNum" autocomplete="off" placeholder="请输入手机号" class="layui-input phoneNum">
                    </div>
                    <div class="layui-form-item captcha">
                        <input type="text" name="captchaCode" autocomplete="off" placeholder="请输入验证码" class="layui-input captchaCode">
                        <img id="imgObj" class="captchaImage" alt="验证码" src="${base}/captcha" title="点击刷新" onclick="changeImg()"/>
                    </div>
                    <div class="layui-form-item">
                        <input type="password" name="password" autocomplete="off" placeholder="请输入密码" class="layui-input password">
                    </div>
                    <div class="layui-form-item">
                        <input type="password" name="passwordRe" autocomplete="off" placeholder="请确认密码" class="layui-input password">
                    </div>
                    <a href="javascript:;" class="layui-btn register-btn">注&nbsp;&nbsp;册</a>
                </form>
                <form id="login_form" class="layui-tab-item layui-form xy-login-content" action="${base}/login">
                    <div class="layui-form-item">
                        <input type="text" name="phoneNumLogin" autocomplete="off" placeholder="请输入手机号" class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <input type="password" name="passwordLogin" autocomplete="off" placeholder="请输入密码" class="layui-input">
                    </div>
                    <a href="javascript:;" class="layui-btn login-btn">登&nbsp;&nbsp;录</a>
                </form>
            </div>
        </div>
    </div>
    <script src="${base}/static/js/jquery-2.1.4.min.js"></script>
    <script src="${base}/static/js/lib/layui/lay/dest/layui.all.js"></script>
    <script src="${base}/static/js/web/common.js"></script>
    <script src="${base}/static/js/lib/jquery.md5.js"></script>
    <script src="${base}/static/js/web/register.js"></script>
    <script src="${base}/static/js/web/login.js"></script>
    <script>
        $(function () {
            $("#xy-register").addClass("layui-this");
        });
    </script>
</body>
</html>