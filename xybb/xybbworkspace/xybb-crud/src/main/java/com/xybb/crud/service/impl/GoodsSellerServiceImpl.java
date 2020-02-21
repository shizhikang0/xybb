package com.xybb.crud.service.impl;

import com.xybb.common.utils.AjaxResult;
import com.xybb.crud.bean.GoodsSeller;
import com.xybb.crud.dao.GoodsSellerMapper;
import com.xybb.crud.result.GoodsSellerResult;
import com.xybb.crud.service.GoodsSellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class GoodsSellerServiceImpl implements GoodsSellerService {

    @Autowired
    private GoodsSellerMapper goodsSellerMapper;

    @Override
    public List<GoodsSellerResult> selectListByUserId(Integer id) {
        return goodsSellerMapper.selectListByUserId(id);
    }

    @Override
    public AjaxResult updateSellStatus(HttpServletRequest request, Integer status) {
        String goodsId = request.getParameter("goodsId");
        String userId = request.getParameter("userId");
        GoodsSeller goodsSeller = new GoodsSeller();
        goodsSeller.setSellerId(Integer.valueOf(userId));
        goodsSeller.setGoodsId(Integer.valueOf(goodsId));
        goodsSeller.setStatus(status);
        Integer result = goodsSellerMapper.updateSellStatus(goodsSeller);
        if(result == 1){
            return new AjaxResult(1,"下架商品成功！",null);
        }else{
            return new AjaxResult(2,"下架商品失败！",null);
        }
    }
}
