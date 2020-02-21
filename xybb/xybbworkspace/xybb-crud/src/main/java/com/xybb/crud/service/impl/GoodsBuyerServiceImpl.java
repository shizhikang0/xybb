package com.xybb.crud.service.impl;

import com.xybb.common.utils.AjaxResult;
import com.xybb.crud.bean.GoodsBuyer;
import com.xybb.crud.bean.GoodsSeller;
import com.xybb.crud.bean.User;
import com.xybb.crud.dao.GoodsBuyerMapper;
import com.xybb.crud.dao.GoodsMapper;
import com.xybb.crud.dao.GoodsSellerMapper;
import com.xybb.crud.result.GoodsBuyerResult;
import com.xybb.crud.service.GoodsBuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class GoodsBuyerServiceImpl implements GoodsBuyerService {

    @Autowired
    private GoodsBuyerMapper goodsBuyerMapper;

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private GoodsSellerMapper goodsSellerMapper;

    @Override
    public Integer preBuy(Integer goodsId, Integer buyerId) {
        GoodsBuyer goodsBuyer = new GoodsBuyer();
        goodsBuyer.setGoodsId(goodsId);
        goodsBuyer.setBuyerId(buyerId);
        Integer result = goodsBuyerMapper.updateOne(goodsBuyer);
        if (result > 0){
            return result;
        }
        return goodsBuyerMapper.insertOne(goodsBuyer);
    }

    @Override
    public AjaxResult cancelPreBuy(Integer goodsId, HttpServletRequest request) {
        User user = (User)request.getAttribute("user");
        if (user != null){
            Integer userId = user.getId();
            GoodsBuyer goodsBuyer = new GoodsBuyer();
            goodsBuyer.setBuyerId(userId);
            goodsBuyer.setGoodsId(goodsId);
            Integer result = goodsBuyerMapper.cancelPreBuy(goodsBuyer);
            if(result == 1){
                return new AjaxResult(1,"成功取消了购买！",result);
            }
        }
        return new AjaxResult(2,"未取消购买！",null);
    }

    @Override
    public AjaxResult finishBuy(Integer goodsId, HttpServletRequest request) {
        User user = (User)request.getAttribute("user");
        if (user != null){
            Integer userId = user.getId();
            GoodsBuyer goodsBuyer = new GoodsBuyer();
            goodsBuyer.setBuyerId(userId);
            goodsBuyer.setGoodsId(goodsId);
            Integer result = goodsBuyerMapper.finshBuy(goodsBuyer);
            goodsMapper.updateGoodsType(goodsId,4);
            GoodsSeller goodsSeller=new GoodsSeller();
            goodsSeller.setStatus(2);
            goodsSeller.setGoodsId(goodsId);
            goodsSellerMapper.updateSellStatus(goodsSeller);
            if(result == 1){
                return new AjaxResult(1,"完成购买！",result);
            }
        }
        return new AjaxResult(2,"购买失败！",null);
    }

    @Override
    public AjaxResult cancelPreBuyAll(Integer userId) {
        Integer result = goodsBuyerMapper.cancelPreBuyAll(userId);
        if(result > 0){
            return new AjaxResult(1,"您已清空购物车",result);
        }
        return new AjaxResult(2,"您的购物车内没有东西",result);
    }

    @Override
    public List<GoodsBuyerResult> selectListByUserId(Integer id, Integer status) {
        GoodsBuyer goodsBuyer = new GoodsBuyer();
        goodsBuyer.setBuyerId(id);
        goodsBuyer.setStatus(status);
        return goodsBuyerMapper.selectListByUserId(goodsBuyer);
    }

    @Override
    public List<GoodsBuyerResult> selectAllListByUserId(Integer id) {
        GoodsBuyer goodsBuyer = new GoodsBuyer();
        goodsBuyer.setBuyerId(id);
        return goodsBuyerMapper.selectListByUserId(goodsBuyer);
    }
}
