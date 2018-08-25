package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.common.exception.BizExceptionEnum;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.exception.GunsException;
import com.stylefeng.guns.core.util.ToolUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.common.persistence.model.AppVersion;
import com.stylefeng.guns.modular.zy.service.IAppVersionService;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

/**
 * 应用版本更新控制器
 *
 * @author fengshuonan
 * @Date 2018-05-09 22:45:16
 */
@Controller
@RequestMapping("/appVersion")
public class AppVersionController extends BaseController {

    private String PREFIX = "/zy/appVersion/";

    @Autowired
    private IAppVersionService appVersionService;

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
        LogObjectHolder.me().set(appVersion);
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

    /**
     * 上传图片
     */
    @RequestMapping(method = RequestMethod.POST, path = "/uploadApk")
    @ResponseBody
    public String upload(@RequestPart("file") MultipartFile apk) {
        String apkName = apk.getOriginalFilename();
        try {
            String fileSavePath = ToolUtil.getJarPath(this, "zyAssets/apk/");
            File file = new File(fileSavePath + apkName);
            apk.transferTo(file);
        } catch (Exception e) {
            throw new GunsException(BizExceptionEnum.UPLOAD_ERROR);
        }
        return "http://120.78.158.241:8200/apk/updateApk/"+apkName;
    }
}
