package com.xybb.common.utils;

import java.io.Serializable;

public class AjaxResult<T> implements Serializable {
    private Integer status;  //1成功；2失败
    private String msg;
    private T data;

    public AjaxResult() {
    }

    public AjaxResult(Integer status, String msg, T data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
