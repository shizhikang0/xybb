package com.xybb.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xybb.common.utils.AjaxResult;
import com.xybb.crud.bean.Goods;
import com.xybb.crud.bean.GoodsType;
import com.xybb.crud.bean.User;
import com.xybb.crud.result.GoodsBuyerResult;
import com.xybb.crud.result.GoodsSellerResult;
import com.xybb.crud.service.GoodsBuyerService;
import com.xybb.crud.service.GoodsSellerService;
import com.xybb.crud.service.GoodsTypeService;
import com.xybb.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private GoodsTypeService goodsTypeService;

    @Autowired
    private GoodsBuyerService goodsBuyerService;

    @Autowired
    private GoodsSellerService goodsSellerService;

    @ModelAttribute(value = "goodsTypes")
    public void getGoodsTypeList(Model model){
        List<GoodsType> typeList = goodsTypeService.selectAll();
        model.addAttribute("typeList",typeList);
    }

    @RequestMapping("/userInfo/{id}")
    public String goToUserInfo(HttpServletRequest request, @PathVariable("id") Integer id){
        User user = userService.selectUserById(id);
        request.setAttribute("user",user);
        return "userInfo";
    }

    @RequestMapping("/uploadUser")
    @ResponseBody
    public AjaxResult uploadUser(@RequestParam("avatar-2") CommonsMultipartFile file, HttpServletRequest request){
        User user = userService.updateUserInfo(file,request);
        if(null != user){
            request.setAttribute("user",user);
            return new AjaxResult(1,"保存成功！",user);
        }else{
            return new AjaxResult(2,"保存失败！",null);
        }
    }

    @RequestMapping("/changeToSeller/{id}")
    @ResponseBody
    public AjaxResult changeToSeller(@PathVariable("id") Integer id, HttpServletRequest request){
        User user = userService.changeToSeller(id);
        if(null != user){
            request.setAttribute("user",user);
            return new AjaxResult(1,"提交成功，请等待审核！",user);
        }else{
            return new AjaxResult(2,"开店失败！",null);
        }
    }

    @RequestMapping("/quitSeller/{id}")
    @ResponseBody
    public AjaxResult quitSeller(@PathVariable("id") Integer id, HttpServletRequest request){
        User user = userService.quitSeller(id);
        if(null != user){
            request.setAttribute("user",user);
            return new AjaxResult(1,"关店成功！",user);
        }else{
            return new AjaxResult(2,"关店失败！",null);
        }
    }

    @RequestMapping(value = "/sellGoods/{id}", method = RequestMethod.GET)
    public String sellGoods(@PathVariable("id") Integer id, HttpServletRequest request){
        User user = userService.selectUserById(id);
        request.setAttribute("user",user);
        request.setAttribute("goods",new Goods());
        return "sellGoods";
    }

    @RequestMapping("/preBuy/{id}/{pn}")
    public String preBuy(@PathVariable("id") Integer id,@PathVariable("pn") Integer pn, HttpServletRequest request){
        PageHelper.startPage(pn,3,true);
        List<GoodsBuyerResult> goodsBuyerList = goodsBuyerService.selectListByUserId(id,1);
        PageInfo<GoodsBuyerResult> pageInfo = new PageInfo<>(goodsBuyerList,3);
        request.setAttribute("pageInfo",pageInfo);
        return "goodsBuyer";
    }

    @RequestMapping("/allBuy/{id}/{pn}")
    public String allBuy(@PathVariable("id") Integer id,@PathVariable("pn") Integer pn, HttpServletRequest request){
        PageHelper.startPage(pn,3,true);
        List<GoodsBuyerResult> goodsBuyerList = goodsBuyerService.selectAllListByUserId(id);
        PageInfo<GoodsBuyerResult> pageInfo = new PageInfo<>(goodsBuyerList,3);
        request.setAttribute("pageInfo",pageInfo);
        return "goodsBuyerAll";
    }

    @RequestMapping("/onSaleGoods/{id}/{pn}")
    public String showOnSale(@PathVariable("id") Integer id,@PathVariable("pn") Integer pn, HttpServletRequest request){
        PageHelper.startPage(pn,3,true);
        List<GoodsSellerResult> goodsSellerResultList = goodsSellerService.selectListByUserId(id);
        PageInfo<GoodsSellerResult> pageInfo = new PageInfo<>(goodsSellerResultList,3);
        request.setAttribute("pageInfo",pageInfo);
        return "goodsSeller";
    }

    @RequestMapping("/cancelSell")
    @ResponseBody
    public AjaxResult cancelSell(HttpServletRequest request){
        return goodsSellerService.updateSellStatus(request,3);
    }
}
