package com.xybb.sso.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xybb.common.utils.*;
import com.xybb.sso.bean.User;
import com.xybb.sso.dao.UserMapper;
import com.xybb.sso.dao.impl.JedisClientSingle;
import com.xybb.sso.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private JedisClientSingle jedisClient;

    private static final ObjectMapper MAPPER = new ObjectMapper();

    @Override
    public String loginResult(HttpServletRequest request, HttpServletResponse response){
        String phoneNum = request.getParameter("phoneNumLogin");
        String password = request.getParameter("passwordLogin");
        User user = userMapper.selectByPhone(phoneNum);
        String passwordCombination = PasswordMD5.md5Hex(user.getSalt() + password);
        String passwordInDB = user.getPassword();
        if(StringUtils.isBlank(passwordCombination) || StringUtils.isBlank(passwordInDB)){
            return null;
        }
        boolean flag = passwordCombination.equals(passwordInDB);
        if(flag){
            user.setPassword(null);
            String token = CoreUtils.salt();
            try{
                jedisClient.set(Constants.REDIS_USER_TOKEN + ":" + token, MAPPER.writeValueAsString(user));
                jedisClient.expire(Constants.REDIS_USER_TOKEN + ":" + token, Constants.SSO_SESSION_EXPIRE);
                CookieUtils.setCookie(request,response,Constants.COOKIE_NAME,token);
                return token;
            }catch (JsonProcessingException e){
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public void registUser(String phoneNum, String password) {
        String salt = CoreUtils.salt();
        String passwordInDB = PasswordMD5.md5Hex(salt + password);
        Map<String,Object> map = new HashMap<>();
        map.put("phoneNum",phoneNum);
        map.put("password",passwordInDB);
        map.put("salt",salt);
        userMapper.insertGenerateUser(map);
    }

    @Override
    public AjaxResult getUserByToken(String token) {
        String json =jedisClient.get(Constants.REDIS_USER_TOKEN + ":" + token);
        if (StringUtils.isBlank(json)) {
            return new AjaxResult(2,"session已过期",null);
        }
        jedisClient.expire(Constants.REDIS_USER_TOKEN + ":" + token, Constants.SSO_SESSION_EXPIRE);
        return new AjaxResult(1,"成功",JsonUtils.jsonToPojo(json, User.class));
    }

    @Override
    public Long deleteTokenInCookie(HttpServletRequest request, HttpServletResponse response, String token) {
        CookieUtils.deleteCookie(request,response,Constants.COOKIE_NAME);
        return jedisClient.del(Constants.REDIS_USER_TOKEN + ":" + token);
    }


}
