$(function(){
    //请求短息验证码
    $('.get-phoneCode').click(function(){
        //检测手机号
        var phoneReg = /^1[3|4|5|7|8][0-9]\d{8}$/
        if($('.phoneNum').val() == '' || $('.phoneNum').val() == undefined){
            $('.phoneNum').focus()
            return layer.tips('请输入手机号', '.phoneNum')
        }else if(!phoneReg.test($('.phoneNum').val())){
            $('.phoneNum').focus()
            return layer.tips('手机号格式有误', '.phoneNum')
        }
        //检测图形验证码
        if($('.captchaCode').val() == '' || $('.captchaCode').val() == undefined){
            $('.captchaCode').focus()
            return layer.tips('请输入图形验证码', '.captchaCode')
        }
        var url = '/user/get_verify_code'
        var Data = {
            phonenum: $('.phoneNum').val(),
            captcha: $('.captchaCode').val(),
            id: $('.captchaImage').attr('data-id'),
            type: 2
        }
        Common.ajax(url, Data, function (data) {
            if(data.success){
                layer.msg(data.msg);
                $('.get-phoneCode').hide();
                $('.showbox').show();
                Common.time();
            }else{
                layer.msg(data.msg);
            }
        }, function (err) {
            console.log(err);
        }, function (){}, true, 'POST')
    })

    //注册
    $('.register-btn').click(function(){
        //检测手机号
        var phoneReg = /^1[3|4|5|6|7|8][0-9]\d{8}$/;
        if($('.phoneNum').val() == '' || $('.phoneNum').val() == undefined){
            $('.phoneNum').focus();
            return layer.tips('请输入手机号', '.phoneNum');
        }else if(!phoneReg.test($('.phoneNum').val())){
            $('.phoneNum').focus();
            return layer.tips('手机号格式有误', '.phoneNum');
        }
        //检测图形验证码
        if($('.captchaCode').val() == '' || $('.captchaCode').val() == undefined){
            $('.captchaCode').focus();
            return layer.tips('请输入图形验证码', '.captchaCode');
        }

        //检测密码
        if($('.password').val() == '' || $('.password').val() == undefined){
            $('.password').focus();
            return layer.tips('请输入密码', '.password');
        }

        var url = 'register';
        var data = {
            phoneNum: $('.phoneNum').val(),
            password: $.md5($('.password').val()),
            captchaCode: $('.captchaCode').val()
        }
        $.ajax({
            type:"POST",
            url:url,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: data,
            dataType: "json",
            error: function () {
                layer.msg("注册失败！");
            },
            success: function (result) {
                if (result) {
                    if (result.status == 1) {
                        window.location = "http://localhost:8090/xybb";
                        return;
                    } else {
                        layer.msg(result.msg);
                    }
                }
            }
        })
    })

})