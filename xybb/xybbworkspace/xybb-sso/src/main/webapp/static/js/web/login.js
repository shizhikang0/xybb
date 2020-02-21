$(function(){
    layui.use(['element', 'layer'], function() {
        var element = layui.element(),
            layer = layui.layer;
        $('.login-btn').click(function () {
            if ($('input[name=phoneNumLogin]').val() == '' || $('input[name=phoneNumLogin]').val() == undefined) {
                layer.msg('请输入手机号');
                return false;
            }
            var phoneReg = /^1[3|4|5|6|7|8][0-9]\d{8}$/;
            if(!phoneReg.test($('input[name=phoneNumLogin]').val())){
                layer.msg('手机号格式有误');
                return false;
            }
            if ($('input[name=passwordLogin]').val() == '' || $('input[name=passwordLogin]').val() == undefined) {
                layer.msg('请输入密码');
                return false;
            }

            var url = 'login?r=' + Math.random();
            var data = {
                phoneNumLogin: $('input[name=phoneNumLogin]').val(),
                passwordLogin: $.md5($('input[name=passwordLogin]').val())
            }
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: data,
                dataType: "json",
                error: function () {
                    layer.msg("登录失败！");
                },
                success: function (result) {
                    if (result) {
                        if (result.status == 1) {
                                window.location = "http://localhost:8089/xybb/";
                            return;
                        } else {
                            layer.msg("登录名或密码错误！");
                        }
                    }
                }
            })
        })
    })
})