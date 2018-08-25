package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.common.persistence.model.CloudPointsAccountJournal;
import com.stylefeng.guns.common.persistence.model.TUser;
import com.stylefeng.guns.common.persistence.model.WithdrawLog;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.shiro.ShiroKit;
import com.stylefeng.guns.modular.zy.service.ICloudPointsAccountJournalService;
import com.stylefeng.guns.modular.zy.service.ITUserService;
import com.stylefeng.guns.modular.zy.service.IWithdrawLogService;
import com.stylefeng.guns.modular.zy.warpper.ApplyWarpper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.common.persistence.model.WithdrawApplyCloud;
import com.stylefeng.guns.modular.zy.service.IWithdrawApplyCloudService;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 申请提现云积分控制器
 *
 * @author fengshuonan
 * @Date 2018-05-07 21:32:34
 */
@Controller
@RequestMapping("/withdrawApplyCloud")
public class WithdrawApplyCloudController extends BaseController {

    private String PREFIX = "/zy/withdrawApplyCloud/";

    @Autowired
    private IWithdrawApplyCloudService withdrawApplyCloudService;
    @Autowired
    private ICloudPointsAccountJournalService cloudAcctJourService;
    @Autowired
    private IWithdrawLogService withdrawLogService;
    @Autowired
    private ITUserService tUserService;
    /**
     * 跳转到申请提现云积分首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "withdrawApplyCloud.html";
    }

    /**
     * 跳转到添加申请提现云积分
     */
    @RequestMapping("/withdrawApplyCloud_add")
    public String withdrawApplyCloudAdd() {
        return PREFIX + "withdrawApplyCloud_add.html";
    }

    /**
     * 跳转到修改申请提现云积分
     */
    @RequestMapping("/withdrawApplyCloud_update/{withdrawApplyCloudId}")
    public String withdrawApplyCloudUpdate(@PathVariable Integer withdrawApplyCloudId, Model model) {
        WithdrawApplyCloud withdrawApplyCloud = withdrawApplyCloudService.selectById(withdrawApplyCloudId);
        model.addAttribute("item",withdrawApplyCloud);
        LogObjectHolder.me().set(withdrawApplyCloud);
        return PREFIX + "withdrawApplyCloud_edit.html";
    }

    /**
     * 获取申请提现云积分列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        List<Map<String, Object>> withdrawApplyCloudList = withdrawApplyCloudService.selectMaps(null);
        Object objects = new ApplyWarpper(withdrawApplyCloudList).warp();
        return objects;
        //return withdrawApplyCloudService.selectList(null);
    }

    /**
     * 新增申请提现云积分
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(WithdrawApplyCloud withdrawApplyCloud) {
        withdrawApplyCloudService.insert(withdrawApplyCloud);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除申请提现云积分
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer withdrawApplyCloudId) {
        withdrawApplyCloudService.deleteById(withdrawApplyCloudId);
        return SUCCESS_TIP;
    }

    /**
     * 确认申请提现云积分
     */
    @RequestMapping(value = "/ok")
    @ResponseBody
    public Object ok(@RequestParam Integer withdrawApplyCloudId) {
        WithdrawApplyCloud withdrawApplyCloud = withdrawApplyCloudService.selectById(withdrawApplyCloudId);
        if (withdrawApplyCloud.getState()==0){
            TUser tUser = tUserService.selectById(withdrawApplyCloud.getUserId());
            tUser.setCash(tUser.getCloudPoints().subtract(new BigDecimal(withdrawApplyCloud.getPoints())));
            tUserService.updateById(tUser);
            withdrawApplyCloud.setState(1);
            withdrawApplyCloudService.updateById(withdrawApplyCloud);
            CloudPointsAccountJournal cloudAcctJour = new CloudPointsAccountJournal();
            cloudAcctJour.setUserId(tUser.getId());
            cloudAcctJour.setDescription(tUser.getAccount()+"提现");
            cloudAcctJour.setPoints(new BigDecimal(withdrawApplyCloud.getPoints()));
            cloudAcctJour.setType(7);
            cloudAcctJourService.insert(cloudAcctJour);

            WithdrawLog withdrawLog = new WithdrawLog();
            withdrawLog.setOperatorId(ShiroKit.getUser().getId());
            withdrawLog.setUserId(tUser.getId());
            withdrawLog.setPoints(new BigDecimal(withdrawApplyCloud.getPoints()));
            withdrawLogService.insert(withdrawLog);
        }
        return SUCCESS_TIP;
    }

    /**
     * 撤销申请提现云积分
     */
    @RequestMapping(value = "/cancel")
    @ResponseBody
    public Object cancel(@RequestParam Integer rechargeApplyCashId) {
        WithdrawApplyCloud withdrawApplyCloud = withdrawApplyCloudService.selectById(rechargeApplyCashId);
        if (withdrawApplyCloud.getState()==0){
            withdrawApplyCloud.setState(2);
            withdrawApplyCloudService.updateById(withdrawApplyCloud);
        }
        return SUCCESS_TIP;
    }

    /**
     * 修改申请提现云积分
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(WithdrawApplyCloud withdrawApplyCloud) {
        withdrawApplyCloudService.updateById(withdrawApplyCloud);
        return super.SUCCESS_TIP;
    }

    /**
     * 申请提现云积分详情
     */
    @RequestMapping(value = "/detail/{withdrawApplyCloudId}")
    @ResponseBody
    public Object detail(@PathVariable("withdrawApplyCloudId") Integer withdrawApplyCloudId) {
        return withdrawApplyCloudService.selectById(withdrawApplyCloudId);
    }
}
