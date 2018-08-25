package com.stylefeng.guns.zy.modular.log.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.dao.ConversionLogMapper;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.ConversionLog;
import com.stylefeng.guns.zy.modular.log.service.IConversionLogService;

import java.util.List;
import java.util.Map;

/**
 * conversionlog控制器
 *
 * @author jerry
 * @Date 2018-01-01 15:58:21
 */
@Controller
@RequestMapping("/conversionLog")
public class ConversionLogController extends BaseController {

    @Autowired
    private IConversionLogService conversionLogService;

    @Autowired
    ZyUtil zyUtil;

    /**
     * 获取转换记录
     */
    @ApiOperation(value="获取转换记录", notes="获取转换记录")
    @RequestMapping(value = "/list", method=RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);
        List<ConversionLog> rechargeLogList = conversionLogService.selectList(new EntityWrapper<ConversionLog>().eq("userId", user.getId()));
        return super.returnStandardResult("conversionLog", rechargeLogList);
    }
}
