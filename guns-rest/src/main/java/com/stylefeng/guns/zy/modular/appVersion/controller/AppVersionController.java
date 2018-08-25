package com.stylefeng.guns.zy.modular.appVersion.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.dao.AppVersionMapper;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.AppVersion;
import com.stylefeng.guns.zy.modular.appVersion.service.IAppVersionService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 应用版本更新控制器
 *
 * @author fengshuonan
 * @Date 2018-05-09 22:38:33
 */
@Controller
@RequestMapping("/appVersion")
public class AppVersionController extends BaseController {

    private String PREFIX = "/appVersion/appVersion/";

    @Autowired
    private IAppVersionService appVersionService;

    @Resource
    private AppVersionMapper appVersionMapper;

    @Autowired
    ZyUtil zyUtil;
    /**
     * 跳转到应用版本更新首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "appVersion.html";
    }

    /**
     * 跳转到添加应用版本更新
     */
    @RequestMapping("/appVersion_add")
    public String appVersionAdd() {
        return PREFIX + "appVersion_add.html";
    }

    /**
     * 跳转到修改应用版本更新
     */
    @RequestMapping("/appVersion_update/{appVersionId}")
    public String appVersionUpdate(@PathVariable Integer appVersionId, Model model) {
        AppVersion appVersion = appVersionService.selectById(appVersionId);
        model.addAttribute("item",appVersion);
        //LogObjectHolder.me().set(appVersion);
        return PREFIX + "appVersion_edit.html";
    }

    /**
     * 获取应用版本更新列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return appVersionService.selectList(null);
    }

    /**
     * 新增应用版本更新
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(AppVersion appVersion) {
        appVersionService.insert(appVersion);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除应用版本更新
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer appVersionId) {
        appVersionService.deleteById(appVersionId);
        return SUCCESS_TIP;
    }

    /**
     * 获取最新的应用版本信息
     */
    @ApiOperation(value="获取最新的应用版本信息", notes="获取最新的应用版本信息")
    @RequestMapping(value = "/version",method = RequestMethod.POST)
    @ResponseBody
    public Object version(@RequestHeader String Authorization) {
        User currentUser = zyUtil.getUserModel(Authorization);
        if (currentUser==null){
            Map<String, Object> standardMap = new HashMap<>();
            standardMap.put("status", 0);
            return standardMap;
        }
        AppVersion appVersion = appVersionMapper.getLastVersion();
        return super.returnStandardDetail("data",appVersion);
    }

    /**
     * 修改应用版本更新
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(AppVersion appVersion) {
        appVersionService.updateById(appVersion);
        return super.SUCCESS_TIP;
    }

    /**
     * 应用版本更新详情
     */
    @RequestMapping(value = "/detail/{appVersionId}")
    @ResponseBody
    public Object detail(@PathVariable("appVersionId") Integer appVersionId) {
        return appVersionService.selectById(appVersionId);
    }
}
