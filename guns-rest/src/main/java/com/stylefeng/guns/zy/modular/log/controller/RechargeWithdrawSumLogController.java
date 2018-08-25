package com.stylefeng.guns.zy.modular.log.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.dao.RechargeWithdrawSumLogMapper;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.RechargeWithdrawSumLog;
import com.stylefeng.guns.zy.modular.log.service.IRechargeWithdrawSumLogService;

import java.util.Map;

/**
 * 冲值提现统计控制器
 *
 * @author fengshuonan
 * @Date 2018-01-31 11:26:56
 */
@Controller
@RequestMapping("/rechargeWithdrawSumLog")
public class RechargeWithdrawSumLogController extends BaseController {

    private String PREFIX = "/Log/rechargeWithdrawSumLog/";

    @Autowired
    private IRechargeWithdrawSumLogService rechargeWithdrawSumLogService;

    @Autowired
    ZyUtil zyUtil;

    @Autowired
    RechargeWithdrawSumLogMapper rechargeWithdrawSumLogMapper;
    /**
     * 跳转到冲值提现统计首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "rechargeWithdrawSumLog.html";
    }

    /**
     * 跳转到添加冲值提现统计
     */
    @RequestMapping("/rechargeWithdrawSumLog_add")
    public String rechargeWithdrawSumLogAdd() {
        return PREFIX + "rechargeWithdrawSumLog_add.html";
    }

    /**
     * 跳转到修改冲值提现统计
     */
    @RequestMapping("/rechargeWithdrawSumLog_update/{rechargeWithdrawSumLogId}")
    public String rechargeWithdrawSumLogUpdate(@PathVariable Integer rechargeWithdrawSumLogId, Model model) {
        RechargeWithdrawSumLog rechargeWithdrawSumLog = rechargeWithdrawSumLogService.selectById(rechargeWithdrawSumLogId);
        model.addAttribute("item",rechargeWithdrawSumLog);
        //LogObjectHolder.me().set(rechargeWithdrawSumLog);
        return PREFIX + "rechargeWithdrawSumLog_edit.html";
    }

    /**
     * 获取冲值提现统计列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return rechargeWithdrawSumLogService.selectList(null);
    }

    /**
     * 获取冲值提现统计列表
     */
    @ApiOperation(value="获取最后一次冲值提现统计", notes="获取最后一次冲值提现统计")
    @RequestMapping(value = "/getLast", method=RequestMethod.GET)
    @ResponseBody
    public Object getLast(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);
        Map<String, Object> rechargeWithdrawSumLastLog = null;
        if (user!=null){
            rechargeWithdrawSumLastLog = rechargeWithdrawSumLogMapper.getLast();
        }
        return super.returnStandardResult("data", rechargeWithdrawSumLastLog);
    }


    /**
     * 新增冲值提现统计
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(RechargeWithdrawSumLog rechargeWithdrawSumLog) {
        rechargeWithdrawSumLogService.insert(rechargeWithdrawSumLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除冲值提现统计
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer rechargeWithdrawSumLogId) {
        rechargeWithdrawSumLogService.deleteById(rechargeWithdrawSumLogId);
        return SUCCESS_TIP;
    }

    /**
     * 修改冲值提现统计
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(RechargeWithdrawSumLog rechargeWithdrawSumLog) {
        rechargeWithdrawSumLogService.updateById(rechargeWithdrawSumLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 冲值提现统计详情
     */
    @RequestMapping(value = "/detail/{rechargeWithdrawSumLogId}")
    @ResponseBody
    public Object detail(@PathVariable("rechargeWithdrawSumLogId") Integer rechargeWithdrawSumLogId) {
        return rechargeWithdrawSumLogService.selectById(rechargeWithdrawSumLogId);
    }
}
