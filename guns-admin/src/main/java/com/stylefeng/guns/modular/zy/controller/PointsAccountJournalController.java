package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.common.persistence.model.PointsAccountJournal;
import com.stylefeng.guns.modular.zy.service.IPointsAccountJournalService;

/**
 * pointsJournal控制器
 *
 * @author fengshuonan
 * @Date 2018-01-17 22:22:08
 */
@Controller
@RequestMapping("/pointsAccountJournal")
public class PointsAccountJournalController extends BaseController {

    private String PREFIX = "/zy/pointsAccountJournal/";

    @Autowired
    private IPointsAccountJournalService pointsAccountJournalService;

    /**
     * 跳转到pointsJournal首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "pointsAccountJournal.html";
    }

    /**
     * 跳转到添加pointsJournal
     */
    @RequestMapping("/pointsAccountJournal_add")
    public String pointsAccountJournalAdd() {
        return PREFIX + "pointsAccountJournal_add.html";
    }

    /**
     * 跳转到修改pointsJournal
     */
    @RequestMapping("/pointsAccountJournal_update/{pointsAccountJournalId}")
    public String pointsAccountJournalUpdate(@PathVariable Integer pointsAccountJournalId, Model model) {
        PointsAccountJournal pointsAccountJournal = pointsAccountJournalService.selectById(pointsAccountJournalId);
        model.addAttribute("item",pointsAccountJournal);
        LogObjectHolder.me().set(pointsAccountJournal);
        return PREFIX + "pointsAccountJournal_edit.html";
    }

    /**
     * 获取pointsJournal列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return pointsAccountJournalService.selectList(null);
    }

    /**
     * 新增pointsJournal
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(PointsAccountJournal pointsAccountJournal) {
        pointsAccountJournalService.insert(pointsAccountJournal);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除pointsJournal
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer pointsAccountJournalId) {
        pointsAccountJournalService.deleteById(pointsAccountJournalId);
        return SUCCESS_TIP;
    }

    /**
     * 修改pointsJournal
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(PointsAccountJournal pointsAccountJournal) {
        pointsAccountJournalService.updateById(pointsAccountJournal);
        return super.SUCCESS_TIP;
    }

    /**
     * pointsJournal详情
     */
    @RequestMapping(value = "/detail/{pointsAccountJournalId}")
    @ResponseBody
    public Object detail(@PathVariable("pointsAccountJournalId") Integer pointsAccountJournalId) {
        return pointsAccountJournalService.selectById(pointsAccountJournalId);
    }
}
