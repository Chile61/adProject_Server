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
import com.stylefeng.guns.rest.common.persistence.model.PointsAccountJournal;
import com.stylefeng.guns.zy.modular.log.service.IPointsAccountJournalService;

import java.util.List;
import java.util.Map;

/**
 * pointsAccountJournal控制器
 *
 * @author fengshuonan
 * @Date 2018-01-07 15:24:04
 */
@Controller
@RequestMapping("/pointsAccountJournal")
public class PointsAccountJournalController extends BaseController {

    private String PREFIX = "/log/pointsAccountJournal/";

    @Autowired
    private IPointsAccountJournalService paJournalService;

    @Autowired
    ZyUtil zyUtil;

    /**
     * 获取pointsAccountJournal列表
     */
    @ApiOperation(value="账户积分转换日志", notes="账户积分转换日志")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);
        List<PointsAccountJournal> paj = paJournalService.selectList(new EntityWrapper<PointsAccountJournal>().eq("userId", user.getId()));
        return super.returnStandardResult("data", paj);
    }

    /**
     * 新增pointsAccountJournal
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(PointsAccountJournal pointsAccountJournal) {
        paJournalService.insert(pointsAccountJournal);
        return super.SUCCESS_TIP;
    }

    /**
     * pointsAccountJournal详情
     */
    @RequestMapping(value = "/detail/{pointsAccountJournalId}")
    @ResponseBody
    public Object detail(@PathVariable("pointsAccountJournalId") Integer pointsAccountJournalId) {
        return paJournalService.selectById(pointsAccountJournalId);
    }
}
