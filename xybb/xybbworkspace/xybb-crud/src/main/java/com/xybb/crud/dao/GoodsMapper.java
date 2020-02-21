package com.xybb.crud.dao;

import com.xybb.crud.bean.Goods;
import java.util.List;
import com.xybb.crud.result.GoodsResult;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface GoodsMapper {

    List<Goods> queryGoodsByType(Integer goodsTypeId);

    List<Goods> queryGoodsByKeyword(String search);

    GoodsResult selectGoodsResultById(Integer goodsId);

    Goods selectGoodsById(Integer goodsId);

    @Update("UPDATE t_goods SET page_views = page_views + 1 WHERE id = #{goodsId}")
    void addPageViewsById(Integer goodsId);

    void insertGoods(Goods goods);

    List<Goods> selectBroadCastList();

    List<Goods> selectPopularList();

    List<Goods> selectNewList();

    List<Goods> selectPreBuyListByUserId(Integer userId);

    @Select("SELECT * FROM t_goods WHERE type_id = #{typeId} AND status = 2 ORDER BY updatetime DESC LIMIT 0,3")
    List<Goods> selectCommondGoodsList(Integer typeId);

    @Update("UPDATE t_goods SET status = #{status} WHERE id = #{goodsId}")
    void updateGoodsType(@Param("goodsId") Integer goodsId, @Param("status") Integer status);
}