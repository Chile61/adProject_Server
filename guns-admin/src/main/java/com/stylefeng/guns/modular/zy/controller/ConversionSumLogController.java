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
import com.stylefeng.guns.common.persistence.model.ConversionSumLog;
import com.stylefeng.guns.modular.zy.service.IConversionSumLogService;

/**
 * conversionSumLog控制器
 *
 * @author fengshuonan
 * @Date 2018-02-23 19:32:39
 */
@Controller
@RequestMapping("/conversionSumLog")
public class ConversionSumLogController extends BaseController {

    private String PREFIX = "/zy/conversionSumLog/";

    @Autowired
    private IConversionSumLogService conversionSumLogService;

    /**
     * 跳转到conversionSumLog首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "conversionSumLog.html";
    }

    /**
     * 跳转到添加conversionSumLog
     */
    @RequestMapping("/conversionSumLog_add")
    public String conversionSumLogAdd() {
        return PREFIX + "conversionSumLog_add.html";
    }

    /**
     * 跳转到修改conversionSumLog
     */
    @RequestMapping("/conversionSumLog_update/{conversionSumLogId}")
    public String conversionSumLogUpdate(@PathVariable Integer conversionSumLogId, Model model) {
        ConversionSumLog conversionSumLog = conversionSumLogService.selectById(conversionSumLogId);
        model.addAttribute("item",conversionSumLog);
        LogObjectHolder.me().set(conversionSumLog);
        return PREFIX + "conversionSumLog_edit.html";
    }

    /**
     * 获取conversionSumLog列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return conversionSumLogService.selectList(null);
    }

    /**
     * 新增conversionSumLog
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ConversionSumLog conversionSumLog) {
        conversionSumLogService.insert(conversionSumLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除conversionSumLog
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer conversionSumLogId) {
        conversionSumLogService.deleteById(conversionSumLogId);
        return SUCCESS_TIP;
    }

    /**
     * 修改conversionSumLog
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ConversionSumLog conversionSumLog) {
        conversionSumLogService.updateById(conversionSumLog);
        return super.SUCCESS_TIP;
    }

    /**
     * conversionSumLog详情
     */
    @RequestMapping(value = "/detail/{conversionSumLogId}")
    @ResponseBody
    public Object detail(@PathVariable("conversionSumLogId") Integer conversionSumLogId) {
        return conversionSumLogService.selectById(conversionSumLogId);
    }
}
