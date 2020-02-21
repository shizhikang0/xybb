package com.xybb.manage.dao;

import com.xybb.common.utils.AjaxResult;
import com.xybb.manage.bean.Goods;
import com.xybb.manage.result.GoodsResult;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface GoodsMapper {

    List<Goods> queryGoodsByType(Integer goodsTypeId);

    GoodsResult selectGoodsResultById(Integer goodsId);

    Goods selectGoodsById(Integer goodsId);

    @Update("UPDATE t_goods SET page_views = page_views + 1 WHERE id = #{goodsId}")
    void addPageViewsById(Integer goodsId);

    void insertGoods(Goods goods);

    List<Goods> selectBroadCastList();

    List<Goods> selectPopularList();

    List<Goods> selectNewList();

    List<Goods> selectPreBuyListByUserId(Integer userId);

    @Select("SELECT * FROM t_goods WHERE type_id = #{typeId} AND status = 1 ORDER BY updatetime DESC LIMIT 0,3")
    List<Goods> selectCommondGoodsList(Integer typeId);

    List<GoodsResult> selectAllGoods();

    List<GoodsResult> selectExamineGoods();

    List<GoodsResult> queryGoodsByCondition(Map<String, Object> map);

    Integer vetoGoods(Integer goodsId);

    Integer adoptGoods(Integer goodsId);

    @Select("SELECT count(0) FROM t_goods")
    Integer countAll();

    @Select("SELECT count(0) FROM t_goods WHERE type_id = #{typeId}")
    Integer countByType(Integer typeId);
}