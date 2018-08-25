package com.stylefeng.guns.zy.modular.points.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.support.DateTime;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.user.service.IUserService;
import com.stylefeng.guns.zy.modular.user.service.impl.UserServiceImpl;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.WithdrawApplyCloud;
import com.stylefeng.guns.zy.modular.points.service.IWithdrawApplyCloudService;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * 申请提现云积分控制器
 *
 * @author fengshuonan
 * @Date 2018-05-07 09:33:25
 */
@Controller
@RequestMapping("/withdrawApplyCloud")
public class WithdrawApplyCloudController extends BaseController {

    private String PREFIX = "/points/withdrawApplyCloud/";

    @Autowired
    private IWithdrawApplyCloudService withdrawApplyCloudService;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    ZyUtil zyUtil;
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
        //LogObjectHolder.me().set(withdrawApplyCloud);
        return PREFIX + "withdrawApplyCloud_edit.html";
    }

    /**
     * 获取申请提现云积分列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return withdrawApplyCloudService.selectList(null);
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
     * 申请提现云积分账户
     */
    @ApiOperation(value = "申请冲值现金账户", notes = "申请冲值现金账户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "points", value = "金额", required = true, dataType = "string", paramType = "query")
    })
    @RequestMapping(value = "/apply", method = RequestMethod.POST)
    @ResponseBody
    public Object withdrawApplyCloud(WithdrawApplyCloud withdrawApplyCloud,
                              @RequestHeader String Authorization,
                              @RequestParam Integer points) {
        Map<String, Object> standardMap = new HashMap<>();

        User user = zyUtil.getUserModel(Authorization);
        Integer userId = user.getId();

        BigDecimal BDPoints = new BigDecimal(points);
        if (BDPoints.compareTo(user.getCloudPoints()) > 0) {
            standardMap.put("status", 0);
            return standardMap;
        }

        try {
            withdrawApplyCloud.setPoints(points);
            withdrawApplyCloud.setUserId(userId);
            withdrawApplyCloud.setState(0);
            withdrawApplyCloud.setCreateTime(new DateTime());
        }catch (Exception e){
            e.printStackTrace();
        }


        if (withdrawApplyCloudService.insert(withdrawApplyCloud)) {
            user.setCloudPoints(user.getCloudPoints().subtract(BDPoints));
            userService.updateById(user);
            standardMap.put("status", 1);
        }else{
            standardMap.put("status", 0);
        }
        return standardMap;
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
