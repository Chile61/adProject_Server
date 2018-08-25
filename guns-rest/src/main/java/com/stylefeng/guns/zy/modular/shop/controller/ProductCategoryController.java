package com.stylefeng.guns.zy.modular.shop.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.ProductCategory;
import com.stylefeng.guns.zy.modular.shop.service.IProductCategoryService;


/**
 * 商品类别控制器
 *
 * @author fengshuonan
 * @Date 2018-01-15 23:36:53
 */
@Controller
@RequestMapping("/productCategory")
public class ProductCategoryController extends BaseController {

    private String PREFIX = "/shop/productCategory/";

    @Autowired
    private IProductCategoryService productCategoryService;

    /**
     * 跳转到商品类别首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "productCategory.html";
    }

    /**
     * 跳转到添加商品类别
     */
    @RequestMapping("/productCategory_add")
    public String productCategoryAdd() {
        return PREFIX + "productCategory_add.html";
    }

    /**
     * 跳转到修改商品类别
     */
    @RequestMapping("/productCategory_update/{productCategoryId}")
    public String productCategoryUpdate(@PathVariable Integer productCategoryId, Model model) {
        ProductCategory productCategory = productCategoryService.selectById(productCategoryId);
        model.addAttribute("item",productCategory);
        //LogObjectHolder.me().set(productCategory);
        return PREFIX + "productCategory_edit.html";
    }

    /**
     * 获取商品类别列表
     */
    @ApiOperation(value="获取商品类别列表", notes="获取商品类别列表")
    @ApiImplicitParam(name = "shopId", value = "店铺Id", required = true, dataType = "int", paramType="query")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestParam("shopId") Integer shopId) {
        EntityWrapper<ProductCategory> wrapper = new EntityWrapper<>();
        wrapper.eq("shopId", shopId);
        return super.returnStandardResult("data", productCategoryService.selectList(wrapper));
    }

    /**
     * 新增商品类别
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ProductCategory productCategory) {
        productCategoryService.insert(productCategory);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除商品类别
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer productCategoryId) {
        productCategoryService.deleteById(productCategoryId);
        return SUCCESS_TIP;
    }

    /**
     * 修改商品类别
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ProductCategory productCategory) {
        productCategoryService.updateById(productCategory);
        return super.SUCCESS_TIP;
    }

    /**
     * 商品类别详情
     */
    @RequestMapping(value = "/detail/{productCategoryId}")
    @ResponseBody
    public Object detail(@PathVariable("productCategoryId") Integer productCategoryId) {
        return productCategoryService.selectById(productCategoryId);
    }
}
