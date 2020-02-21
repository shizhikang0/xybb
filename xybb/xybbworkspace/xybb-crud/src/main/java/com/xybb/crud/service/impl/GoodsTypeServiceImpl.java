package com.xybb.crud.service.impl;

import com.xybb.crud.bean.GoodsType;
import com.xybb.crud.dao.GoodsTypeMapper;
import com.xybb.crud.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Autowired
    private GoodsTypeMapper goodsTypeMapper;

    @Override
    public List<GoodsType> selectAll() {
        return goodsTypeMapper.selectAll();
    }
}
