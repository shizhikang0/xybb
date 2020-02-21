package com.xybb.crud.dao;

import com.xybb.crud.bean.GoodsSeller;
import com.xybb.crud.result.GoodsSellerResult;

import java.util.List;

public interface GoodsSellerMapper {

    GoodsSellerResult selectGoodsSellerByGoodsId(Integer goodsId);

    void insertOne(GoodsSeller goodsSeller);

    List<GoodsSellerResult> selectListByUserId(Integer sellerId);

    Integer updateSellStatus(GoodsSeller goodsSeller);
}