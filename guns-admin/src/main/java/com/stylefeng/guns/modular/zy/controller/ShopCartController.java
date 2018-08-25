package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.common.persistence.model.ShopCart;
import com.stylefeng.guns.modular.zy.service.IShopCartService;

/**
 * shopCart控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:54:46
 */
@Controller
@RequestMapping("/shopCart")
public class ShopCartController extends BaseController {

    private String PREFIX = "/zy/shopCart/";

    @Autowired
    private IShopCartService shopCartService;

    /**
     * 跳转到shopCart首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "shopCart.html";
    }

    /**
     * 跳转到添加shopCart
     */
    @RequestMapping("/shopCart_add")
    public String shopCartAdd() {
        return PREFIX + "shopCart_add.html";
    }

    /**
     * 跳转到修改shopCart
     */
    @RequestMapping("/shopCart_update/{shopCartId}")
    public String shopCartUpdate(@PathVariable Integer shopCartId, Model model) {
        ShopCart shopCart = shopCartService.selectById(shopCartId);
        model.addAttribute("item",shopCart);
        LogObjectHolder.me().set(shopCart);
        return PREFIX + "shopCart_edit.html";
    }

    /**
     * 获取shopCart列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return shopCartService.selectList(null);
    }

    /**
     * 新增shopCart
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ShopCart shopCart) {
        shopCartService.insert(shopCart);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除shopCart
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer shopCartId) {
        shopCartService.deleteById(shopCartId);
        return SUCCESS_TIP;
    }

    /**
     * 修改shopCart
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ShopCart shopCart) {
        shopCartService.updateById(shopCart);
        return super.SUCCESS_TIP;
    }

    /**
     * shopCart详情
     */
    @RequestMapping(value = "/detail/{shopCartId}")
    @ResponseBody
    public Object detail(@PathVariable("shopCartId") Integer shopCartId) {
        return shopCartService.selectById(shopCartId);
    }
}
