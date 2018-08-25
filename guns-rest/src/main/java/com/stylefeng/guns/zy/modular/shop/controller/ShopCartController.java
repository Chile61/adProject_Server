package com.stylefeng.guns.zy.modular.shop.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.model.*;
import com.stylefeng.guns.zy.modular.order.service.impl.OrderProductServiceImpl;
import com.stylefeng.guns.zy.modular.order.service.impl.OrderServiceImpl;
import com.stylefeng.guns.zy.modular.shop.service.IProductImageService;
import com.stylefeng.guns.zy.modular.shop.service.IProductParamService;
import com.stylefeng.guns.zy.modular.shop.service.IProductService;
import com.stylefeng.guns.zy.modular.user.service.impl.UserServiceImpl;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.zy.modular.shop.service.IShopCartService;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 购物车控制器
 *
 * @author fengshuonan
 * @Date 2018-01-18 14:16:54
 */
@Controller
@RequestMapping("/shopCart")
public class ShopCartController extends BaseController {

    private String PREFIX = "/Shop/shopCart/";

    @Autowired
    private IShopCartService shopCartService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IProductImageService productImageService;

    @Autowired
    private IProductParamService productParamService;

    @Autowired
    private OrderServiceImpl orderService;

    @Autowired
    private OrderProductServiceImpl orderProductService;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    ZyUtil zyUtil;

    /**
     * 跳转到购物车首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "shopCart.html";
    }

    /**
     * 跳转到修改购物车
     */
    @RequestMapping("/shopCart_update/{shopCartId}")
    public String shopCartUpdate(@PathVariable Integer shopCartId, Model model) {
        ShopCart shopCart = shopCartService.selectById(shopCartId);
        model.addAttribute("item", shopCart);
        //LogObjectHolder.me().set(shopCart);
        return PREFIX + "shopCart_edit.html";
    }

