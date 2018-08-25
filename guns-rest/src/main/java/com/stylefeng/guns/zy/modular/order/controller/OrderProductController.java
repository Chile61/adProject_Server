package com.stylefeng.guns.zy.modular.order.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.model.ProductImage;
import com.stylefeng.guns.rest.common.persistence.model.ProductParam;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.dao.warpper.OrderProductWarpper;
import com.stylefeng.guns.zy.modular.shop.service.IProductImageService;
import com.stylefeng.guns.zy.modular.shop.service.IProductParamService;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.OrderProduct;
import com.stylefeng.guns.zy.modular.order.service.IOrderProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 定单信息控制器
 *
 * @author fengshuonan
 * @Date 2018-05-06 12:22:31
 */
@Controller
@RequestMapping("/orderProduct")
public class OrderProductController extends BaseController {

    private String PREFIX = "/order/orderProduct/";

    @Autowired
    private IOrderProductService orderProductService;

    @Autowired
    private IProductImageService productImageService;

    @Autowired
    private IProductParamService productParamService;

    @Autowired
    ZyUtil zyUtil;
    /**
     * 跳转到定单信息首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "orderProduct.html";
    }

    /**
     * 跳转到添加定单信息
     */
    @RequestMapping("/orderProduct_add")
    public String orderProductAdd() {
        return PREFIX + "orderProduct_add.html";
    }

    /**
     * 跳转到修改定单信息
     */
    @RequestMapping("/orderProduct_update/{orderProductId}")
    public String orderProductUpdate(@PathVariable Integer orderProductId, Model model) {
        OrderProduct orderProduct = orderProductService.selectById(orderProductId);
        model.addAttribute("item",orderProduct);
        //LogObjectHolder.me().set(orderProduct);
        return PREFIX + "orderProduct_edit.html";
    }

    /**
     * 获取定单信息列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return orderProductService.selectList(null);
    }



    /**
     * 获取定单商品列表
     */
    @ApiOperation(value="获取定单商品列表", notes="获取定单商品列表")
    @ApiImplicitParam(name = "orderId", value = "订单号", required = true, dataType = "int", paramType="query")
    @RequestMapping(value = "/orderProductList", method=RequestMethod.POST)
    @ResponseBody
    public Object orderProductList(@RequestHeader String Authorization, @RequestParam String orderId) {
        User currentUser = zyUtil.getUserModel(Authorization);
        if (currentUser==null){
            Map<String, Object> standardMap = new HashMap<>();
            standardMap.put("status", 0);
            return standardMap;
        }
        List<Map<String, Object>> orderProducts;
        if (orderId!=null){
            orderProducts = orderProductService.selectMaps(new EntityWrapper<OrderProduct>().eq("orderId",orderId));
            for (Map<String, Object> aProductList : orderProducts) {
                Integer productId = (Integer) aProductList.get("productId");

                EntityWrapper<ProductImage> wrapperImage = new EntityWrapper<>();
                wrapperImage.eq("productId", productId);
                List<ProductImage> productImageList = productImageService.selectList(wrapperImage);
                aProductList.put("productImage",productImageList);

                EntityWrapper<ProductParam> wrapperParam = new EntityWrapper<>();
                wrapperParam.eq("productId", productId);
                List<ProductParam> productParamList = productParamService.selectList(wrapperParam);
                aProductList.put("productParam",productParamList);
            }
        }else{
            Map<String, Object> standardMap = new HashMap<>();
            standardMap.put("status", 0);
            return standardMap;
        }
        Object objects = new OrderProductWarpper(orderProducts).warp();
        return  super.returnStandardResult("data",objects);
    }
    /**
     * 新增定单信息
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(OrderProduct orderProduct) {
        orderProductService.insert(orderProduct);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除定单信息
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer orderProductId) {
        orderProductService.deleteById(orderProductId);
        return SUCCESS_TIP;
    }

    /**
     * 修改定单信息
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(OrderProduct orderProduct) {
        orderProductService.updateById(orderProduct);
        return super.SUCCESS_TIP;
    }

    /**
     * 定单信息详情
     */
    @RequestMapping(value = "/detail/{orderProductId}")
    @ResponseBody
    public Object detail(@PathVariable("orderProductId") Integer orderProductId) {
        return orderProductService.selectById(orderProductId);
    }
}
