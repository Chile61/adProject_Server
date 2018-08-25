package com.stylefeng.guns.zy.modular.log.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.rest.common.persistence.model.LoginLog;
import com.stylefeng.guns.zy.modular.log.service.ILoginLogService;

/**
 * loginlog控制器
 *
 * @author jerry
 * @Date 2018-01-01 15:54:43
 */
@Controller
@RequestMapping("/loginLog")
public class LoginLogController extends BaseController {

    private String PREFIX = "/log/loginLog/";

    @Autowired
    private ILoginLogService loginLogService;

    /**
     * 跳转到loginlog首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "loginLog.html";
    }

    /**
     * 跳转到添加loginlog
     */
    @RequestMapping("/loginLog_add")
    public String loginLogAdd() {
        return PREFIX + "loginLog_add.html";
    }

    /**
     * 跳转到修改loginlog
     */
    @RequestMapping("/loginLog_update/{loginLogId}")
    public String loginLogUpdate(@PathVariable Integer loginLogId, Model model) {
        LoginLog loginLog = loginLogService.selectById(loginLogId);
        model.addAttribute("item",loginLog);
//        LogObjectHolder.me().set(loginLog);
        return PREFIX + "loginLog_edit.html";
    }

    /**
     * 获取loginlog列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return loginLogService.selectList(null);
    }

    /**
     * 新增loginlog
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(LoginLog loginLog) {
        loginLogService.insert(loginLog);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除loginlog
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer loginLogId) {
        loginLogService.deleteById(loginLogId);
        return SUCCESS_TIP;
    }

    /**
     * 修改loginlog
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(LoginLog loginLog) {
        loginLogService.updateById(loginLog);
        return super.SUCCESS_TIP;
    }

    /**
     * loginlog详情
     */
    @RequestMapping(value = "/detail/{loginLogId}")
    @ResponseBody
    public Object detail(@PathVariable("loginLogId") Integer loginLogId) {
        return loginLogService.selectById(loginLogId);
    }
}
