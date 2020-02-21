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
    <title>修改信息</title>
    <link href="${base}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
    <form class="form form-horizontal" id="form-article-add" method="POST" action="${base}/editUser">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="hidden" id="id" name="id" value="${user.id}">
                <input type="text" class="input-text" value="${user.name}" placeholder="用户名" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">手机号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${user.phone}" placeholder="手机号" id="phone" name="phone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">密码（不可修改）：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${user.password}" placeholder="密码" id="password" name="password" disabled>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${user.address}" placeholder="地址" id="address" name="address">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">个性签名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea id="autograph" name="autograph" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="签名不能为空！">${user.autograph}</textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存修改</button>
                <button class="btn btn-default radius" type="reset">&nbsp;&nbsp;撤销修改&nbsp;&nbsp;</button>
                <a href="javascript:void(0);" class="btn btn-danger radius" type="button" id="btn-reset-password" onclick="btn_reset_password()">&nbsp;&nbsp;重置密码&nbsp;&nbsp;</a>
            </div>
        </div>
    </form>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${base}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${base}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${base}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${base}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${base}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${base}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${base}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${base}/lib/jquery.md5.js"></script>
<script type="text/javascript">
    function btn_reset_password() {
        layer.confirm('确认要重置密码吗？',function(index){
            var id = ${user.id};
            var password = $.md5("000000");
            var data={
                id:id,
                password:password
            }
            $.ajax({
                type:"POST",
                url:"${base}/resetPassword",
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
                }
            });
        });
    }
</script>
</body>
</html>