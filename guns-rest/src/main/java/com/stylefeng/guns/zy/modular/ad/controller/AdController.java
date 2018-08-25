package com.stylefeng.guns.zy.modular.ad.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.rest.common.persistence.dao.AdMapper;
import com.stylefeng.guns.rest.common.persistence.dao.DictMapper;
import com.stylefeng.guns.rest.common.persistence.model.Dict;
import com.stylefeng.guns.zy.modular.dao.warpper.AdWarpper;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.rest.common.persistence.model.Ad;
import com.stylefeng.guns.zy.modular.ad.service.IAdService;

import java.util.List;
import java.util.Map;

/**
 * 获取广告控制器
 *
 * @author fengshuonan
 * @Date 2018-01-10 10:17:08
 */
@Controller
@RequestMapping("/ad")
public class AdController extends BaseController {

    private String PREFIX = "/ad/ad/";

    @Autowired
    private IAdService adService;

    @Autowired
    private AdMapper adMapper ;

    @Autowired
    private DictMapper dictMapper;

    /**
     * 跳转到获取广告首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "ad.html";
    }

    /**
     * 跳转到添加获取广告
     */
    @RequestMapping("/ad_add")
    public String adAdd() {
        return PREFIX + "ad_add.html";
    }

    /**
     * 跳转到修改获取广告
     */
    @RequestMapping("/ad_update/{adId}")
    public String adUpdate(@PathVariable Integer adId, Model model) {
        Ad ad = adService.selectById(adId);
        model.addAttribute("item",ad);
        //LogObjectHolder.me().set(ad);
        return PREFIX + "ad_edit.html";
    }

    /**
     * 获取获取广告列表
     */
    @ApiOperation(value="获取获取广告列表", notes="获取获取广告列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "type", value = "广告类别", dataType = "string", paramType="query"),
            @ApiImplicitParam(name = "position", value = "广告位置", dataType = "string", paramType="query")
    })
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestParam(name="type",required=false) String type,@RequestParam(name="position",required=false) String position) {
        EntityWrapper<Ad> wrapper = new EntityWrapper<>();
        Dict adType;
        if (!(type==null || type.isEmpty())){
            adType = dictMapper.getListByMain(type);
            wrapper.eq("typeId", adType.getId());
        }
        Dict adPosition;
        if (!(position==null || position.isEmpty())){
            adPosition = dictMapper.getListByMain(position);
            wrapper.eq("positionId", adPosition.getId());
        }

        List<Map<String, Object>> ad;
        if (wrapper.isEmptyOfWhere()){
            ad = adService.selectMaps(null);
        }else{
            ad = adService.selectMaps(wrapper);
        }

//        if (wrapper.isEmptyOfWhere()){
//            ad = adService.selectList(wrapper);
//        }else{
//            ad = adService.selectList(wrapper);
//        }
//        super.warpObject(new AdWarpper(ad));
        return super.returnStandardResult("data",super.warpObject(new AdWarpper(ad)));
    }

    /**
     * 新增获取广告
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Ad ad) {
        adService.insert(ad);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除获取广告
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer adId) {
        adService.deleteById(adId);
        return SUCCESS_TIP;
    }

    /**
     * 修改获取广告
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Ad ad) {
        adService.updateById(ad);
        return super.SUCCESS_TIP;
    }

    /**
     * 获取广告详情
     */
    @RequestMapping(value = "/detail/{adId}")
    @ResponseBody
    public Object detail(@PathVariable("adId") Integer adId) {
        return adService.selectById(adId);
    }
}
