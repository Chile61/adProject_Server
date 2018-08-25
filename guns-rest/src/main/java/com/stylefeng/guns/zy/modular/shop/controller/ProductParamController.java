package com.stylefeng.guns.zy.modular.shop.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.rest.common.persistence.model.ProductParam;
import com.stylefeng.guns.zy.modular.shop.service.IProductParamService;

/**
 * 商品参数控制器
 *
 * @author fengshuonan
 * @Date 2018-01-16 10:14:07
 */
@Controller
@RequestMapping("/productParam")
public class ProductParamController extends BaseController {

    private String PREFIX = "/shop/productParam/";

    @Autowired
    private IProductParamService productParamService;

    /**
     * 跳转到商品参数首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "productParam.html";
    }

    /**
     * 跳转到添加商品参数
     */
    @RequestMapping("/productParam_add")
    public String productParamAdd() {
        return PREFIX + "productParam_add.html";
    }

    /**
     * 跳转到修改商品参数
     */
    @RequestMapping("/productParam_update/{productParamId}")
    public String productParamUpdate(@PathVariable Integer productParamId, Model model) {
        ProductParam productParam = productParamService.selectById(productParamId);
        model.addAttribute("item",productParam);
        //LogObjectHolder.me().set(productParam);
        return PREFIX + "productParam_edit.html";
    }

    /**
     * 获取商品参数列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return productParamService.selectList(null);
    }

    /**
     * 新增商品参数
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ProductParam productParam) {
        productParamService.insert(productParam);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除商品参数
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer productParamId) {
        productParamService.deleteById(productParamId);
        return SUCCESS_TIP;
    }

    /**
     * 修改商品参数
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ProductParam productParam) {
        productParamService.updateById(productParam);
        return super.SUCCESS_TIP;
    }

    /**
     * 商品参数详情
     */
    @RequestMapping(value = "/detail/{productParamId}")
    @ResponseBody
    public Object detail(@PathVariable("productParamId") Integer productParamId) {
        return productParamService.selectById(productParamId);
    }
}
