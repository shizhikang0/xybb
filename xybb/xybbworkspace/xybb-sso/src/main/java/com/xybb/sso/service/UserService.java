package com.xybb.sso.service;

import com.xybb.common.utils.AjaxResult;
import com.xybb.sso.bean.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {

    String loginResult(HttpServletRequest request, HttpServletResponse response);

    void registUser(String phoneNum, String password);

    AjaxResult getUserByToken(String token);

    Long deleteTokenInCookie(HttpServletRequest request, HttpServletResponse response, String token);
}
