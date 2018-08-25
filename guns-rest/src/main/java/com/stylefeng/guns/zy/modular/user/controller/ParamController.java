package com.stylefeng.guns.zy.modular.user.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.Param;
import com.stylefeng.guns.zy.modular.user.service.IParamService;

/**
 * userParam控制器
 *
 * @author fengshuonan
 * @Date 2018-01-01 14:44:05
 */
@Controller
@RequestMapping("/param")
public class ParamController extends BaseController {

    @Autowired
    private IParamService paramService;


    /**
     * 获取userParam列表
     */
    @ApiOperation(value="获取提成率等信息", notes="")
    @RequestMapping(value = "/list", method= RequestMethod.GET)
    @ResponseBody
    public Object list(String condition) {
        return paramService.selectList(null);
    }
}
