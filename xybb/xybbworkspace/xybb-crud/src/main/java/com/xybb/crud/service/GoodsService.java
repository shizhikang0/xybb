package com.xybb.crud.service;

import com.xybb.common.utils.AjaxResult;
import com.xybb.crud.bean.Goods;
import com.xybb.crud.result.GoodsResult;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface GoodsService {

    List<Goods> queryGoodsByType(Integer goodsTypeId);

    GoodsResult selectGoodsResultById(Integer goodsId);

    void uploadGoods(HttpServletRequest request, MultipartFile[] files);

    List<Goods> selectBroadCastList();

    List<Goods> selectPopularList();

    List<Goods> selectNewList();

    List<Goods> selectPreBuyListByUserId(Integer userId);

    List<Goods> selectCommondGoodsList(Integer typeId);

    List<Goods> queryGoodsByKeyword(String search);
}
