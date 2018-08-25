package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.common.persistence.dao.ProductCategoryMapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.node.ZTreeNode;
import com.stylefeng.guns.modular.zy.warpper.ProductCategoryWarpper;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.common.persistence.model.ProductCategory;
import com.stylefeng.guns.modular.zy.service.IProductCategoryService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * productCategory控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:53:34
 */
@Controller
@RequestMapping("/productCategory")
public class ProductCategoryController extends BaseController {

    private String PREFIX = "/zy/productCategory/";

    @Autowired
    private IProductCategoryService productCategoryService;

    @Resource
    ProductCategoryMapper productCategoryMapper;
    /**
     * 跳转到productCategory首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "productCategory.html";
    }

    /**
     * 跳转到添加productCategory
     */
    @RequestMapping("/productCategory_add")
    public String productCategoryAdd() {
        return PREFIX + "productCategory_add.html";
    }

    /**
     * 跳转到修改productCategory
     */
    @RequestMapping("/productCategory_update/{productCategoryId}")
    public String productCategoryUpdate(@PathVariable Integer productCategoryId, Model model) {
        ProductCategory productCategory = productCategoryService.selectById(productCategoryId);
        model.addAttribute("shopName", ConstantFactory.me().getShopName(productCategory.getShopId()));
        model.addAttribute("item",productCategory);
        LogObjectHolder.me().set(productCategory);
        return PREFIX + "productCategory_edit.html";
    }

    /**
     * 获取productCategory列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        List<Map<String, Object>> tShops = productCategoryService.selectMaps(null);
        Object objects = new ProductCategoryWarpper(tShops).warp();
        return objects;
    }
    /**
     * 获取商品类别的tree列表
     */
    @ApiOperation(value="获取商品类别的tree列表", notes="获取商品类别的tree列表")
    @RequestMapping(value = "/productCategoryTree",method = RequestMethod.POST)
    @ResponseBody
    public List<ZTreeNode> tree() {
        List<ZTreeNode> tree = this.productCategoryMapper.getProductCategoryTree(null);
        return tree;
    }

    /**
     * 获取商品类别的tree列表，根据ShopId获取
     */
    @ApiOperation(value="获取商品类别的tree列表", notes="获取商品类别的tree列表")
    @RequestMapping(value = "/productCategoryTree/{shopId}",method = RequestMethod.POST)
    @ResponseBody
    public List<ZTreeNode> tree(@PathVariable String shopId) {
        List<ZTreeNode> tree = this.productCategoryMapper.getProductCategoryTree(shopId);
        return tree;
    }
    /**
     * 新增productCategory
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ProductCategory productCategory) {
        productCategoryService.insert(productCategory);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除productCategory
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer productCategoryId) {
        productCategoryService.deleteById(productCategoryId);
        return SUCCESS_TIP;
    }

    /**
     * 修改productCategory
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ProductCategory productCategory) {
        productCategoryService.updateById(productCategory);
        return super.SUCCESS_TIP;
    }

    /**
     * productCategory详情
     */
    @RequestMapping(value = "/detail/{productCategoryId}")
    @ResponseBody
    public Object detail(@PathVariable("productCategoryId") Integer productCategoryId) {
        return productCategoryService.selectById(productCategoryId);
    }
}
