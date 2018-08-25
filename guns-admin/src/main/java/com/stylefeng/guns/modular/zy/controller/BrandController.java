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
import com.stylefeng.guns.common.persistence.model.Brand;
import com.stylefeng.guns.modular.zy.service.IBrandService;

/**
 * brand控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:49:43
 */
@Controller
@RequestMapping("/brand")
public class BrandController extends BaseController {

    private String PREFIX = "/zy/brand/";

    @Autowired
    private IBrandService brandService;

    /**
     * 跳转到brand首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "brand.html";
    }

    /**
     * 跳转到添加brand
     */
    @RequestMapping("/brand_add")
    public String brandAdd() {
        return PREFIX + "brand_add.html";
    }

    /**
     * 跳转到修改brand
     */
    @RequestMapping("/brand_update/{brandId}")
    public String brandUpdate(@PathVariable Integer brandId, Model model) {
        Brand brand = brandService.selectById(brandId);
        model.addAttribute("item",brand);
        LogObjectHolder.me().set(brand);
        return PREFIX + "brand_edit.html";
    }

    /**
     * 获取brand列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return brandService.selectList(null);
    }

    /**
     * 新增brand
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Brand brand) {
        brandService.insert(brand);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除brand
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer brandId) {
        brandService.deleteById(brandId);
        return SUCCESS_TIP;
    }

    /**
     * 修改brand
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Brand brand) {
        brandService.updateById(brand);
        return super.SUCCESS_TIP;
    }

    /**
     * brand详情
     */
    @RequestMapping(value = "/detail/{brandId}")
    @ResponseBody
    public Object detail(@PathVariable("brandId") Integer brandId) {
        return brandService.selectById(brandId);
    }
}
