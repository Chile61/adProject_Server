package com.stylefeng.guns.modular.zy.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.util.ToolUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.common.persistence.model.Param;
import com.stylefeng.guns.modular.zy.service.IParamService;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * param控制器
 *
 * @author fengshuonan
 * @Date 2018-02-23 19:30:51
 */
@Controller
@RequestMapping("/param")
public class ParamController extends BaseController {

    private String PREFIX = "/zy/param/";

    @Autowired
    private IParamService paramService;

    /**
     * 跳转到param首页
     */
    @RequestMapping("")
    public String index(Model model) {
        InputStream inputStream = null;
        try {
            String jsonPath = ToolUtil.getJarPath(this,"zyAssets/config/param.json");
            inputStream = new FileInputStream(jsonPath);
            String text = IOUtils.toString(inputStream,"utf8");
            Map<String, Object> cnf = JSON.parseObject(text, Map.class);
            model.addAllAttributes(cnf);
        } catch (Exception e) {
            e.printStackTrace();
        }

//        model.addAllAttributes();
        return PREFIX + "param.html";
    }

    /**
     * 跳转到添加param
     */
    @RequestMapping("/param_add")
    public String paramAdd() {
        return PREFIX + "param_add.html";
    }

    /**
     * 跳转到修改param
     */
    @RequestMapping("/param_update/{paramId}")
    public String paramUpdate(@PathVariable Integer paramId, Model model) {
        Param param = paramService.selectById(paramId);
        model.addAttribute("item",param);
        LogObjectHolder.me().set(param);
        return PREFIX + "param_edit.html";
    }

    /**
     * 获取param列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return paramService.selectList(null);
    }

    /**
     * 新增param
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Param param) {
        paramService.insert(param);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除param
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer paramId) {
        paramService.deleteById(paramId);
        return SUCCESS_TIP;
    }

    /**
     * 修改param
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Param param) {
        paramService.updateById(param);
        return super.SUCCESS_TIP;
    }

    /**
     * param详情
     */
    @RequestMapping(value = "/detail/{paramId}")
    @ResponseBody
    public Object detail(@PathVariable("paramId") Integer paramId) {
        return paramService.selectById(paramId);
    }

    /**
     *
     */
    @RequestMapping(value = "/levelSet")
    @ResponseBody
    public Object self() {
        String paramJson = ToolUtil.getJarPath(this,"zyAssets/config/param.json");
        File file = new File(paramJson);
        if (!file.exists()) {
            try {
                if (!file.getParentFile().exists()) { // 如果父目录不存在，创建父目录
                    file.getParentFile().mkdirs();
                }
                file.createNewFile();
                Map<String, Object> cnf = new HashMap<String, Object>();
                cnf.put("getCloudCommissionLevel", 1);
                cnf.put("getCloudConversionLevel", 1);
                String jsonStr = JSON.toJSONString(cnf);
                Writer write = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
                write.write(jsonStr);
                write.flush();
                write.close();
            } catch (Exception e) {
                e.printStackTrace();
                return super.ERROR;
            }
            return paramJson;
        }
        return paramJson;
    }
}
