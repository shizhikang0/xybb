package com.xybb.crud.service;

import com.xybb.common.utils.AjaxResult;
import com.xybb.crud.bean.GoodsBuyer;
import com.xybb.crud.result.GoodsBuyerResult;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface GoodsBuyerService {
    Integer preBuy(Integer goodsId, Integer buyerId);

    AjaxResult cancelPreBuy(Integer goodsId, HttpServletRequest request);

    AjaxResult cancelPreBuyAll(Integer userId);

    List<GoodsBuyerResult> selectListByUserId(Integer id, Integer status);

    List<GoodsBuyerResult> selectAllListByUserId(Integer id);

    AjaxResult finishBuy(Integer id, HttpServletRequest request);
}
