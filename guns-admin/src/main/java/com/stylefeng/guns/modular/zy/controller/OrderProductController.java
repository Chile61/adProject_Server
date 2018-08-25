package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.common.persistence.model.OrderProduct;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.modular.zy.service.IOrderProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 定单信息控制器
 *
 * @author fengshuonan
 * @Date 2018-05-06 12:16:41
 */
@Controller
@RequestMapping("/orderProduct")
public class OrderProductController extends BaseController {

    private String PREFIX = "/zy/orderProduct/";

    @Autowired
    private IOrderProductService orderProductService;

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
        LogObjectHolder.me().set(orderProduct);
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
