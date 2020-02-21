package com.xybb.crud.listener;

import com.xybb.common.utils.FtpUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("================================================================init=====================================================================");
//        FtpUtils.init();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("===========================================================close==============================================");
        FtpUtils.close();
    }
}
