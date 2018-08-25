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
import com.stylefeng.guns.common.persistence.model.CloudPointsAccountJournal;
import com.stylefeng.guns.modular.zy.service.ICloudPointsAccountJournalService;

/**
 * cloudpoints控制器
 *
 * @author fengshuonan
 * @Date 2018-01-17 22:20:07
 */
@Controller
@RequestMapping("/cloudPointsAccountJournal")
public class CloudPointsAccountJournalController extends BaseController {

    private String PREFIX = "/zy/cloudPointsAccountJournal/";

    @Autowired
    private ICloudPointsAccountJournalService cloudPointsAccountJournalService;

    /**
     * 跳转到cloudpoints首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "cloudPointsAccountJournal.html";
    }

    /**
     * 跳转到添加cloudpoints
     */
    @RequestMapping("/cloudPointsAccountJournal_add")
    public String cloudPointsAccountJournalAdd() {
        return PREFIX + "cloudPointsAccountJournal_add.html";
    }

    /**
     * 跳转到修改cloudpoints
     */
    @RequestMapping("/cloudPointsAccountJournal_update/{cloudPointsAccountJournalId}")
    public String cloudPointsAccountJournalUpdate(@PathVariable Integer cloudPointsAccountJournalId, Model model) {
        CloudPointsAccountJournal cloudPointsAccountJournal = cloudPointsAccountJournalService.selectById(cloudPointsAccountJournalId);
        model.addAttribute("item",cloudPointsAccountJournal);
        LogObjectHolder.me().set(cloudPointsAccountJournal);
        return PREFIX + "cloudPointsAccountJournal_edit.html";
    }

    /**
     * 获取cloudpoints列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return cloudPointsAccountJournalService.selectList(null);
    }

    /**
     * 新增cloudpoints
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(CloudPointsAccountJournal cloudPointsAccountJournal) {
        cloudPointsAccountJournalService.insert(cloudPointsAccountJournal);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除cloudpoints
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer cloudPointsAccountJournalId) {
        cloudPointsAccountJournalService.deleteById(cloudPointsAccountJournalId);
        return SUCCESS_TIP;
    }

    /**
     * 修改cloudpoints
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(CloudPointsAccountJournal cloudPointsAccountJournal) {
        cloudPointsAccountJournalService.updateById(cloudPointsAccountJournal);
        return super.SUCCESS_TIP;
    }

    /**
     * cloudpoints详情
     */
    @RequestMapping(value = "/detail/{cloudPointsAccountJournalId}")
    @ResponseBody
    public Object detail(@PathVariable("cloudPointsAccountJournalId") Integer cloudPointsAccountJournalId) {
        return cloudPointsAccountJournalService.selectById(cloudPointsAccountJournalId);
    }
}
