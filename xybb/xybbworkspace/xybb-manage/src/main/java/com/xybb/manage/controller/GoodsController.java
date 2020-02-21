package com.xybb.manage.controller;

import com.xybb.common.utils.AjaxResult;
import com.xybb.manage.result.GoodsResult;
import com.xybb.manage.result.GoodsTypeResult;
import com.xybb.manage.result.UserSexType;
import com.xybb.manage.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

@Controller
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/goodsList")
    public String selectGoodsList(HttpServletRequest request){
        List<GoodsResult> goodsResultList = goodsService.selectAllGoods();
        request.setAttribute("goodsList",goodsResultList);
        return "goods_list";
    }

    @RequestMapping("goodsExamine")
    public String selectGoodsExam(HttpServletRequest request){
        List<GoodsResult> goodsResultList = goodsService.selectExamineGoods();
        request.setAttribute("goodsList",goodsResultList);
        return "goods_examine_list";
    }

    @RequestMapping("/queryGoodsByCondition")
    public String queryGoodsByCondition(HttpServletRequest request) throws ParseException {
        List<GoodsResult> goodsResultList = goodsService.queryGoodsByCondition(request);
        request.setAttribute("goodsList",goodsResultList);
        return "goods_list";
    }

    @RequestMapping("/goods/veto")
    @ResponseBody
    public AjaxResult vetoGoods(HttpServletRequest request){
        return goodsService.vetoGoods(request);
    }

    @RequestMapping("/goods/adopt")
    @ResponseBody
    public AjaxResult adoptGoods(HttpServletRequest request){
        return goodsService.adoptGoods(request);
    }

    @RequestMapping("/goodsTypeBranch")
    public String getCharts5(HttpServletRequest request){
        List<GoodsTypeResult> goodsTypeResultList = goodsService.queryProportion();
        request.setAttribute("goodsTypeResultList",goodsTypeResultList);
        return "goods_type_branch";
    }

}
