package com.xybb.sso.dao;


import com.xybb.sso.bean.User;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

public interface UserMapper {

    @Select("SELECT * FROM t_user WHERE phone = #{phoneNum}")
    User selectByPhone(String phoneNum);

    void insertGenerateUser(Map map);
}