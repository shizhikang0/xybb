package com.xybb.sso.controller;

import com.xybb.common.utils.*;
import com.xybb.sso.bean.User;
import com.xybb.sso.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register(){
        return "register";
    }
    /**
     * 响应验证码页面
     * @return
     */
    @RequestMapping(value="/captcha")
    public String validateCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession();

        ValidateCode vCode = new ValidateCode(120,38,5,50);
        session.setAttribute("code", vCode.getCode());
        vCode.write(response.getOutputStream());
        return null;
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult register(HttpServletRequest request){
        String phoneNum = request.getParameter("phoneNum");
        String captchaCode = request.getParameter("captchaCode");
        String password = request.getParameter("password");
        String code = (String)request.getSession().getAttribute("code");
        if (!code.equalsIgnoreCase(captchaCode)){
            return new AjaxResult(2,"验证码错误！",null);
        }
        userService.registUser(phoneNum,password);
        return new AjaxResult(1,"注册成功！",null);
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult<String> login(HttpServletRequest request, HttpServletResponse response){
        String token = userService.loginResult(request, response);
        if(null != token){
            return new AjaxResult(1,"登录成功！",token);
        }else {
            return new AjaxResult(2,"账号或密码错误！",null);
        }
    }

    @RequestMapping(value = "/login/token/{token}")
    @ResponseBody
    public Object getUserByToken(@PathVariable String token, String callback) {
        AjaxResult result = null;
        try {
            result = userService.getUserByToken(token);
        } catch (Exception e) {
            e.printStackTrace();
            result = new AjaxResult(2,"登录失败",null);
        }

        //判断是否为jsonp调用
        if (StringUtils.isBlank(callback)) {
            return result;
        } else {
            MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
            mappingJacksonValue.setJsonpFunction(callback);
            return mappingJacksonValue;
        }
    }

    @RequestMapping("/logout/token/{token}")
    @ResponseBody
    public Object logout(HttpServletRequest request, HttpServletResponse response, @PathVariable("token") String token, String callback){
        Long result = userService.deleteTokenInCookie(request, response, token);
        if (StringUtils.isBlank(callback)) {
            return Constants.FAILURE;
        } else {
            MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(Constants.SUCCESS);
            mappingJacksonValue.setJsonpFunction(callback);
            return mappingJacksonValue;
        }
    }
}
