package com.xybb.manage.service;

import com.xybb.common.utils.AjaxResult;
import com.xybb.manage.result.GoodsResult;
import com.xybb.manage.result.GoodsTypeResult;
import com.xybb.manage.result.UserSexType;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

public interface GoodsService {
    List<GoodsResult> selectAllGoods();

    List<GoodsResult> selectExamineGoods();

    List<GoodsResult> queryGoodsByCondition(HttpServletRequest request) throws ParseException;

    AjaxResult vetoGoods(HttpServletRequest request);

    AjaxResult adoptGoods(HttpServletRequest request);

    List<GoodsTypeResult> queryProportion();
}
