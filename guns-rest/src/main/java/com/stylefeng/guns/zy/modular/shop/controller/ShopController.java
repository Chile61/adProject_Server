package com.stylefeng.guns.zy.modular.shop.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.dao.ShopMapper;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;

import com.stylefeng.guns.rest.common.persistence.model.Shop;
import com.stylefeng.guns.zy.modular.shop.service.IShopService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 店铺信息控制器
 *
 * @author fengshuonan
 * @Date 2018-01-07 00:53:25
 */
@Controller
@RequestMapping("/shop")
public class ShopController extends BaseController {

    private String PREFIX = "/shop/shop/";

    @Autowired
    private IShopService shopService;

    @Resource
    private ShopMapper shopMapper;
    /**
     * 跳转到店铺信息首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "shop.html";
    }

    /**
     * 跳转到添加店铺信息
     */
    @RequestMapping("/shop_add")
    public String shopAdd() {
        return PREFIX + "shop_add.html";
    }

    /**
     * 跳转到修改店铺信息
     */
    @RequestMapping("/shop_update/{shopId}")
    public String shopUpdate(@PathVariable Integer shopId, Model model) {
        Shop shop = shopService.selectById(shopId);
        model.addAttribute("item",shop);
        return PREFIX + "shop_edit.html";
    }

    /**
     * 获取店铺信息列表
     */
    @ApiOperation(value="获取店铺信息列表", notes="获取店铺信息列表")
    @ApiImplicitParam(name = "typeId", value = "店铺类型", required = true, dataType = "int", paramType="query")
    @RequestMapping(value = "/list",method= RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestParam("typeId") Integer typeId) {
        List<Map<String, Object>> shops = shopMapper.getShopList(typeId);
        return super.returnStandardResult("data", shops);
    }

    /**
     * 新增店铺信息
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Shop shop) {
        shopService.insert(shop);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除店铺信息
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer shopId) {
        shopService.deleteById(shopId);
        return SUCCESS_TIP;
    }

    /**
     * 修改店铺信息
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Shop shop) {
        shopService.updateById(shop);
        return super.SUCCESS_TIP;
    }

    /**
     * 店铺信息详情
     */
    @ApiOperation(value="获取店铺信息详情", notes="获取店铺信息详情")
    @ApiImplicitParam(name = "shopId", value = "店铺信息", required = true, dataType = "int", paramType="query")
    @RequestMapping(value = "/detail",method= RequestMethod.GET)
    @ResponseBody
    public Object detail(@RequestParam("shopId") Integer shopId) {
        //return shopService.selectById(shopId);
        return super.returnStandardDetail("data", shopService.selectById(shopId));
    }
}
