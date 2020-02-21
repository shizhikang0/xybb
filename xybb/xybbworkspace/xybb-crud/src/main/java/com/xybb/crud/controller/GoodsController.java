package com.xybb.crud.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xybb.common.utils.AjaxResult;
import com.xybb.common.utils.Constants;
import com.xybb.crud.bean.Goods;
import com.xybb.crud.bean.GoodsType;
import com.xybb.crud.bean.User;
import com.xybb.crud.result.GoodsResult;
import com.xybb.crud.service.GoodsBuyerService;
import com.xybb.crud.service.GoodsService;
import com.xybb.crud.service.GoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private GoodsTypeService goodsTypeService;

    @Autowired
    private GoodsBuyerService goodsBuyerService;

    @ModelAttribute(value = "goodsTypes")
    public void getGoodsTypeList(Model model){
        List<GoodsType> goodsTypeList = goodsTypeService.selectAll();
        model.addAttribute("goodsTypeList",goodsTypeList);
    }

    @RequestMapping("/")
    public String index(HttpServletRequest request){
        return returnIndex(request);
    }

    @RequestMapping("/index")
    public String enter(HttpServletRequest request){
        return returnIndex(request);
    }

    public String returnIndex(HttpServletRequest request) {
        List<Goods> broadcastList = goodsService.selectBroadCastList();

        List<Goods> popularList = goodsService.selectPopularList();
        List<Goods> newList = goodsService.selectNewList();
        for(int i = 0;i<broadcastList.size();i++){
            request.setAttribute("broadcast"+i,broadcastList.get(i));
        }
        request.setAttribute("popularList",popularList);
        request.setAttribute("newList",newList);
        return "index";
    }

    @RequestMapping(value = "/goods/{goodsTypeId}/{pn}",method = RequestMethod.GET)
    public ModelAndView showGoods(@PathVariable("goodsTypeId") Integer goodsTypeId, @PathVariable("pn") Integer pn, ModelAndView mv){
        mv.setViewName("goods");
        PageHelper.startPage(pn, Constants.PAGE_SIZE,true);
        List<Goods> goodsList = goodsService.queryGoodsByType(goodsTypeId);
        PageInfo<Goods> pageInfo = new PageInfo<>(goodsList,Constants.PAGE_SIZE);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("goodsTypeId",goodsTypeId);
        return mv;
    }

    @RequestMapping(value = "/goodsSearch/{pn}",method = RequestMethod.POST)
    public ModelAndView goodsSearch(HttpServletRequest request, @PathVariable("pn") Integer pn, ModelAndView mv){
        mv.setViewName("goods");
        PageHelper.startPage(pn, Constants.PAGE_SIZE,true);
        String search = request.getParameter("search");
        List<Goods> goodsList = goodsService.queryGoodsByKeyword(search);
        PageInfo<Goods> pageInfo = new PageInfo<>(goodsList,Constants.PAGE_SIZE);
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

    @RequestMapping(value = "/goodsDetail/{goodsId}",method = RequestMethod.GET)
    public ModelAndView showGoodsDetail(@PathVariable("goodsId") Integer goodsId,ModelAndView mv){
        mv.setViewName("goodsDetail");
        GoodsResult goodsResult = goodsService.selectGoodsResultById(goodsId);
        GoodsType goodsType = goodsResult.getGoodsType();
        Integer typeId = goodsType.getId();
        List<Goods> commondList = goodsService.selectCommondGoodsList(typeId);
        mv.addObject("commonList",commondList);
        mv.addObject("goods",goodsResult);
        return mv;
    }

    @RequestMapping("/goods/uploadGoods")
    @ResponseBody
    public AjaxResult uploadGoods(HttpServletRequest request,@RequestParam("files") MultipartFile[] files){
        goodsService.uploadGoods(request,files);
        return new AjaxResult(1,"商品信息提交成功，请等待审核！",null);
    }

    @RequestMapping("/goods/{goodsId}/preBuy.do")
    @ResponseBody
    public AjaxResult preBuy(@PathVariable("goodsId") Integer goodsId, HttpServletRequest request){
        User buyer = (User)request.getAttribute("user");
        Integer buyerId = buyer.getId();
        Integer result = goodsBuyerService.preBuy(goodsId,buyerId);
        if(result > 0){
            return new AjaxResult(1,"已放入购物车",null);
        }
        return new AjaxResult(2,"未放入购物车",null);
    }

    @RequestMapping("/goods/cancelPreBuy/{id}")
    @ResponseBody
    public AjaxResult cancelPreBuy(@PathVariable("id") Integer id, HttpServletRequest request){
        return goodsBuyerService.cancelPreBuy(id,request);
    }

    @RequestMapping("/goods/finishBuy/{id}")
    @ResponseBody
    public AjaxResult finishBuy(@PathVariable("id") Integer id, HttpServletRequest request){
        return goodsBuyerService.finishBuy(id,request);
    }

    @RequestMapping("/goods/cancelPreBuyAll/{userId}")
    @ResponseBody
    public AjaxResult cancelPreBuyAll(@PathVariable("userId") Integer userId){
        return goodsBuyerService.cancelPreBuyAll(userId);
    }
}
