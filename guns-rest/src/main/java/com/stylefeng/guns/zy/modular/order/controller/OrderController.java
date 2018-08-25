package com.stylefeng.guns.zy.modular.order.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.Order;
import com.stylefeng.guns.zy.modular.order.service.IOrderService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 定单信息控制器
 *
 * @author fengshuonan
 * @Date 2018-05-06 12:24:10
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

    private String PREFIX = "/order/order/";

    @Autowired
    private IOrderService orderService;
    @Autowired
    ZyUtil zyUtil;
    /**
     * 跳转到定单信息首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "order.html";
    }

    /**
     * 跳转到添加定单信息
     */
    @RequestMapping("/order_add")
    public String orderAdd() {
        return PREFIX + "order_add.html";
    }

    /**
     * 跳转到修改定单信息
     */
    @RequestMapping("/order_update/{orderId}")
    public String orderUpdate(@PathVariable Integer orderId, Model model) {
        Order order = orderService.selectById(orderId);
        model.addAttribute("item",order);
        //LogObjectHolder.me().set(order);
        return PREFIX + "order_edit.html";
    }

    /**
     * 获取定单信息列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return orderService.selectList(null);
    }

//
//    @ApiOperation(value="获取店铺信息列表", notes="获取店铺信息列表")
//    @ApiImplicitParam(name = "typeId", value = "店铺类型", required = true, dataType = "int", paramType="query")
//    @RequestMapping(value = "/list",method= RequestMethod.GET)
//    @ResponseBody
//    public Object list(@RequestParam("typeId") Integer typeId) {
    /**
     * 获取定单列表
     */
    @ApiOperation(value="获取定单列表", notes="获取定单列表")
    @ApiImplicitParam(name = "state", value = "订单状态",  required = true, dataType = "int", paramType="query")
    @RequestMapping(value = "/orderList", method=RequestMethod.POST)
    @ResponseBody
    public Object orderList(@RequestHeader String Authorization,@RequestParam Integer state) {
        User currentUser = zyUtil.getUserModel(Authorization);
        if (currentUser==null){
            Map<String, Object> standardMap = new HashMap<>();
            standardMap.put("status", 0);
            return standardMap;
        }
        List<Map<String, Object>> orders;
        if (state!=null && state!=-1){
            orders = orderService.selectMaps(new EntityWrapper<Order>().eq("state",state).eq("userId",currentUser.getId()));
        }else{
            orders = orderService.selectMaps(new EntityWrapper<Order>().eq("userId",currentUser.getId()));
        }
        //Object objects = new OrderWarpper(orders).warp();
        return  super.returnStandardResult("data",orders);
    }

    /**
     * 新增定单信息
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Order order) {
        orderService.insert(order);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除定单信息
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer orderId) {
        orderService.deleteById(orderId);
        return SUCCESS_TIP;
    }

    /**
     * 修改定单信息
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Order order) {
        orderService.updateById(order);
        return super.SUCCESS_TIP;
    }

    /**
     * 定单信息详情
     */
    @RequestMapping(value = "/detail/{orderId}")
    @ResponseBody
    public Object detail(@PathVariable("orderId") Integer orderId) {
        return orderService.selectById(orderId);
    }
}
