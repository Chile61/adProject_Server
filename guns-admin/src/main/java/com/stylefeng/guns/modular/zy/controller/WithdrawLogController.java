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
import com.stylefeng.guns.common.persistence.model.WithdrawLog;
import com.stylefeng.guns.modular.zy.service.IWithdrawLogService;

/**
 * withdrawLog控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:55:35
 */
@Controller
@RequestMapping("/withdrawLog")
public class WithdrawLogController extends BaseController {

    private String PREFIX = "/zy/withdrawLog/";

    @Autowired
    private IWithdrawLogService withdrawLogService;

    /**
     * 跳转到withdrawLog首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "withdrawLog.html";
    }

    /**
     * 跳转到添加withdrawLog
     */
    @RequestMapping("/withdrawLog_add")
    public String withdrawLogAdd() {
        return PREFIX + "withdrawLog_add.html";
    }

    /**
     * 跳转到修改withdrawLog
     */
    @RequestMapping("/withdrawLog_update/{withdrawLogId}")
    public String withdrawLogUpdate(@PathVariable Integer withdrawLogId, Model model) {
        WithdrawLog withdrawLog = withdrawLogService.selectById(withdrawLogId);
        model.addAttribute("item",withdrawLog);
        LogObjectHolder.me().set(withdrawLog);
        return PREFIX + "withdrawLog_edit.html";
    }

    /**
     * 获取withdrawLog列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return withdrawLogService.selectList(null);
    }

    /**
     * 新增withdrawLog
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(WithdrawLog withdrawLog) {
        withdrawLogService.insert(withdrawLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除withdrawLog
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer withdrawLogId) {
        withdrawLogService.deleteById(withdrawLogId);
        return SUCCESS_TIP;
    }

    /**
     * 修改withdrawLog
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(WithdrawLog withdrawLog) {
        withdrawLogService.updateById(withdrawLog);
        return super.SUCCESS_TIP;
    }

    /**
     * withdrawLog详情
     */
    @RequestMapping(value = "/detail/{withdrawLogId}")
    @ResponseBody
    public Object detail(@PathVariable("withdrawLogId") Integer withdrawLogId) {
        return withdrawLogService.selectById(withdrawLogId);
    }
}
