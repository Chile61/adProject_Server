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
import com.stylefeng.guns.rest.common.persistence.model.ProductImage;
import com.stylefeng.guns.zy.modular.shop.service.IProductImageService;

/**
 * 商品图片控制器
 *
 * @author fengshuonan
 * @Date 2018-01-16 10:13:52
 */
@Controller
@RequestMapping("/productImage")
public class ProductImageController extends BaseController {

    private String PREFIX = "/shop/productImage/";

    @Autowired
    private IProductImageService productImageService;

    /**
     * 跳转到商品图片首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "productImage.html";
    }

    /**
     * 跳转到添加商品图片
     */
    @RequestMapping("/productImage_add")
    public String productImageAdd() {
        return PREFIX + "productImage_add.html";
    }

    /**
     * 跳转到修改商品图片
     */
    @RequestMapping("/productImage_update/{productImageId}")
    public String productImageUpdate(@PathVariable Integer productImageId, Model model) {
        ProductImage productImage = productImageService.selectById(productImageId);
        model.addAttribute("item",productImage);
        //LogObjectHolder.me().set(productImage);
        return PREFIX + "productImage_edit.html";
    }

    /**
     * 获取商品图片列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return productImageService.selectList(null);
    }

    /**
     * 新增商品图片
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ProductImage productImage) {
        productImageService.insert(productImage);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除商品图片
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer productImageId) {
        productImageService.deleteById(productImageId);
        return SUCCESS_TIP;
    }

    /**
     * 修改商品图片
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ProductImage productImage) {
        productImageService.updateById(productImage);
        return super.SUCCESS_TIP;
    }

    /**
     * 商品图片详情
     */
    @RequestMapping(value = "/detail/{productImageId}")
    @ResponseBody
    public Object detail(@PathVariable("productImageId") Integer productImageId) {
        return productImageService.selectById(productImageId);
    }
}
