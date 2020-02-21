package com.xybb.manage.service.impl;

import com.xybb.common.utils.AjaxResult;
import com.xybb.manage.bean.GoodsType;
import com.xybb.manage.dao.GoodsMapper;
import com.xybb.manage.dao.GoodsTypeMapper;
import com.xybb.manage.result.GoodsResult;
import com.xybb.manage.result.GoodsTypeResult;
import com.xybb.manage.result.UserSexType;
import com.xybb.manage.service.GoodsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private GoodsTypeMapper goodsTypeMapper;

    @Override
    public List<GoodsResult> selectAllGoods() {
        return goodsMapper.selectAllGoods();
    }

    @Override
    public List<GoodsResult> selectExamineGoods() {
        return goodsMapper.selectExamineGoods();
    }

    @Override
    public List<GoodsResult> queryGoodsByCondition(HttpServletRequest request) throws ParseException {
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String name = request.getParameter("name");
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
        Date sTime = null;
        Date eTime = null;
        if(!StringUtils.isBlank(startTime)){
            sTime = sdf.parse(startTime);
        }
        if(!StringUtils.isBlank(endTime)){
            eTime = sdf.parse(endTime);
        }
        Map<String,Object> map = new HashMap<>();
        map.put("name",name);
        map.put("sTime",sTime);
        map.put("eTime",eTime);
        request.setAttribute("startTime",startTime);
        request.setAttribute("endTime",endTime);
        request.setAttribute("name",name);
        return goodsMapper.queryGoodsByCondition(map);
    }

    @Override
    public AjaxResult vetoGoods(HttpServletRequest request) {
        String id = request.getParameter("id");
        Integer goodsId = Integer.valueOf(id);
        Integer result = goodsMapper.vetoGoods(goodsId);
        if(result==1){
            return new AjaxResult(1,"否决成功！",null);
        }else {
            return new AjaxResult(2,"否决失败！",null);
        }
    }

    @Override
    public AjaxResult adoptGoods(HttpServletRequest request) {
        String id = request.getParameter("id");
        Integer goodsId = Integer.valueOf(id);
        Integer result = goodsMapper.adoptGoods(goodsId);
        if(result==1){
            return new AjaxResult(1,"通过成功！",null);
        }else {
            return new AjaxResult(2,"通过失败！",null);
        }
    }

    @Override
    public List<GoodsTypeResult> queryProportion() {
        List<GoodsTypeResult> list = new ArrayList<>();
        List<GoodsType> goodsTypeList = goodsTypeMapper.selectAll();
        for(GoodsType goodsType:goodsTypeList){
            Integer typeId = goodsType.getId();
            Integer num = goodsMapper.countByType(typeId);
            GoodsTypeResult result = new GoodsTypeResult();
            result.setName(goodsType.getName());
            result.setNum(num);
            list.add(result);
        }
        return list;
    }

}
