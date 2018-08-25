package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.common.persistence.model.CloudPointsAccountJournal;
import com.stylefeng.guns.common.persistence.model.TUser;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.modular.zy.service.ITUserService;
import com.stylefeng.guns.modular.zy.warpper.ApplyWarpper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.common.persistence.model.RechargeApplyCash;
import com.stylefeng.guns.modular.zy.service.IRechargeApplyCashService;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 申请冲值现金账户控制器
 *
 * @author fengshuonan
 * @Date 2018-05-07 21:33:34
 */
@Controller
@RequestMapping("/rechargeApplyCash")
public class RechargeApplyCashController extends BaseController {

    private String PREFIX = "/zy/rechargeApplyCash/";

    @Autowired
    private IRechargeApplyCashService rechargeApplyCashService;

    @Autowired
    private ITUserService tUserService;
    /**
     * 跳转到申请冲值现金账户首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "rechargeApplyCash.html";
    }

    /**
     * 跳转到添加申请冲值现金账户
     */
    @RequestMapping("/rechargeApplyCash_add")
    public String rechargeApplyCashAdd() {
        return PREFIX + "rechargeApplyCash_add.html";
    }

    /**
     * 跳转到修改申请冲值现金账户
     */
    @RequestMapping("/rechargeApplyCash_update/{rechargeApplyCashId}")
    public String rechargeApplyCashUpdate(@PathVariable Integer rechargeApplyCashId, Model model) {
        RechargeApplyCash rechargeApplyCash = rechargeApplyCashService.selectById(rechargeApplyCashId);
        model.addAttribute("item",rechargeApplyCash);
        LogObjectHolder.me().set(rechargeApplyCash);
        return PREFIX + "rechargeApplyCash_edit.html";
    }

    /**
     * 获取申请冲值现金账户列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        //return rechargeApplyCashService.selectList(null);
        List<Map<String, Object>> rechargeApplyCashList = rechargeApplyCashService.selectMaps(null);
        Object objects = new ApplyWarpper(rechargeApplyCashList).warp();
        return objects;
    }

    /**
     * 新增申请冲值现金账户
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(RechargeApplyCash rechargeApplyCash) {
        rechargeApplyCashService.insert(rechargeApplyCash);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除申请冲值现金账户
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer rechargeApplyCashId) {
        rechargeApplyCashService.deleteById(rechargeApplyCashId);
        return SUCCESS_TIP;
    }

    /**
     * 确认申请冲值现金账户
     */
    @RequestMapping(value = "/ok")
    @ResponseBody
    public Object ok(@RequestParam Integer rechargeApplyCashId) {
        RechargeApplyCash rechargeApplyCash = rechargeApplyCashService.selectById(rechargeApplyCashId);
        if (rechargeApplyCash.getState()==0){
            TUser tUser = tUserService.selectById(rechargeApplyCash.getUserId());
            tUser.setCash(tUser.getCash().add(rechargeApplyCash.getCash()));
            tUserService.updateById(tUser);
            rechargeApplyCash.setState(1);
            rechargeApplyCashService.updateById(rechargeApplyCash);
        }
        return SUCCESS_TIP;
    }

    /**
     * 撤销申请冲值现金账户
     */
    @RequestMapping(value = "/cancel")
    @ResponseBody
    public Object cancel(@RequestParam Integer rechargeApplyCashId) {
        //rechargeApplyCashService.deleteById(rechargeApplyCashId);
        RechargeApplyCash rechargeApplyCash = rechargeApplyCashService.selectById(rechargeApplyCashId);
        if (rechargeApplyCash.getState()==0){
            rechargeApplyCash.setState(2);
            rechargeApplyCashService.updateById(rechargeApplyCash);
        }
        return SUCCESS_TIP;
    }


    /**
     * 修改申请冲值现金账户
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(RechargeApplyCash rechargeApplyCash) {
        rechargeApplyCashService.updateById(rechargeApplyCash);
        return super.SUCCESS_TIP;
    }

    /**
     * 申请冲值现金账户详情
     */
    @RequestMapping(value = "/detail/{rechargeApplyCashId}")
    @ResponseBody
    public Object detail(@PathVariable("rechargeApplyCashId") Integer rechargeApplyCashId) {
        return rechargeApplyCashService.selectById(rechargeApplyCashId);
    }
}
