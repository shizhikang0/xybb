package com.xybb.crud.service.impl;

import com.xybb.common.utils.CoreUtils;
import com.xybb.common.utils.FtpUtils;
import com.xybb.crud.bean.Goods;
import com.xybb.crud.bean.GoodsSeller;
import com.xybb.crud.dao.GoodsMapper;
import com.xybb.crud.dao.GoodsSellerMapper;
import com.xybb.crud.result.GoodsResult;
import com.xybb.crud.service.GoodsService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.*;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Value("${IMAGE_BASE_URL}")
    private String IMAGE_BASE_URL;

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private GoodsSellerMapper goodsSellerMapper;

    @Override
    public List<Goods> queryGoodsByType(Integer goodsTypeId) {
        return goodsMapper.queryGoodsByType(goodsTypeId);
    }

    @Override
    public List<Goods> queryGoodsByKeyword(String search) {
        return goodsMapper.queryGoodsByKeyword(search);
    }

    @Override
    public GoodsResult selectGoodsResultById(Integer goodsId) {
        goodsMapper.addPageViewsById(goodsId);
        return goodsMapper.selectGoodsResultById(goodsId);
    }

    @Override
    public void uploadGoods(HttpServletRequest request, MultipartFile[] files) {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String price = request.getParameter("price");
        String originalPrice = request.getParameter("originalPrice");
        String detail = request.getParameter("detail");
        String suserId = request.getParameter("userId");
        List<String> picPath = new ArrayList<>();
        for(MultipartFile file:files){
            try {
                InputStream in = file.getInputStream();
                String oldName = file.getOriginalFilename();
                String newName = CoreUtils.salt().substring(0,10)+oldName;
                String path = request.getServletContext().getRealPath("/static/images")+"/shops/";
                File f = new File(path);
                if(!f.exists()){
                    f.mkdir();
                }
                FileOutputStream fos = new FileOutputStream(path + newName);
                int b = 0;
                while ((b = in.read()) != -1) {
                    fos.write(b);
                }
                fos.close();
                in.close();
                picPath.add("http://localhost:8089/xybb/static/images/shops/" + newName);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Goods goods = new Goods();
        goods.setName(name);
        goods.setTypeId(Integer.valueOf(type));
        goods.setPrice(new BigDecimal(price));
        goods.setOriginalPrice(new BigDecimal(originalPrice));
        goods.setDetail(detail);
//        if(picPath.size()>0){
//            goods.setPicture1(picPath.get(0));
//        }
//        if(picPath.size()>1){
//            goods.setPicture2(picPath.get(1));
//        }
//        if(picPath.size()>2){
//            goods.setPicture3(picPath.get(2));
//        }

        //反射
        Class clazz = Goods.class;
        try {
            for(int i=1;i<=picPath.size();i++){
                Method method = clazz.getMethod("setPicture"+i,String.class);
                method.invoke(goods,picPath.get(i-1));
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        goodsMapper.insertGoods(goods);

        Integer goodsId = goods.getId();
        Integer userId = Integer.valueOf(suserId);
        GoodsSeller goodsSeller = new GoodsSeller();
        goodsSeller.setGoodsId(goodsId);
        goodsSeller.setSellerId(userId);
        goodsSellerMapper.insertOne(goodsSeller);
    }

    @Override
    public List<Goods> selectBroadCastList() {
        return goodsMapper.selectBroadCastList();
    }

    @Override
    public List<Goods> selectPopularList() {
        return goodsMapper.selectPopularList();
    }

    @Override
    public List<Goods> selectNewList() {
        return goodsMapper.selectNewList();
    }

    @Override
    public List<Goods> selectPreBuyListByUserId(Integer userId) {
        return goodsMapper.selectPreBuyListByUserId(userId);
    }

    @Override
    public List<Goods> selectCommondGoodsList(Integer typeId) {
        return goodsMapper.selectCommondGoodsList(typeId);
    }
}
