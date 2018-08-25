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
import com.stylefeng.guns.common.persistence.model.ShoppingPointsAccountJournal;
import com.stylefeng.guns.modular.zy.service.IShoppingPointsAccountJournalService;

/**
 * shoppingPointsJournal控制器
 *
 * @author fengshuonan
 * @Date 2018-01-17 22:24:19
 */
@Controller
@RequestMapping("/shoppingPointsAccountJournal")
public class ShoppingPointsAccountJournalController extends BaseController {

    private String PREFIX = "/zy/shoppingPointsAccountJournal/";

    @Autowired
    private IShoppingPointsAccountJournalService shoppingPointsAccountJournalService;

    /**
     * 跳转到shoppingPointsJournal首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "shoppingPointsAccountJournal.html";
    }

    /**
     * 跳转到添加shoppingPointsJournal
     */
    @RequestMapping("/shoppingPointsAccountJournal_add")
    public String shoppingPointsAccountJournalAdd() {
        return PREFIX + "shoppingPointsAccountJournal_add.html";
    }

    /**
     * 跳转到修改shoppingPointsJournal
     */
    @RequestMapping("/shoppingPointsAccountJournal_update/{shoppingPointsAccountJournalId}")
    public String shoppingPointsAccountJournalUpdate(@PathVariable Integer shoppingPointsAccountJournalId, Model model) {
        ShoppingPointsAccountJournal shoppingPointsAccountJournal = shoppingPointsAccountJournalService.selectById(shoppingPointsAccountJournalId);
        model.addAttribute("item",shoppingPointsAccountJournal);
        LogObjectHolder.me().set(shoppingPointsAccountJournal);
        return PREFIX + "shoppingPointsAccountJournal_edit.html";
    }

    /**
     * 获取shoppingPointsJournal列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return shoppingPointsAccountJournalService.selectList(null);
    }

    /**
     * 新增shoppingPointsJournal
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ShoppingPointsAccountJournal shoppingPointsAccountJournal) {
        shoppingPointsAccountJournalService.insert(shoppingPointsAccountJournal);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除shoppingPointsJournal
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer shoppingPointsAccountJournalId) {
        shoppingPointsAccountJournalService.deleteById(shoppingPointsAccountJournalId);
        return SUCCESS_TIP;
    }

    /**
     * 修改shoppingPointsJournal
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ShoppingPointsAccountJournal shoppingPointsAccountJournal) {
        shoppingPointsAccountJournalService.updateById(shoppingPointsAccountJournal);
        return super.SUCCESS_TIP;
    }

    /**
     * shoppingPointsJournal详情
     */
    @RequestMapping(value = "/detail/{shoppingPointsAccountJournalId}")
    @ResponseBody
    public Object detail(@PathVariable("shoppingPointsAccountJournalId") Integer shoppingPointsAccountJournalId) {
        return shoppingPointsAccountJournalService.selectById(shoppingPointsAccountJournalId);
    }
}
