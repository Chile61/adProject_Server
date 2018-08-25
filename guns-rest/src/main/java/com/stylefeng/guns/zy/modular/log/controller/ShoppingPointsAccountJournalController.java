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
import com.stylefeng.guns.rest.common.persistence.model.ShoppingPointsAccountJournal;
import com.stylefeng.guns.zy.modular.log.service.IShoppingPointsAccountJournalService;

import java.util.List;
import java.util.Map;

/**
 * shoppingPointsJournal控制器
 *
 * @author fengshuonan
 * @Date 2018-01-07 15:22:18
 */
@Controller
@RequestMapping("/shoppingPointsAccountJournal")
public class ShoppingPointsAccountJournalController extends BaseController {

    private String PREFIX = "/log/shoppingPointsAccountJournal/";

    @Autowired
    private IShoppingPointsAccountJournalService spaJournalService;

    @Autowired
    ZyUtil zyUtil;

    /**
     * 跳转到修改shoppingPointsJournal
     */
    @RequestMapping("/shoppingPointsAccountJournal_update/{shoppingPointsAccountJournalId}")
    public String shoppingPointsAccountJournalUpdate(@PathVariable Integer shoppingPointsAccountJournalId, Model model) {
        ShoppingPointsAccountJournal shoppingPointsAccountJournal = spaJournalService.selectById(shoppingPointsAccountJournalId);
        model.addAttribute("item",shoppingPointsAccountJournal);
//        LogObjectHolder.me().set(shoppingPointsAccountJournal);
        return PREFIX + "shoppingPointsAccountJournal_edit.html";
    }

    /**
     * 获取shoppingPointsJournal列表
     */
    @ApiOperation(value="获取购物积分日志", notes="获取购物积分日志")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);
        List<ShoppingPointsAccountJournal> spaj = spaJournalService.selectList(new EntityWrapper<ShoppingPointsAccountJournal>().eq("userId", user.getId()));
        return super.returnStandardResult("data", spaj);
    }

    /**
     * 新增shoppingPointsJournal
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ShoppingPointsAccountJournal shoppingPointsAccountJournal) {
        spaJournalService.insert(shoppingPointsAccountJournal);
        return super.SUCCESS_TIP;
    }

    /**
     * shoppingPointsJournal详情
     */
    @RequestMapping(value = "/detail/{shoppingPointsAccountJournalId}")
    @ResponseBody
    public Object detail(@PathVariable("shoppingPointsAccountJournalId") Integer shoppingPointsAccountJournalId) {
        return spaJournalService.selectById(shoppingPointsAccountJournalId);
    }
}
