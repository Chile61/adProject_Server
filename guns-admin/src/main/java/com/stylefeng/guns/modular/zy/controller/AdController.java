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
import com.stylefeng.guns.common.persistence.model.Ad;
import com.stylefeng.guns.modular.zy.service.IAdService;

/**
 * ad控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:48:22
 */
@Controller
@RequestMapping("/ad")
public class AdController extends BaseController {

    private String PREFIX = "/zy/ad/";

    @Autowired
    private IAdService adService;

    /**
     * 跳转到ad首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "ad.html";
    }

    /**
     * 跳转到添加ad
     */
    @RequestMapping("/ad_add")
    public String adAdd() {
        return PREFIX + "ad_add.html";
    }

    /**
     * 跳转到修改ad
     */
    @RequestMapping("/ad_update/{adId}")
    public String adUpdate(@PathVariable Integer adId, Model model) {
        Ad ad = adService.selectById(adId);
        model.addAttribute("item",ad);
        LogObjectHolder.me().set(ad);
        return PREFIX + "ad_edit.html";
    }

    /**
     * 获取ad列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return adService.selectList(null);
    }

    /**
     * 新增ad
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Ad ad) {
        adService.insert(ad);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除ad
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer adId) {
        adService.deleteById(adId);
        return SUCCESS_TIP;
    }

    /**
     * 修改ad
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Ad ad) {
        adService.updateById(ad);
        return super.SUCCESS_TIP;
    }

    /**
     * ad详情
     */
    @RequestMapping(value = "/detail/{adId}")
    @ResponseBody
    public Object detail(@PathVariable("adId") Integer adId) {
        return adService.selectById(adId);
    }
}
