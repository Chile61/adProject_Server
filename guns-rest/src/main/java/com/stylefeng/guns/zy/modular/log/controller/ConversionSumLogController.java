package com.stylefeng.guns.zy.modular.log.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.dao.ConversionSumLogMapper;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.ConversionSumLog;
import com.stylefeng.guns.zy.modular.log.service.IConversionSumLogService;

import java.util.Map;

/**
 * 每天转换总日志控制器
 *
 * @author fengshuonan
 * @Date 2018-01-31 14:52:25
 */
@Controller
@RequestMapping("/conversionSumLog")
public class ConversionSumLogController extends BaseController {

    private String PREFIX = "/log/conversionSumLog/";

    @Autowired
    private IConversionSumLogService conversionSumLogService;

    @Autowired
    ZyUtil zyUtil;

    @Autowired
    ConversionSumLogMapper conversionSumLogMapper;

    /**
     * 跳转到每天转换总日志首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "conversionSumLog.html";
    }

    /**
     * 跳转到添加每天转换总日志
     */
    @RequestMapping("/conversionSumLog_add")
    public String conversionSumLogAdd() {
        return PREFIX + "conversionSumLog_add.html";
    }

    /**
     * 跳转到修改每天转换总日志
     */
    @RequestMapping("/conversionSumLog_update/{conversionSumLogId}")
    public String conversionSumLogUpdate(@PathVariable Integer conversionSumLogId, Model model) {
        ConversionSumLog conversionSumLog = conversionSumLogService.selectById(conversionSumLogId);
        model.addAttribute("item",conversionSumLog);
        //LogObjectHolder.me().set(conversionSumLog);
        return PREFIX + "conversionSumLog_edit.html";
    }

    /**
     * 获取每天转换总日志列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return conversionSumLogService.selectList(null);
    }

    /**
     * 新增每天转换总日志
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ConversionSumLog conversionSumLog) {
        conversionSumLogService.insert(conversionSumLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除每天转换总日志
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer conversionSumLogId) {
        conversionSumLogService.deleteById(conversionSumLogId);
        return SUCCESS_TIP;
    }

    /**
     * 修改每天转换总日志
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ConversionSumLog conversionSumLog) {
        conversionSumLogService.updateById(conversionSumLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 每天转换总日志详情
     */
    @RequestMapping(value = "/detail/{conversionSumLogId}")
    @ResponseBody
    public Object detail(@PathVariable("conversionSumLogId") Integer conversionSumLogId) {
        return conversionSumLogService.selectById(conversionSumLogId);
    }

    /**
     * 获取最后一次转换记录
     */
    @ApiOperation(value="获取最后一次转换记录", notes="获取最后一次转换记录")
    @RequestMapping(value = "/getLast", method=RequestMethod.GET)
    @ResponseBody
    public Object getLast(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);
        Map<String, Object> conversionSumLog = null;
        if (user!=null){
            conversionSumLog = conversionSumLogMapper.getLast();
        }
        return super.returnStandardResult("data", conversionSumLog);
    }
}
