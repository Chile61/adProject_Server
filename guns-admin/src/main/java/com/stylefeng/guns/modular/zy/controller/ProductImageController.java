package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.common.exception.BizExceptionEnum;
import com.stylefeng.guns.config.properties.GunsProperties;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.exception.GunsException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.common.persistence.model.ProductImage;
import com.stylefeng.guns.modular.zy.service.IProductImageService;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.UUID;

/**
 * productImage控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:53:57
 */
@Controller
@RequestMapping("/productImage")
public class ProductImageController extends BaseController {

    private String PREFIX = "/zy/productImage/";

    @Resource
    private GunsProperties gunsProperties;

    @Autowired
    private IProductImageService productImageService;

    /**
     * 跳转到productImage首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "productImage.html";
    }

    /**
     * 跳转到添加productImage
     */
    @RequestMapping("/productImage_add")
    public String productImageAdd() {
        return PREFIX + "productImage_add.html";
    }

    /**
     * 跳转到修改productImage
     */
    @RequestMapping("/productImage_update/{productImageId}")
    public String productImageUpdate(@PathVariable Integer productImageId, Model model) {
        ProductImage productImage = productImageService.selectById(productImageId);
        model.addAttribute("item",productImage);
        LogObjectHolder.me().set(productImage);
        return PREFIX + "productImage_edit.html";
    }

    /**
     * 获取productImage列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return productImageService.selectList(null);
    }

    /**
     * 新增productImage
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(ProductImage productImage) {
        productImageService.insert(productImage);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除productImage
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer productImageId) {
        productImageService.deleteById(productImageId);
        return SUCCESS_TIP;
    }

    /**
     * 修改productImage
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(ProductImage productImage) {
        productImageService.updateById(productImage);
        return super.SUCCESS_TIP;
    }

    /**
     * productImage详情
     */
    @RequestMapping(value = "/detail/{productImageId}")
    @ResponseBody
    public Object detail(@PathVariable("productImageId") Integer productImageId) {
        return productImageService.selectById(productImageId);
    }

    /**
     * 上传商品图片
     * @param picture
     * @return
     */
    @RequestMapping(method = RequestMethod.POST, path = "/upload")
    @ResponseBody
    public String upload(@RequestPart("file") MultipartFile picture) {
        String pictureName = UUID.randomUUID().toString() + ".jpg";
        try {
            String fileSavePath = gunsProperties.getFileUploadPath();
            File file = new File(fileSavePath + pictureName);
            picture.transferTo(file);
        } catch (Exception e) {
            throw new GunsException(BizExceptionEnum.UPLOAD_ERROR);
        }
        return pictureName;
    }
}
