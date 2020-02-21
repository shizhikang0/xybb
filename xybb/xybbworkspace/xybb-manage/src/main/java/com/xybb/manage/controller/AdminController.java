package com.xybb.manage.controller;

import com.xybb.common.utils.AjaxResult;
import com.xybb.common.utils.CookieUtils;
import com.xybb.common.utils.ValidateCode;
import com.xybb.manage.bean.User;
import com.xybb.manage.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/a")
public class AdminController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(HttpServletRequest request){
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        CookieUtils.deleteCookie(request,response,"phone");
        request.getSession().removeAttribute("phone");
        return "login";
    }

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

    @RequestMapping("/goIndex")
    @ResponseBody
    public AjaxResult goIndex(HttpServletRequest request,HttpServletResponse response){
        return userService.goIndex(request,response);
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        String phone = CookieUtils.getCookieValue(request,"phone");
        if(!StringUtils.isBlank(phone)){
            User user = userService.getUserByPhone(phone);
            if (null != user){
                request.setAttribute("admin",user.getName());
                return "index";
            }
        }
        return "login";
    }

    @RequestMapping("/welcome")
    public String welcome(HttpServletRequest request){
        return "welcome";
    }

    @RequestMapping("/adminList")
    public String adminList(HttpServletRequest request){
        List<User> adminList = userService.selectUnDelAdminList();
        request.setAttribute("total",adminList.size());
        request.setAttribute("adminList",adminList);
        return "admin_list";
    }

    @RequestMapping(value = "/addAdmin",method = RequestMethod.GET)
    public String addAdmin(HttpServletRequest request){
        return "admin_add";
    }

    @RequestMapping(value = "/addAdmin",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult addAdmin2(HttpServletRequest request){
        return userService.addAdmin(request);
    }

    @RequestMapping("/deleteCheckedAdmins")
    @ResponseBody
    public AjaxResult deleteCheckedAdmins(HttpServletRequest request){
        return userService.deleteAdmins(request);
    }

    @RequestMapping(value = "/adminEdit",method = RequestMethod.GET)
    public String adminEdit(HttpServletRequest request){
        String id = request.getParameter("id");
        User user = userService.selectUserById(Integer.valueOf(id));
        request.setAttribute("user",user);
        return "admin_edit";
    }

    @RequestMapping(value = "adminEdit",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult adminEdit2(HttpServletRequest request){
        return userService.editAdmin(request);
    }

    @RequestMapping("/stop")
    @ResponseBody
    public AjaxResult stop(HttpServletRequest request){
        return userService.controlAdmin(request,6);
    }

    @RequestMapping("/active")
    @ResponseBody
    public AjaxResult active(HttpServletRequest request){
        return userService.controlAdmin(request,4);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public AjaxResult delete(HttpServletRequest request){
        return userService.controlAdmin(request,7);
    }

    @RequestMapping(value = "editSelf", method = RequestMethod.GET)
    public String editSelf(HttpServletRequest request){
        String phone = CookieUtils.getCookieValue(request,"phone");
        User user = userService.getUserByPhone(phone);
        request.setAttribute("user",user);
        return "self_edit";
    }

    @RequestMapping(value = "selfEdit",method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult selfEdit(HttpServletRequest request){
        return userService.editSelf(request);
    }
}
