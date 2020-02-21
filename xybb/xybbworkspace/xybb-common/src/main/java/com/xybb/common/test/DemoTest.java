package com.xybb.common.test;

import com.xybb.common.utils.FtpUtils;
import org.joda.time.DateTime;
import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class DemoTest {

    @Test
    public void testFTP() {
        try {
            FileInputStream in=new FileInputStream(new File("C:\\Users\\SHIZHIKANG\\Downloads\\thinkpad520.jpg"));
            boolean flag = FtpUtils.uploadFile(new DateTime().toString("/yyyy/MM/dd"), "thinkpad522.jpg", in);
            System.out.println(flag);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testStringIndex(){
        String url = "/xybb/goods/preBuy";
        System.out.println(url.length());
        System.out.println(url.lastIndexOf(".do"));
    }
}
