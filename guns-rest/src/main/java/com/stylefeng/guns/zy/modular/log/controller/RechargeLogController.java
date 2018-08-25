package com.stylefeng.guns.zy.modular.log.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.dao.RechargeLogMapper;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.log.service.impl.RechargeLogServiceImpl;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.RechargeLog;
import com.stylefeng.guns.zy.modular.log.service.IRechargeLogService;

import java.util.List;
import java.util.Map;

/**
 * rechargelog控制器
 *
 * @author jerry
 * @Date 2018-01-01 16:02:06
 */
@Controller
@RequestMapping("/rechargeLog")
public class RechargeLogController extends BaseController {

    @Autowired
    IRechargeLogService iRechargeLogService;

    @Autowired
    RechargeLogMapper rechargeLogMapper;

    @Autowired
    ZyUtil zyUtil;

    /**
     * 获取充值记录日志
     */
    @ApiOperation(value="获取充值记录日志", notes="获取充值记录日志")
    @ApiImplicitParam(name = "type", value = "充值类型，0/1", required = true, dataType = "int", paramType="query")
    @RequestMapping(value = "/list", method=RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestHeader String Authorization, @RequestParam("type") Integer type) {
        User user = zyUtil.getUserModel(Authorization);
        List<Map<String, Object>> rechargeLogs;
        if (type != null) {
            rechargeLogs = rechargeLogMapper.getByUserIdAndType(user.getId(), type);
        }
        else {
            rechargeLogs = rechargeLogMapper.getByUserIdAndType(user.getId(), 1);
        }
        return super.returnStandardResult("data", rechargeLogs);
    }
}
