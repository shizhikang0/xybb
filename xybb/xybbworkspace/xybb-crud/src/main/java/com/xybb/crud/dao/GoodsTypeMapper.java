package com.xybb.crud.dao;

import com.xybb.crud.bean.GoodsType;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface GoodsTypeMapper {

    @Select("SELECT id,name FROM t_goods_type")
    List<GoodsType> selectAll();
}