    /**
     * 添加到购物车
     */
    @ApiOperation(value = "获取购物车列表", notes = "获取购物车列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "productId", value = "商品Id", required = true, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "num", value = "数量", required = true, dataType = "string", paramType = "query")
    })
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object shopCartAdd(ShopCart shopCart,
                              @RequestHeader String Authorization,
                              @RequestParam Integer productId,
                              @RequestParam Integer num) {
        User user = zyUtil.getUserModel(Authorization);
        Integer userId = user.getId();

        EntityWrapper<ShopCart> wrapper = new EntityWrapper<>();
        wrapper.eq("productId", productId).eq("userId", userId);
        ShopCart shopCartInfo = shopCartService.selectOne(wrapper);

        if (shopCartInfo!=null){
            shopCart=shopCartInfo;
            shopCart.setNum(num);
        }else{
            shopCart.setUserId(userId);
            shopCart.setProductId(productId);
            shopCart.setNum(num);
        }

        Map<String, Object> standardMap = new HashMap<>();
        if (shopCartService.insertOrUpdate(shopCart)) {
            standardMap.put("status", 1);
        }else{
            standardMap.put("status", 0);
        }
        return standardMap;
    }

    /**
     * 获取购物车列表
     */
    @ApiOperation(value = "获取购物车列表", notes = "获取购物车列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);
        EntityWrapper<ShopCart> wrapper = new EntityWrapper<>();
        wrapper.eq("userId", user.getId());
        List<Map<String, Object>> shopCartList = shopCartService.selectMaps(wrapper);
        for (Map<String, Object> aShopCartList : shopCartList) {
            Integer productId = (Integer) aShopCartList.get("productId");

            EntityWrapper<Product> wrapperProduct = new EntityWrapper<>();
            wrapperProduct.eq("id", productId);
            Map<String, Object> productInfo = productService.selectMap(wrapperProduct);

            EntityWrapper<ProductImage> wrapperImage = new EntityWrapper<>();
            wrapperImage.eq("productId", productId);
            List<ProductImage> productImageList = productImageService.selectList(wrapperImage);
            productInfo.put("productImage", productImageList);

            EntityWrapper<ProductParam> wrapperParam = new EntityWrapper<>();
            wrapperParam.eq("productId", productId);
            List<ProductParam> productParamList = productParamService.selectList(wrapperParam);
            productInfo.put("productParam", productParamList);

            aShopCartList.put("productInfo", productInfo);
        }
        return super.returnStandardResult("data", shopCartList);
    }

    /**
     * 通过购物车列表生成订单
     */
    @ApiOperation(value = "通过购物车列表生成订单", notes = "通过购物车列表生成订单")
    @RequestMapping(value = "/createOrder", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public Object createOrder(@RequestHeader String Authorization,Order order,OrderProduct orderProduct) {
        User user = zyUtil.getUserModel(Authorization);
        if (user.getName()==null || user.getName().equals("")){
            Map<String, Object> standardMap = new HashMap<>();
            standardMap.put("status", 0);
            standardMap.put("data", "用户信息不完整");
            return standardMap;
        }
        EntityWrapper<ShopCart> wrapper = new EntityWrapper<>();
        wrapper.eq("userId", user.getId());
        List<Map<String, Object>> shopCartList = shopCartService.selectMaps(wrapper);
        order.setSn(getOrderIdByTime());
        order.setUserId(user.getId());
        order.setShipMobile(user.getPhone());
        order.setShipName(user.getName());
        order.setCreateTime(new Date());
        order.setState(1);
        orderService.insert(order);
        System.out.println("保存成功看有没有ID:"+order.getId());
        BigDecimal money = new BigDecimal(0);
        Integer points = 0;
        for (Map<String, Object> aShopCartList : shopCartList) {
            Integer productId = (Integer) aShopCartList.get("productId");
            EntityWrapper<Product> wrapperProduct = new EntityWrapper<>();
            wrapperProduct.eq("id", productId);
            Map<String, Object> productInfo = productService.selectMap(wrapperProduct);

            orderProduct.setOrderId(order.getId());
            orderProduct.setProductId(productId);
            Integer num = (Integer) aShopCartList.get("num");
            orderProduct.setNum(num);
            BigDecimal lowPice = (BigDecimal) productInfo.get("lowPice");
            orderProduct.setPrice(lowPice);
            orderProduct.setPoint((Integer) productInfo.get("points"));
            orderProductService.insert(orderProduct);
            BigDecimal nums =new BigDecimal(num);
            money = money.add(lowPice.multiply(nums));
            points = (Integer) productInfo.get("points") * num;
            //Integer shopCardId= (Integer) aShopCartList.get("id");
            //aShopCartList.
            shopCartService.deleteByMap(aShopCartList);
        }
        if (money.compareTo(user.getCloudPoints().add(user.getCash())) > 0) {
            orderProductService.deleteById(orderProduct.getId());
            return super.returnStandardDetail("data", "用户积分（金额）不足，下单失败");
        }else {
            if (money.compareTo(user.getCloudPoints()) <= 0) {
                user.setCloudPoints(user.getCloudPoints().subtract(money));
                userService.updateById(user);
            } else {
                money = money.subtract(user.getCloudPoints());
                user.setCloudPoints(new BigDecimal(0));
                user.setCash(user.getCash().subtract(money));
                userService.updateById(user);
            }
        }

        order.setMoney(money);
        order.setPoints(points);

        orderService.updateById(order);

        return super.returnStandardDetail("data", "订单提交成功");
    }

    /**
     * 新增购物车
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ShopCart shopCart) {
        shopCartService.insert(shopCart);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除购物车商品
     */
    @ApiOperation(value = "删除购物车商品", notes = "删除购物车商品")
    @ApiImplicitParam(name = "productId", value = "商品Id", required = true, dataType = "string", paramType = "query")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Object delete(@RequestHeader String Authorization,@RequestParam Integer productId) {
        User user = zyUtil.getUserModel(Authorization);
        EntityWrapper<ShopCart> wrapper = new EntityWrapper<>();
        wrapper.eq("productId", productId).eq("userId", user.getId());

        Map<String, Object> standardMap = new HashMap<>();
        if (shopCartService.delete(wrapper)) {
            standardMap.put("status", 1);
        }else{
            standardMap.put("status", 0);
        }
        //shopCartService.
        return standardMap;
    }

    /**
     * 修改购物车
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ShopCart shopCart) {
        shopCartService.updateById(shopCart);
        return super.SUCCESS_TIP;
    }

    /**
     * 购物车详情
     */
    @RequestMapping(value = "/detail/{shopCartId}")
    @ResponseBody
    public Object detail(@PathVariable("shopCartId") Integer shopCartId) {
        return shopCartService.selectById(shopCartId);
    }

    public static String getOrderIdByTime() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate=sdf.format(new Date());
        StringBuilder result= new StringBuilder();
        Random random=new Random();
        for(int i=0;i<3;i++){
            result.append(random.nextInt(10));
        }
        return newDate+result;
    }
}
