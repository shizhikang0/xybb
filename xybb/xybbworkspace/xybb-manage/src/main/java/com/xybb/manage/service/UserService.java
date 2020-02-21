package com.xybb.manage.service;

import com.xybb.common.utils.AjaxResult;
import com.xybb.manage.bean.User;
import com.xybb.manage.result.UserSexType;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface UserService {
    AjaxResult goIndex(HttpServletRequest request,HttpServletResponse response);

    User getUserByPhone(String phone);

    List<User> selectUserListByType(Integer userType);

    AjaxResult vetoApplyUser(HttpServletRequest request);

    AjaxResult adoptApplyUser(HttpServletRequest request);

    List<User> selectAllUsers();

    Integer editUser(HttpServletRequest request);

    AjaxResult resetPassword(HttpServletRequest request);

    User selectUserById(Integer id);

    AjaxResult deleteUser(HttpServletRequest request);

    AjaxResult activeUser(HttpServletRequest request);

    List<UserSexType> queryProportion();

    List<UserSexType> queryTypeProportion();

    AjaxResult deleteAdmins(HttpServletRequest request);

    List<User> selectUnDelAdminList();

    AjaxResult addAdmin(HttpServletRequest request);

    AjaxResult editAdmin(HttpServletRequest request);

    AjaxResult controlAdmin(HttpServletRequest request,Integer type);

    AjaxResult editSelf(HttpServletRequest request);
}
