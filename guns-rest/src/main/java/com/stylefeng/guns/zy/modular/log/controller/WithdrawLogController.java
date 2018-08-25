package com.stylefeng.guns.zy.modular.log.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.WithdrawLog;
import com.stylefeng.guns.zy.modular.log.service.IWithdrawLogService;

/**
 * 提现日志控制器
 *
 * @author fengshuonan
 * @Date 2018-01-09 17:21:10
 */
@Controller
@RequestMapping("/withdrawLog")
public class WithdrawLogController extends BaseController {

    private String PREFIX = "/log/withdrawLog/";

    @Autowired
    private IWithdrawLogService withdrawLogService;

    @Autowired
    ZyUtil zyUtil;
    /**
     * 跳转到提现日志首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "withdrawLog.html";
    }

    /**
     * 跳转到添加提现日志
     */
    @RequestMapping("/withdrawLog_add")
    public String withdrawLogAdd() {
        return PREFIX + "withdrawLog_add.html";
    }

    /**
     * 跳转到修改提现日志
     */
    @RequestMapping("/withdrawLog_update/{withdrawLogId}")
    public String withdrawLogUpdate(@PathVariable Integer withdrawLogId, Model model) {
        WithdrawLog withdrawLog = withdrawLogService.selectById(withdrawLogId);
        model.addAttribute("item",withdrawLog);
        //LogObjectHolder.me().set(withdrawLog);
        return PREFIX + "withdrawLog_edit.html";
    }

    /**
     * 获取提现日志列表
     */
    @ApiOperation(value="获取提现日志列表", notes="获取提现日志列表")
    @RequestMapping(value = "/list", method= RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);

        EntityWrapper<WithdrawLog> wrapper = new EntityWrapper<>();

        return super.returnStandardResult("data", withdrawLogService.selectList(wrapper.eq("userId", user.getId())));
    }

    /**
     * 新增提现日志
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(WithdrawLog withdrawLog) {
        withdrawLogService.insert(withdrawLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除提现日志
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer withdrawLogId) {
        withdrawLogService.deleteById(withdrawLogId);
        return SUCCESS_TIP;
    }

    /**
     * 修改提现日志
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(WithdrawLog withdrawLog) {
        withdrawLogService.updateById(withdrawLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 提现日志详情
     */
    @RequestMapping(value = "/detail/{withdrawLogId}")
    @ResponseBody
    public Object detail(@PathVariable("withdrawLogId") Integer withdrawLogId) {
        return withdrawLogService.selectById(withdrawLogId);
    }
}
