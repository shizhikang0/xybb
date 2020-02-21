package com.xybb.crud.interceptor;

import com.xybb.common.utils.Constants;
import com.xybb.common.utils.CookieUtils;
import com.xybb.common.utils.JsonUtils;
import com.xybb.crud.bean.Goods;
import com.xybb.crud.bean.User;
import com.xybb.crud.dao.UserMapper;
import com.xybb.crud.dao.impl.JedisClientSingle;
import com.xybb.crud.service.GoodsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private JedisClientSingle jedisClient;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURL = request.getRequestURI();
        Integer subtraction = requestURL.length() - requestURL.lastIndexOf(Constants.INTERCEPTOR_FLAG);
        //公开URL或者已登录的别的请求（发布商品、修改信息等）

        String token = CookieUtils.getCookieValue(request, Constants.COOKIE_NAME);
        if(subtraction != 3){
            if(!StringUtils.isBlank(token)){
                String json =jedisClient.get(Constants.REDIS_USER_TOKEN + ":" + token);
                if(!StringUtils.isBlank(json)){
                    User user = JsonUtils.jsonToPojo(json, User.class);
                    request.setAttribute("user",user);
                }
            }
            return true;
        }

        //确定是私有请求，客户端cookie有token，redis中有token，才放行
        if(!StringUtils.isBlank(token)){
            String json =jedisClient.get(Constants.REDIS_USER_TOKEN + ":" + token);
            if(!StringUtils.isBlank(json)){
                User user = JsonUtils.jsonToPojo(json, User.class);
                Integer id = user.getId();
                user = userMapper.selectUserById(id);
                request.setAttribute("user",user);
                return true;
            }
        }
        response.getWriter().print("login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        String token = CookieUtils.getCookieValue(request, Constants.COOKIE_NAME);
        if(!StringUtils.isBlank(token)){
            String json =jedisClient.get(Constants.REDIS_USER_TOKEN + ":" + token);
            if(!StringUtils.isBlank(json)){
                User user = JsonUtils.jsonToPojo(json, User.class);
                Integer userId = user.getId();
                List<Goods> preBuyList = goodsService.selectPreBuyListByUserId(userId);
                request.setAttribute("pre_buy_list",preBuyList);
            }
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
