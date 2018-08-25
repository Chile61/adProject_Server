package com.stylefeng.guns.zy.modular.shop.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.dao.ProductImageMapper;
import com.stylefeng.guns.rest.common.persistence.dao.ProductParamMapper;
import com.stylefeng.guns.rest.common.persistence.model.Dict;
import com.stylefeng.guns.rest.common.persistence.model.ProductImage;
import com.stylefeng.guns.rest.common.persistence.model.ProductParam;
import com.stylefeng.guns.zy.modular.shop.service.IProductImageService;
import com.stylefeng.guns.zy.modular.shop.service.IProductParamService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.Product;
import com.stylefeng.guns.zy.modular.shop.service.IProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * product控制器
 *
 * @author fengshuonan
 * @Date 2018-01-04 22:08:15
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController {

    private String PREFIX = "/shop/product/";

    @Autowired
    private IProductService productService;

    @Autowired
    private IProductImageService productImageService;

    @Autowired
    private IProductParamService productParamService;

    /**
     * 跳转到product首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "product.html";
    }

    /**
     * 跳转到添加product
     */
    @RequestMapping("/product/add")
    public String productAdd() {
        return PREFIX + "product_add.html";
    }

    /**
     * 跳转到修改product
     */
    @RequestMapping("/product/update/{productId}")
    public String productUpdate(@PathVariable Integer productId, Model model) {
        Product product = productService.selectById(productId);
        model.addAttribute("item",product);
        //LogObjectHolder.me().set(product);
        return PREFIX + "product_edit.html";
    }

    /**
     * 获取商品列表
     */
    @ApiOperation(value="获取商品列表", notes="获取商品列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "shopId", value = "店铺Id", required = true, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "categoryId", value = "商品类别Id", required = true, dataType = "string", paramType = "query")
    })
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestParam("shopId") Integer shopId,@RequestParam("categoryId") Integer categoryId) {
        EntityWrapper<Product> wrapper = new EntityWrapper<>();
        wrapper.eq("shopId", shopId).eq("categoryId", categoryId);
        List<Map<String, Object>> productList = productService.selectMaps(wrapper);
        for (Map<String, Object> aProductList : productList) {
            Integer productId = (Integer) aProductList.get("id");

            EntityWrapper<ProductImage> wrapperImage = new EntityWrapper<>();
            wrapperImage.eq("productId", productId);
            List<ProductImage> productImageList = productImageService.selectList(wrapperImage);
            aProductList.put("productImage",productImageList);

            EntityWrapper<ProductParam> wrapperParam = new EntityWrapper<>();
            wrapperParam.eq("productId", productId);
            List<ProductParam> productParamList = productParamService.selectList(wrapperParam);
            aProductList.put("productParam",productParamList);
        }
        return super.returnStandardResult("data", productList);
    }

    /**
     * 搜索商品
     */
    @ApiOperation(value="搜索商品", notes="搜索商品")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "search", value = "搜索名称", required = true, dataType = "string", paramType = "query")
    })
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    @ResponseBody
    public Object list(@RequestParam("search") String search) {
        EntityWrapper<Product> wrapper = new EntityWrapper<>();
        wrapper.like("name", search);
        List<Map<String, Object>> productList = productService.selectMaps(wrapper);
        for (Map<String, Object> aProductList : productList) {
            Integer productId = (Integer) aProductList.get("id");

            EntityWrapper<ProductImage> wrapperImage = new EntityWrapper<>();
            wrapperImage.eq("productId", productId);
            List<ProductImage> productImageList = productImageService.selectList(wrapperImage);
            aProductList.put("productImage",productImageList);

            EntityWrapper<ProductParam> wrapperParam = new EntityWrapper<>();
            wrapperParam.eq("productId", productId);
            List<ProductParam> productParamList = productParamService.selectList(wrapperParam);
            aProductList.put("productParam",productParamList);
        }
        return super.returnStandardResult("data", productList);
    }
    /**
     * 新增product
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Product product) {
        productService.insert(product);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除product
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer productId) {
        productService.deleteById(productId);
        return SUCCESS_TIP;
    }

    /**
     * 修改product
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Product product) {
        productService.updateById(product);
        return super.SUCCESS_TIP;
    }

    /**
     * product详情
     */
    @RequestMapping(value = "/detail/{productId}")
    @ResponseBody
    public Object detail(@PathVariable("productId") Integer productId) {
        return productService.selectById(productId);
    }
}
