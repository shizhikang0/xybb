package com.xybb.crud.service;

import com.xybb.common.utils.AjaxResult;
import com.xybb.crud.bean.Goods;
import com.xybb.crud.result.GoodsSellerResult;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface GoodsSellerService {
    List<GoodsSellerResult> selectListByUserId(Integer id);

    AjaxResult updateSellStatus(HttpServletRequest request, Integer status);
}
