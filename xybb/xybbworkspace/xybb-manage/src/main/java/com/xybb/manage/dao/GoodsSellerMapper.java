package com.xybb.manage.dao;


import com.xybb.manage.bean.GoodsSeller;
import com.xybb.manage.result.GoodsSellerResult;

import java.util.List;

public interface GoodsSellerMapper {

    GoodsSellerResult selectGoodsSellerByGoodsId(Integer goodsId);

    void insertOne(GoodsSeller goodsSeller);

    List<GoodsSellerResult> selectListByUserId(Integer sellerId);
}