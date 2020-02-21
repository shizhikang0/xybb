package com.xybb.manage.service.impl;

import com.xybb.common.utils.AjaxResult;
import com.xybb.common.utils.CookieUtils;
import com.xybb.common.utils.CoreUtils;
import com.xybb.common.utils.PasswordMD5;
import com.xybb.manage.bean.User;
import com.xybb.manage.dao.GoodsTypeMapper;
import com.xybb.manage.dao.UserMapper;
import com.xybb.manage.result.UserSexType;
import com.xybb.manage.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private GoodsTypeMapper goodsTypeMapper;

    @Override
    public AjaxResult goIndex(HttpServletRequest request,HttpServletResponse response) {
        String phone = request.getParameter("phoneNum");
        String password = request.getParameter("password");
        String captchaCode = request.getParameter("captchaCode");
        if(StringUtils.isBlank(phone) || StringUtils.isBlank(password) ||StringUtils.isBlank(captchaCode)){
            return new AjaxResult(2,"登录失败！",null);
        }
        HttpSession session = request.getSession();
        String captchaCodeInSession = (String)session.getAttribute("code");
        if(captchaCode.equalsIgnoreCase(captchaCodeInSession)) {
            User user = userMapper.selectActiveAdminByPhone(phone);
            String passwordCombination = PasswordMD5.md5Hex(user.getSalt() + password);
            String passwordInDB = user.getPassword();
            if (StringUtils.isBlank(passwordCombination) || StringUtils.isBlank(passwordInDB)) {
                return new AjaxResult(2,"用户名或密码错误！",null);
            }
            boolean flag = passwordCombination.equals(passwordInDB);
            if(flag){
                request.getSession().setAttribute("phone",user.getPhone());
                CookieUtils.setCookie(request,response,"phone",user.getPhone());
                return new AjaxResult(1,"登录成功！",user.getPhone());
            }
        }
        return new AjaxResult(2,"验证码错误！",null);
    }

    @Override
    public User getUserByPhone(String phone) {
        return userMapper.selectByPhone(phone);
    }

    @Override
    public List<User> selectUserListByType(Integer userType) {
        return userMapper.selectUserListByType(userType);
    }

    @Override
    public AjaxResult vetoApplyUser(HttpServletRequest request) {
        String id = request.getParameter("id");
        userMapper.quitSeller(Integer.valueOf(id));
        return new AjaxResult(1,"否决完毕！",null);
    }

    @Override
    public AjaxResult adoptApplyUser(HttpServletRequest request) {
        String id = request.getParameter("id");
        userMapper.changeToSeller(Integer.valueOf(id));
        return new AjaxResult(1,"通过完毕！",null);
    }

    @Override
    public List<User> selectAllUsers() {
        return userMapper.selectAllUsers();
    }

    @Override
    public Integer editUser(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String autograph = request.getParameter("autograph");
        Integer userId = Integer.valueOf(id);
        User user = userMapper.selectUserById(userId);
        user.setName(name);
        user.setPhone(phone);
        user.setAddress(address);
        user.setAutograph(autograph);
        request.setAttribute("user",user);
        Map<String,Object> map = new HashMap<>();
        map.put("id",userId);
        map.put("name",name);
        map.put("phone",phone);
        map.put("address",address);
        map.put("autograph",autograph);
        return userMapper.editUser(map);
    }

    @Override
    public AjaxResult resetPassword(HttpServletRequest request) {
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        User user = userMapper.selectUserById(Integer.valueOf(id));
        String passwordInDB = PasswordMD5.md5Hex(user.getSalt() + password);
        Map<String,Object> map = new HashMap<>();
        map.put("id",id);
        map.put("password",passwordInDB);
        Integer result = userMapper.resetPassword(map);
        if(result==1){
            return new AjaxResult(1,"密码重置成功！",user);
        }else {
            return new AjaxResult(2,"密码重置失败！",user);
        }
    }

    @Override
    public User selectUserById(Integer id) {
        return userMapper.selectUserById(id);
    }

    @Override
    public AjaxResult deleteUser(HttpServletRequest request) {
        String id = request.getParameter("id");
        Integer result = userMapper.deleteUser(Integer.valueOf(id));
        if(result==1){
            return new AjaxResult(1,"账号冻结成功！",null);
        }else {
            return new AjaxResult(2,"账号冻结失败！",null);
        }
    }

    @Override
    public AjaxResult activeUser(HttpServletRequest request) {
        String id = request.getParameter("id");
        Integer result = userMapper.quitSeller(Integer.valueOf(id));
        if(result==1){
            return new AjaxResult(1,"账号激活成功！",null);
        }else {
            return new AjaxResult(2,"账号激活失败！",null);
        }
    }

    @Override
    public List<UserSexType> queryProportion() {
        Integer total = userMapper.countAll();
        Integer mNum = userMapper.countBySex(1);
        Integer fNum = userMapper.countBySex(2);
        List<UserSexType> list = new ArrayList<>();
        UserSexType u1 = new UserSexType();
        UserSexType u2 = new UserSexType();
        u1.setSex("男性");
        u2.setSex("女性");
        u1.setProportion((float)mNum/total);
        u2.setProportion((float)fNum/total);
        list.add(u1);
        list.add(u2);
        return list;
    }

    @Override
    public List<UserSexType> queryTypeProportion() {
        Integer total = userMapper.countAll();
        Integer applyNum = userMapper.countByType(3);
        Integer buyerNum = userMapper.countByType(1);
        Integer sellerNum = userMapper.countByType(2);
        Integer vetoNum = userMapper.countByType(5);
        Integer adminNum = userMapper.countByType(4);
        UserSexType u1 = new UserSexType();
        UserSexType u2 = new UserSexType();
        UserSexType u3 = new UserSexType();
        UserSexType u4 = new UserSexType();
        UserSexType u5 = new UserSexType();
        u1.setSex("买家用户");
        u1.setProportion((float)buyerNum/total);
        u2.setSex("申请卖家用户");
        u2.setProportion((float)applyNum/total);
        u3.setSex("卖家用户");
        u3.setProportion((float)sellerNum/total);
        u4.setSex("冻结用户");
        u4.setProportion((float)vetoNum/total);
        u5.setSex("管理员");
        u5.setProportion((float)adminNum/total);
        List<UserSexType> list = new ArrayList<>();
        list.add(u1);
        list.add(u2);
        list.add(u3);
        list.add(u4);
        list.add(u5);
        return list;
    }

    @Override
    public AjaxResult deleteAdmins(HttpServletRequest request) {
        String adminIds = request.getParameter("ids");
        String arr[] = adminIds.split(",");
        List<Integer> list = new ArrayList<>();
        for(String id:arr){
            list.add(Integer.valueOf(id));
        }
        Integer result = userMapper.deleteAdmins(list);
        if(result == arr.length){
            return new AjaxResult(1,"批量删除成功！",null);
        }else {
            return new AjaxResult(2,"批量删除失败！",null);
        }
    }

    @Override
    public List<User> selectUnDelAdminList() {
        return userMapper.selectUnDelAdminList();
    }

    @Override
    public AjaxResult addAdmin(HttpServletRequest request) {
        String password = request.getParameter("password");
        String salt = CoreUtils.salt();
        String passwordInDB = PasswordMD5.md5Hex(salt + password);
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        String autograph = request.getParameter("autograph");
        User user = new User();
        user.setName(name);
        user.setPhone(phone);
        user.setPassword(passwordInDB);
        user.setAutograph(autograph);
        user.setSex(Integer.valueOf(sex));
        user.setSalt(salt);
        Integer result = userMapper.addAdmin(user);
        if(result == 1){
            return new AjaxResult(1,"添加成功！",null);
        }else{
            return new AjaxResult(2,"添加失败！",null);
        }
    }

    @Override
    public AjaxResult editAdmin(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        String autograph = request.getParameter("autograph");
        User user = new User();
        user.setId(Integer.valueOf(id));
        user.setName(name);
        user.setPhone(phone);
        user.setAutograph(autograph);
        user.setSex(Integer.valueOf(sex));
        Integer result = userMapper.editAdmin(user);
        if(result == 1){
            return new AjaxResult(1,"修改信息成功！",null);
        }else{
            return new AjaxResult(2,"修改信息失败！",null);
        }
    }

    @Override
    public AjaxResult editSelf(HttpServletRequest request) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        String autograph = request.getParameter("autograph");
        String password = request.getParameter("password");
        User user = userMapper.selectUserById(Integer.valueOf(id));
        String salt = user.getSalt();
        String passwordInDB = PasswordMD5.md5Hex(salt + password);
        user.setName(name);
        user.setPhone(phone);
        user.setAutograph(autograph);
        user.setSex(Integer.valueOf(sex));
        user.setPassword(passwordInDB);
        Integer result = userMapper.editSelf(user);
        if(result == 1){
            return new AjaxResult(1,"修改信息成功！",null);
        }else{
            return new AjaxResult(2,"修改信息失败！",null);
        }
    }

    @Override
    public AjaxResult controlAdmin(HttpServletRequest request, Integer type) {
        String id = request.getParameter("id");
        Map<String,Object> map = new HashMap<>();
        map.put("id",id);
        map.put("type",type);
        Integer result = userMapper.controlAdmin(map);
        if(result == 1){
            return new AjaxResult(1,"停用成功！",null);
        }else{
            return new AjaxResult(2,"停用失败！",null);
        }
    }
}
