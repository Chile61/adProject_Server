package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.common.exception.BizExceptionEnum;
import com.stylefeng.guns.common.persistence.dao.ShopMapper;
import com.stylefeng.guns.common.persistence.model.Dict;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.exception.GunsException;
import com.stylefeng.guns.core.node.ZTreeNode;
import com.stylefeng.guns.core.shiro.ShiroKit;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.system.dao.DictDao;
import com.stylefeng.guns.modular.system.service.IDictService;
import com.stylefeng.guns.modular.zy.warpper.ShopWarpper;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.common.persistence.model.Shop;
import com.stylefeng.guns.modular.zy.service.IShopService;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * shop控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:54:32
 */
@Controller
@RequestMapping("/shop")
public class ShopController extends BaseController {

    private String PREFIX = "/zy/shop/";

    @Autowired
    private IShopService shopService;

    @Resource
    DictDao dictDao;

    @Resource
    ShopMapper shopMapper;
    /**
     * 跳转到shop首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "shop.html";
    }

    /**
     * 跳转到添加shop
     */
    @RequestMapping("/shop_add")
    public String shopAdd(Model model) {
//        List<Map<String,Object>> shopType = dictDao.listByName("店铺类型");
//        model.addAttribute("shopType",shopType);
        return PREFIX + "shop_add.html";
    }

    /**
     * 跳转到修改shop
     */
    @RequestMapping("/shop_update/{shopId}")
    public String shopUpdate(@PathVariable Integer shopId, Model model) {
        Shop shop = shopService.selectById(shopId);
        model.addAttribute("shopTypeName", ConstantFactory.me().getShopType(shop.getTypeId()));
        model.addAttribute("item",shop);
        LogObjectHolder.me().set(shop);
        return PREFIX + "shop_edit.html";
    }

    /**
     * 获取shop列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        List<Map<String, Object>> tShops = shopService.selectMaps(null);
        Object objects = new ShopWarpper(tShops).warp();
        return  objects;
    }

    /**
     * 获取店铺的tree列表
     */
    @ApiOperation(value="获取店铺的tree列表", notes="获取店铺的tree列表")
    @RequestMapping(value = "/shopTree",method = RequestMethod.POST)
    @ResponseBody
    public List<ZTreeNode> tree() {
        List<ZTreeNode> tree = this.shopMapper.getShopTree();
        return tree;
    }
    /**
     * 新增shop
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Shop shop) {
        //Todo 下面三句以后改
        shop.setUserid(ShiroKit.getUser().getId());
        shop.setQRcode(0);
        shop.setCategory(0);
        shopService.insert(shop);
        return super.SUCCESS_TIP;
    }
    /**
     * 上传图片
     */
    @RequestMapping(method = RequestMethod.POST, path = "/upload")
    @ResponseBody
    public String upload(@RequestPart("file") MultipartFile picture) {
        String pictureName = UUID.randomUUID().toString() + ".jpg";
        try {
            String fileSavePath = ToolUtil.getJarPath(this, "zyAssets/image/");
            File file = new File(fileSavePath + pictureName);
            picture.transferTo(file);
        } catch (Exception e) {
            throw new GunsException(BizExceptionEnum.UPLOAD_ERROR);
        }
        return "http://120.78.158.241:8200/images/"+pictureName;
    }

    /**
     * 删除shop
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer shopId) {
        shopService.deleteById(shopId);
        return SUCCESS_TIP;
    }

    /**
     * 修改shop
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Shop shop) {
        shopService.updateById(shop);
        return super.SUCCESS_TIP;
    }

    /**
     * shop详情
     */
    @RequestMapping(value = "/detail/{shopId}")
    @ResponseBody
    public Object detail(@PathVariable("shopId") Integer shopId,Model model) {
//        List<Map<String,Object>> shopType = dictDao.listByName("店铺类型");
//        model.addAttribute("shopTypeName",shopType);
//        Shop shop = this.shopService.selectById(shopId);
//        model.addAttribute("shopTypeName", ConstantFactory.me().getShopType(shop.getTypeId()));
        return shopService.selectById(shopId);
    }
}
