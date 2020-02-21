package com.xybb.manage.dao;

import com.xybb.manage.bean.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    User selectUserById(Integer id);

    void updateUserInfo(Map<String, Object> map);

    @Update("UPDATE t_user SET type = 2, updatetime = now() WHERE id = #{id}")
    void changeToSeller(@Param("id") Integer id);

    Integer quitSeller(Integer id);

    @Select("SELECT * FROM t_user WHERE phone = #{phoneNum}")
    User selectByPhone(String phoneNum);

    @Select("SELECT * FROM t_user WHERE phone = #{phoneNum} AND type = 4")
    User selectActiveAdminByPhone(String phone);

    @Select("SELECT * FROM t_user WHERE type = #{userType}")
    List<User> selectUserListByType(Integer userType);

    @Select("SELECT * FROM t_user WHERE type != 4 and type != 6 and type != 7")
    List<User> selectAllUsers();

    Integer editUser(Map<String, Object> map);

    Integer resetPassword(Map<String, Object> map);

    @Update("UPDATE t_user SET type = 5, updatetime = now() WHERE id = #{userId}")
    Integer deleteUser(Integer userId);

    @Select("SELECT count(0) FROM t_user")
    Integer countAll();

    @Select("SELECT COUNT(0) FROM t_user WHERE sex = #{sex}")
    Integer countBySex(Integer sex);

    @Select("SELECT COUNT(0) FROM t_user WHERE type = #{type}")
    Integer countByType(Integer type);

    Integer deleteAdmins(List<Integer> list);

    @Select("SELECT * FROM t_user WHERE type = 4 or type = 6")
    List<User> selectUnDelAdminList();

    Integer addAdmin(User user);

    Integer editAdmin(User user);

    Integer controlAdmin(Map map);

    Integer editSelf(User user);

}