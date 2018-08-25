package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.common.persistence.model.TUser;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.modular.zy.service.impl.TUserServiceImpl;
import com.stylefeng.guns.modular.zy.service.impl.ZyPointHistoryServiceImpl;
import com.stylefeng.guns.modular.zy.warpper.TUserWarpper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/pointHistory")
public class PointHistoryController extends BaseController {

    private String PREFIX = "/zy/pointHistory/";

    @Autowired
    private ZyPointHistoryServiceImpl zypointHistoryService;

    @Autowired
    private TUserServiceImpl tUserServiceImpl;
    /**
     * 跳转到zyAdminUsers首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "pointHistory.html";
    }

    /**
     * 获取zyAdminUsers列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String beginTime, @RequestParam(required = false) String endTime, @RequestParam(required = false) Integer userRole, @RequestParam(required = false) Integer userLevel) {
        List<Map<String, Object>> tUsers = zypointHistoryService.selectAllActiveUsers(userRole,userLevel);
        BigDecimal allReward;
        for (Map tUser:tUsers) {
            //获取直推人
            Map<String, TUser> superior = tUserServiceImpl.getSuperiors(tUser.get("superior").toString());
            if (superior != null) {
                System.out.println(tUser.get("superior").toString());
                Map<String, TUser> superiors = tUserServiceImpl.getSuperiors(tUser.get("superior").toString());
                TUser first = superiors.get("first");
                if (first != null) {
                    tUser.put("superiorAccount", first.getAccount());
                }
            }
            BigDecimal sumFirstReward = new BigDecimal(0);
            BigDecimal sumSecondReward = new BigDecimal(0);
            BigDecimal sumThirdReward = new BigDecimal(0);
            BigDecimal sumManageRewardCount = new BigDecimal(0);
            //获取1级销售
            Map<String, Object> sumFirstClientRecharge = zypointHistoryService.selectSumFirstClientRecharge(tUser.get("id").toString(),beginTime,endTime);
            if (sumFirstClientRecharge != null) {
                tUser.put("firstCommissionPoints", sumFirstClientRecharge.get("sumFirstClientRecharge"));
            }
            //获取1级销售奖励
            Map<String, Object> sumFirstClientReward = zypointHistoryService.selectSumFirstClientReward(tUser.get("id").toString(),beginTime,endTime);
            if (sumFirstClientReward != null) {
                sumFirstReward = new BigDecimal(sumFirstClientReward.get("sumFirstClientReward").toString());
                tUser.put("firstClientReward", sumFirstClientReward.get("sumFirstClientReward"));
            }
            //获取2级销售
            Map<String, Object> sumSecondClientRecharge = zypointHistoryService.selectSumSecondClientRecharge(tUser.get("id").toString(),beginTime,endTime);
            if (sumSecondClientRecharge != null) {
                tUser.put("secondCommissionPoints", sumSecondClientRecharge.get("sumSecondClientRecharge"));
            }
            //获取2级销售奖励
            Map<String, Object> sumSecondClientReward = zypointHistoryService.selectSumSecondClientReward(tUser.get("id").toString(),beginTime,endTime);
            if (sumSecondClientReward != null) {
                sumSecondReward = new BigDecimal(sumSecondClientReward.get("sumSecondClientReward").toString());
                tUser.put("secondClientReward", sumSecondClientReward.get("sumSecondClientReward"));
            }

            //获取3级销售
            if (tUser.get("level").toString().equals("6")){
                Map<String, Object> sumThirdClientRecharge = zypointHistoryService.selectSumThirdClientRecharge(tUser.get("id").toString(),beginTime,endTime);
                if (sumThirdClientRecharge != null) {
                    tUser.put("thirdCommissionPoints", sumThirdClientRecharge.get("sumThirdClientRecharge"));
                }
            }
            //获取3级销售奖励
            Map<String, Object> sumThirdClientReward = zypointHistoryService.selectSumThirdClientReward(tUser.get("id").toString(),beginTime,endTime);
            if (sumThirdClientReward != null) {
                sumThirdReward = new BigDecimal(sumThirdClientReward.get("sumThirdClientReward").toString());
                tUser.put("thirdClientReward", sumThirdClientReward.get("sumThirdClientReward"));
            }
            //分享奖励总额
            tUser.put("clientReward", sumFirstReward.add(sumSecondReward.add(sumThirdReward)).toString());

            //获取用户全部下级冲值金额合计
            Map<String, Object> sumAllClientRecharge = zypointHistoryService.selectSumAllClientRecharge(tUser.get("id").toString(),beginTime,endTime);
            if (sumAllClientRecharge != null) {
                tUser.put("allClientRechargePoints", sumAllClientRecharge.get("sumAllClientRecharge"));
            }

            //获取用户统一管理奖合计
            Map<String, Object> sumManageReward = zypointHistoryService.selectSumManageReward(tUser.get("id").toString(),beginTime,endTime);
            if (sumManageReward != null) {
                sumManageRewardCount = new BigDecimal(sumManageReward.get("sumManageReward").toString());
                tUser.put("sumManageReward", sumManageReward.get("sumManageReward"));
            }
            //奖励合计
            tUser.put("rewardPointsSum", sumManageRewardCount.add(sumFirstReward.add(sumSecondReward.add(sumThirdReward))).toString());

            //获取用户消费合计
            Map<String, Object> sumRecharge = zypointHistoryService.selectSumRecharge(tUser.get("id").toString(),beginTime,endTime);
            if (sumRecharge != null) {
                tUser.put("sumRecharge", sumRecharge.get("sumRecharge"));
            }
            //获取用户提现合计
            Map<String, Object> sumWithdraw = zypointHistoryService.selectSumWithdraw(tUser.get("id").toString(),beginTime,endTime);
            if (sumWithdraw != null) {
                tUser.put("sumWithdraw", sumWithdraw.get("sumWithdraw"));
            }
        }
        Object objects = new TUserWarpper(tUsers).warp();
        //model.addAttribute("item",tUser);
        return objects;
    }

}
