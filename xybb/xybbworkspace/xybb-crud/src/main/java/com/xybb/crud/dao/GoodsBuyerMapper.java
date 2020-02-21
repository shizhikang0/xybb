package com.xybb.crud.dao;

import com.xybb.crud.bean.GoodsBuyer;
import com.xybb.crud.result.GoodsBuyerResult;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface GoodsBuyerMapper {

    Integer insertOne(GoodsBuyer goodsBuyer);

    Integer cancelPreBuy(GoodsBuyer goodsBuyer);

    @Update("UPDATE t_goods_buyer SET status = 3,updatetime = now() WHERE buyer_id = #{userId}")
    Integer cancelPreBuyAll(Integer userId);

    Integer updateOne(GoodsBuyer goodsBuyer);

    List<GoodsBuyerResult> selectListByUserId(GoodsBuyer goodsBuyer);

    Integer finshBuy(GoodsBuyer goodsBuyer);
}