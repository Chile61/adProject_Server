package com.stylefeng.guns.zy.modular.points.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.support.DateTime;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.RechargeApplyCash;
import com.stylefeng.guns.zy.modular.points.service.IRechargeApplyCashService;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * 申请冲值现金账户控制器
 *
 * @author fengshuonan
 * @Date 2018-05-07 09:33:57
 */
@Controller
@RequestMapping("/rechargeApplyCash")
public class RechargeApplyCashController extends BaseController {

    private String PREFIX = "/points/rechargeApplyCash/";

    @Autowired
    private IRechargeApplyCashService rechargeApplyCashService;

    @Autowired
    ZyUtil zyUtil;
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
        //LogObjectHolder.me().set(rechargeApplyCash);
        return PREFIX + "rechargeApplyCash_edit.html";
    }

    /**
     * 获取申请冲值现金账户列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return rechargeApplyCashService.selectList(null);
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
     * 申请冲值现金账户
     */
    @ApiOperation(value = "申请冲值现金账户", notes = "申请冲值现金账户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "cash", value = "金额", required = true, dataType = "string", paramType = "query")
    })
    @RequestMapping(value = "/apply", method = RequestMethod.POST)
    @ResponseBody
    public Object rechargeApplyCash(RechargeApplyCash rechargeApplyCash,
                              @RequestHeader String Authorization,
                              @RequestParam String cash) {
        Map<String, Object> standardMap = new HashMap<>();
        User user = zyUtil.getUserModel(Authorization);
        Integer userId = user.getId();
        try {
            rechargeApplyCash.setCash(new BigDecimal(cash));
            rechargeApplyCash.setUserId(userId);
            rechargeApplyCash.setState(0);
            rechargeApplyCash.setCreateTime(new DateTime());

        }catch (Exception e){
            e.printStackTrace();
        }


        if (rechargeApplyCashService.insert(rechargeApplyCash)) {
            standardMap.put("status", 1);
        }else{
            standardMap.put("status", 0);
        }
        return standardMap;
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
