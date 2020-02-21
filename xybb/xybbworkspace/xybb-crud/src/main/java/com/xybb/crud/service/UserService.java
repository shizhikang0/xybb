package com.xybb.crud.service;

import com.xybb.crud.bean.User;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

    User selectUserById(Integer id);

    User updateUserInfo(CommonsMultipartFile file, HttpServletRequest request);

    User changeToSeller(Integer id);

    User quitSeller(Integer id);
}
