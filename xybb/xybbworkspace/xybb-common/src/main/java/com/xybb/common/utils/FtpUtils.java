package com.xybb.common.utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

public class FtpUtils {

    private static FTPClient ftp;

    public static void init() {
        ftp = new FTPClient();
        ftp.setControlEncoding("UTF-8");
        try {
            int reply;
            ftp.connect(Constants.HOST_IP, Constants.PORT);// 连接FTP服务器
            ftp.login(Constants.LOGIN_NAME, Constants.LOGIN_PASSWORD);// 登录
            reply = ftp.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftp.disconnect();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Description: 向FTP服务器上传文件
     * @param filePath FTP服务器文件存放路径。例如分日期存放：/2015/01/01。文件的路径为basePath+filePath
     * @param filename 上传到FTP服务器上的文件名
     * @param input 输入流
     * @return 成功返回true，否则返回false
     */
    public static boolean uploadFile(String filePath, String filename, InputStream input) {
        boolean result = false;
        try {
            //切换到上传目录
            if (!ftp.changeWorkingDirectory(Constants.BASE_PATH+filePath)) {
                //如果目录不存在创建目录
                String[] dirs = filePath.split("/");
                String tempPath = Constants.BASE_PATH;
                for (String dir : dirs) {
                    if (null == dir || "".equals(dir)) continue;
                    tempPath += "/" + dir;
                    if (!ftp.changeWorkingDirectory(tempPath)) {
                        if (!ftp.makeDirectory(tempPath)) {
                            return result;
                        } else {
                            ftp.changeWorkingDirectory(tempPath);
                        }
                    }
                }
            }
            //设置上传文件的类型为二进制类型
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            //上传文件
            if (!ftp.storeFile(filename, input)) {
                return result;
            }
            input.close();
            result = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void close(){
        try {
            ftp.logout();
            ftp.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
