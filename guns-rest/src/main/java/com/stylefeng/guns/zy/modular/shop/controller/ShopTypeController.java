package com.stylefeng.guns.zy.modular.shop.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.dao.DictMapper;
import com.stylefeng.guns.rest.common.persistence.model.Dict;
import com.stylefeng.guns.zy.modular.shop.service.IShopTypeService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * product控制器
 *
 * @author fengshuonan
 * @Date 2018-01-04 22:08:15
 */
@Controller
@RequestMapping("/shopType")
public class ShopTypeController extends BaseController {

    @Autowired
    private IShopTypeService shopTypeService;

    @Autowired
    private DictMapper dictMapper;

    /**
     * 获取店铺类型列表
     */
    @ApiOperation(value="获取店铺类型列表", notes="获取店铺类型列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list() {
        EntityWrapper<Dict> wrapper = new EntityWrapper<>();
        Dict dictMain = dictMapper.getListByMain("店铺类型");
        List<Dict> dict = shopTypeService.selectList(wrapper.eq("pid", dictMain.getId()));
        return super.returnStandardResult("data", dict);
    }

}
