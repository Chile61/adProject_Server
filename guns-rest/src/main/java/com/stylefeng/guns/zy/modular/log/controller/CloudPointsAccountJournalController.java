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
import com.stylefeng.guns.rest.common.persistence.model.CloudPointsAccountJournal;
import com.stylefeng.guns.zy.modular.log.service.ICloudPointsAccountJournalService;

import java.util.List;
import java.util.Map;

/**
 * cloudPointsJournal控制器
 *
 * @author fengshuonan
 * @Date 2018-01-07 15:26:15
 */
@Controller
@RequestMapping("/cloudPointsAccountJournal")
public class CloudPointsAccountJournalController extends BaseController {

    private String PREFIX = "/log/cloudPointsAccountJournal/";

    @Autowired
    private ICloudPointsAccountJournalService cloudPointsAccountJournalService;

    @Autowired
    ZyUtil zyUtil;

    /**
     * 获取cloudPointsJournal列表
     */
    @ApiOperation(value="获取云积分转换日志", notes="获取云积分转换日志")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);
        List<CloudPointsAccountJournal> cpj = cloudPointsAccountJournalService.selectList(new EntityWrapper<CloudPointsAccountJournal>().eq("userId", user.getId()));
        return super.returnStandardResult("data", cpj);
    }

    /**
     * 新增cloudPointsJournal
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(CloudPointsAccountJournal cloudPointsAccountJournal) {
        cloudPointsAccountJournalService.insert(cloudPointsAccountJournal);
        return super.SUCCESS_TIP;
    }

    /**
     * cloudPointsJournal详情
     */
    @RequestMapping(value = "/detail/{cloudPointsAccountJournalId}")
    @ResponseBody
    public Object detail(@PathVariable("cloudPointsAccountJournalId") Integer cloudPointsAccountJournalId) {
        return cloudPointsAccountJournalService.selectById(cloudPointsAccountJournalId);
    }
}
