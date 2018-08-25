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
import com.stylefeng.guns.common.persistence.model.ConversionLog;
import com.stylefeng.guns.modular.zy.service.IConversionLogService;

import java.util.List;
import java.util.Map;

/**
 * conversionLog控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:51:05
 */
@Controller
@RequestMapping("/conversionLog")
public class ConversionLogController extends BaseController {

    private String PREFIX = "/zy/conversionLog/";

    @Autowired
    private IConversionLogService conversionLogService;

    /**
     * 跳转到conversionLog首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "conversionLog.html";
    }

    /**
     * 跳转到添加conversionLog
     */
    @RequestMapping("/conversionLog_add")
    public String conversionLogAdd() {
        return PREFIX + "conversionLog_add.html";
    }

    /**
     * 跳转到修改conversionLog
     */
    @RequestMapping("/conversionLog_update/{conversionLogId}")
    public String conversionLogUpdate(@PathVariable Integer conversionLogId, Model model) {
        ConversionLog conversionLog = conversionLogService.selectById(conversionLogId);
        model.addAttribute("item",conversionLog);
        LogObjectHolder.me().set(conversionLog);
        return PREFIX + "conversionLog_edit.html";
    }

    /**
     * 获取conversionLog列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        List<Map<String, Object>> data = conversionLogService.getConversionLog();
        return data;
    }

    /**
     * 新增conversionLog
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ConversionLog conversionLog) {
        conversionLogService.insert(conversionLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除conversionLog
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer conversionLogId) {
        conversionLogService.deleteById(conversionLogId);
        return SUCCESS_TIP;
    }

    /**
     * 修改conversionLog
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ConversionLog conversionLog) {
        conversionLogService.updateById(conversionLog);
        return super.SUCCESS_TIP;
    }

    /**
     * conversionLog详情
     */
    @RequestMapping(value = "/detail/{conversionLogId}")
    @ResponseBody
    public Object detail(@PathVariable("conversionLogId") Integer conversionLogId) {
        return conversionLogService.selectById(conversionLogId);
    }
}
