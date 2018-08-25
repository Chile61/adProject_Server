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
import com.stylefeng.guns.common.persistence.model.QuartzjobConfig;
import com.stylefeng.guns.modular.zy.service.IQuartzjobConfigService;

/**
 * jobconfig控制器
 *
 * @author fengshuonan
 * @Date 2018-01-14 21:07:51
 */
@Controller
@RequestMapping("/quartzjobConfig")
public class QuartzjobConfigController extends BaseController {

    private String PREFIX = "/zy/quartzjobConfig/";

    @Autowired
    private IQuartzjobConfigService quartzjobConfigService;

    /**
     * 跳转到jobconfig首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "quartzjobConfig.html";
    }

    /**
     * 跳转到添加jobconfig
     */
    @RequestMapping("/quartzjobConfig_add")
    public String quartzjobConfigAdd() {
        return PREFIX + "quartzjobConfig_add.html";
    }

    /**
     * 跳转到修改jobconfig
     */
    @RequestMapping("/quartzjobConfig_update/{quartzjobConfigId}")
    public String quartzjobConfigUpdate(@PathVariable Integer quartzjobConfigId, Model model) {
        QuartzjobConfig quartzjobConfig = quartzjobConfigService.selectById(quartzjobConfigId);
        model.addAttribute("item",quartzjobConfig);
        LogObjectHolder.me().set(quartzjobConfig);
        return PREFIX + "quartzjobConfig_edit.html";
    }

    /**
     * 获取jobconfig列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return quartzjobConfigService.selectList(null);
    }

    /**
     * 新增jobconfig
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(QuartzjobConfig quartzjobConfig) {
        quartzjobConfigService.insert(quartzjobConfig);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除jobconfig
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer quartzjobConfigId) {
        quartzjobConfigService.deleteById(quartzjobConfigId);
        return SUCCESS_TIP;
    }

    /**
     * 修改jobconfig
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(QuartzjobConfig quartzjobConfig) {
        quartzjobConfigService.updateById(quartzjobConfig);
        return super.SUCCESS_TIP;
    }

    /**
     * jobconfig详情
     */
    @RequestMapping(value = "/detail/{quartzjobConfigId}")
    @ResponseBody
    public Object detail(@PathVariable("quartzjobConfigId") Integer quartzjobConfigId) {
        return quartzjobConfigService.selectById(quartzjobConfigId);
    }
}
