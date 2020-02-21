package com.xybb.manage.result;

import java.util.List;

public class UserType {
    private String type;
    private List<SexGoodsTypeNum> sexGoodsTypeNumList;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<SexGoodsTypeNum> getSexGoodsTypeNumList() {
        return sexGoodsTypeNumList;
    }

    public void setSexGoodsTypeNumList(List<SexGoodsTypeNum> sexGoodsTypeNumList) {
        this.sexGoodsTypeNumList = sexGoodsTypeNumList;
    }
}
