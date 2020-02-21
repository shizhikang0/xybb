package com.xybb.crud.service.impl;

import com.xybb.common.utils.Constants;
import com.xybb.common.utils.CoreUtils;
import com.xybb.crud.bean.User;
import com.xybb.crud.dao.UserMapper;
import com.xybb.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User selectUserById(Integer id) {
        User user = userMapper.selectUserById(id);
        user.setPassword(null);
        return user;
    }

    @Override
    public User updateUserInfo(CommonsMultipartFile file, HttpServletRequest request) {
        String sid = request.getParameter("id");
        Integer id = Integer.valueOf(sid);
        String name = request.getParameter("name");
        String ssex = request.getParameter("sex");
        Integer sex = Integer.valueOf(ssex);
        String address = request.getParameter("address");
        String autograph = request.getParameter("autograph");
        String oldName = file.getOriginalFilename();

        String newFileName = CoreUtils.salt()+oldName;
        String path = request.getServletContext().getRealPath("/static/images")+"/head/";
        File f = new File(path);
        if(!f.exists()){
            f.mkdir();
        }
        if (!file.isEmpty()) {
            try {
                FileOutputStream fos = new FileOutputStream(path + newFileName);
                InputStream in = file.getInputStream();
                int b = 0;
                while ((b = in.read()) != -1) {
                    fos.write(b);
                }
                fos.close();
                in.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Map<String,Object> map = new HashMap<>();
        map.put("id",id);
        map.put("name",name);
        map.put("sex",sex);
        map.put("address",address);
        map.put("autograph",autograph);
        map.put("head", Constants.HEAD_PATH+newFileName);
        userMapper.updateUserInfo(map);

        return userMapper.selectUserById(id);
    }

    @Override
    public User changeToSeller(Integer id) {
        userMapper.changeToSeller(id);
        return userMapper.selectUserById(id);
    }

    @Override
    public User quitSeller(Integer id) {
        userMapper.quitSeller(id);
        return userMapper.selectUserById(id);
    }
}
