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
    <title>添加管理员</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-admin-add">
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-7 col-sm-7">
                <input type="text" class="input-text" value="${user.name}" placeholder="" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-xs-7 col-sm-7 skin-minimal">
                <div class="radio-box">
                    <input name="sex" type="radio" id="sex-1" value="1">
                    <label for="sex-1">男</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-2" name="sex" value="2">
                    <label for="sex-2">女</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>手机：</label>
            <div class="formControls col-xs-7 col-sm-7">
                <input type="text" class="input-text" value="${user.phone}" placeholder="输入手机号" id="phone" name="phone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>密码：</label>
            <div class="formControls col-xs-7 col-sm-7">
                <input type="password" class="input-text" value="${user.password}" placeholder="输入手机号" id="password" name="password">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-xs-7 col-sm-7">
                <input type="password" class="input-text" value="${user.password}" placeholder="重复输入手机号" id="passwordRe" name="passwordRe">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-3 col-sm-3">备注：</label>
            <div class="formControls col-xs-7 col-sm-7">
                <textarea name="autograph" cols="" rows="" class="textarea"  placeholder="（初始密码为000000）  说点什么...100个字符以内" dragonfly="true">${user.autograph}</textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="button" onclick="btn_edit_admin()" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <input class="btn btn-default radius" type="reset" value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${base}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${base}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${base}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${base}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${base}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${base}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${base}/lib/jquery.md5.js"></script>
<script type="text/javascript">
    $(function(){
        if('${user}' != ''){
            $("input[type=radio][value='${user.sex}']").attr('checked','checked');
        }
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
    });

    function btn_edit_admin(){
        var name = $('input[name=name]').val();
        var sex = $('input[type=radio]:checked').val();
        var phone = $('input[name=phone]').val();
        var autograph = $('textarea[name=autograph]').val();
        var password = $('input[name=password]').val();
        var passwordRe = $('input[name=passwordRe]').val();
        if(name == '' || phone == ''){
            layer.msg('请输入完整信息!',{icon:1,time:1000});
            return false;
        }
        if(password == '' || passwordRe == ''){
            layer.msg('密码不能为空!',{icon:1,time:1000});
            return false;
        }
        if(password != passwordRe){
            layer.msg('输入的密码不一致!',{icon:1,time:1000});
            return false;
        }
        var data={
            id:${user.id},
            name:name,
            sex:sex,
            phone:phone,
            autograph:autograph,
            password:$.md5(password)
        };
        $.ajax({
            type: 'POST',
            url: '${base}/a/selfEdit',
            data:data,
            dataType: 'json',
            success: function(data){
                layer.msg(data.msg,{icon:1,time:1000});
                setTimeout(function () {
                    window.parent.location.reload();
                }, 1000);
            },
            error: function(XmlHttpRequest, textStatus, errorThrown){
                layer.msg('error!',{icon:1,time:1000});
            }
        });

    }
</script>
</body>
</html>