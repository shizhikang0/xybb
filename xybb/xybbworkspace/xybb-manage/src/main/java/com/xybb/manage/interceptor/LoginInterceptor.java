package com.xybb.manage.interceptor;

import com.xybb.common.utils.CookieUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String phoneInCookie = CookieUtils.getCookieValue(request,"phone");
        String phoneInSession = (String)request.getSession().getAttribute("phone");
        if(StringUtils.isBlank(phoneInCookie) && StringUtils.isBlank(phoneInSession)){
            return true;
        }
        if((!StringUtils.isBlank(phoneInCookie)) && !(StringUtils.isBlank(phoneInSession)) && phoneInCookie.equals(phoneInSession)){
            return true;
        }
        response.sendRedirect("http://localhost:8091/xybb/a/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
