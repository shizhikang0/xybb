package com.xybb.manage.controller;

import com.xybb.common.utils.AjaxResult;
import com.xybb.common.utils.Constants;
import com.xybb.manage.bean.User;
import com.xybb.manage.result.SexGoodsTypeNum;
import com.xybb.manage.result.UserSexType;
import com.xybb.manage.result.UserType;
import com.xybb.manage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/applySellerList")
    public String applySellerList(HttpServletRequest request){
        List<User> userList = userService.selectUserListByType(Constants.TYPE_APPLYSELLER);
        request.setAttribute("userList",userList);
        return "apply_seller_list";
    }

    @RequestMapping("/userList")
    public String selectAllUsers(HttpServletRequest request){
        List<User> userList = userService.selectAllUsers();
        request.setAttribute("userList",userList);
        return "all_user";
    }

    @RequestMapping("/veto")
    @ResponseBody
    public AjaxResult vetoApplyUser(HttpServletRequest request){
        return userService.vetoApplyUser(request);
    }

    @RequestMapping("/adopt")
    @ResponseBody
    public AjaxResult adoptApplyUser(HttpServletRequest request){
        return userService.adoptApplyUser(request);
    }

    @RequestMapping(value = "/editUser",method = RequestMethod.GET)
    public String editUserGet(HttpServletRequest request){
        String id = request.getParameter("id");
        User user = userService.selectUserById(Integer.valueOf(id));
        request.setAttribute("user",user);
        return "edit_user";
    }

    @RequestMapping(value = "/editUser",method = RequestMethod.POST)
    public String editUser(HttpServletRequest request){
        userService.editUser(request);
        return "edit_user";
    }

    @RequestMapping("/resetPassword")
    @ResponseBody
    public AjaxResult resetPassword(HttpServletRequest request){
        return userService.resetPassword(request);
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public AjaxResult deleteUser(HttpServletRequest request){
        return userService.deleteUser(request);
    }

    @RequestMapping("/activeUser")
    @ResponseBody
    public AjaxResult activeUser(HttpServletRequest request){
        return userService.activeUser(request);
    }

    @RequestMapping("/userBranch")
    public String userBranch(HttpServletRequest request){
        List<UserSexType> userSexTypeList = userService.queryProportion();
        request.setAttribute("userSexTypeList",userSexTypeList);
        request.setAttribute("title","用户性别分布3D饼状图");
        return "user_branch";
    }

    @RequestMapping("/userTypeBranch")
    public String sexGoodsTypeBranch(HttpServletRequest request){
        List<UserSexType> userTypeList = userService.queryTypeProportion();
        request.setAttribute("userSexTypeList",userTypeList);
        request.setAttribute("title","用户类型分布饼状图");
        return "user_type_branch";
    }
}
