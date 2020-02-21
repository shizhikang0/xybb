package com.xybb.crud.dao;

import com.xybb.crud.bean.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.Map;

public interface UserMapper {

    User selectUserById(Integer id);

    void updateUserInfo(Map<String, Object> map);

    @Update("UPDATE t_user SET type = 3, updatetime = now() WHERE id = #{id}")
    void changeToSeller(@Param("id") Integer id);

    @Update("UPDATE t_user SET type = 1, updatetime = now() WHERE id = #{id}")
    void quitSeller(Integer id);
}