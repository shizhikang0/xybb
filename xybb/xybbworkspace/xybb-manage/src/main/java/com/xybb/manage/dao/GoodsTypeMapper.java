package com.xybb.manage.dao;

import com.xybb.manage.bean.GoodsType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GoodsTypeMapper {

    @Select("SELECT id,name FROM t_goods_type")
    List<GoodsType> selectAll();

    @Select("SELECT id FROM t_goods_type")
    List<Integer> selectAllTypeId();
}