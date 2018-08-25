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
import com.stylefeng.guns.common.persistence.model.ProductParam;
import com.stylefeng.guns.modular.zy.service.IProductParamService;

/**
 * productParam控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:54:13
 */
@Controller
@RequestMapping("/productParam")
public class ProductParamController extends BaseController {

    private String PREFIX = "/zy/productParam/";

    @Autowired
    private IProductParamService productParamService;

    /**
     * 跳转到productParam首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "productParam.html";
    }

    /**
     * 跳转到添加productParam
     */
    @RequestMapping("/productParam_add")
    public String productParamAdd() {
        return PREFIX + "productParam_add.html";
    }

    /**
     * 跳转到修改productParam
     */
    @RequestMapping("/productParam_update/{productParamId}")
    public String productParamUpdate(@PathVariable Integer productParamId, Model model) {
        ProductParam productParam = productParamService.selectById(productParamId);
        model.addAttribute("item",productParam);
        LogObjectHolder.me().set(productParam);
        return PREFIX + "productParam_edit.html";
    }

    /**
     * 获取productParam列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return productParamService.selectList(null);
    }

    /**
     * 新增productParam
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ProductParam productParam) {
        productParamService.insert(productParam);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除productParam
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer productParamId) {
        productParamService.deleteById(productParamId);
        return SUCCESS_TIP;
    }

    /**
     * 修改productParam
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ProductParam productParam) {
        productParamService.updateById(productParam);
        return super.SUCCESS_TIP;
    }

    /**
     * productParam详情
     */
    @RequestMapping(value = "/detail/{productParamId}")
    @ResponseBody
    public Object detail(@PathVariable("productParamId") Integer productParamId) {
        return productParamService.selectById(productParamId);
    }
}
