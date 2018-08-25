package com.stylefeng.guns.modular.zy.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.common.annotion.BussinessLog;
import com.stylefeng.guns.common.annotion.Permission;
import com.stylefeng.guns.common.constant.Const;
import com.stylefeng.guns.common.constant.dictmap.DictMap;
import com.stylefeng.guns.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.common.exception.BizExceptionEnum;
import com.stylefeng.guns.common.persistence.dao.ProductMapper;
import com.stylefeng.guns.common.persistence.model.ProductImage;
import com.stylefeng.guns.common.persistence.model.ProductParam;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.exception.GunsException;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.zy.service.IProductImageService;
import com.stylefeng.guns.modular.zy.service.IProductParamService;
import com.stylefeng.guns.modular.zy.warpper.ProductCategoryWarpper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.common.persistence.model.Product;
import com.stylefeng.guns.modular.zy.service.IProductService;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * product控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:52:36
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController {

    private String PREFIX = "/zy/product/";

    @Autowired
    private IProductService productService;

    @Autowired
    private IProductImageService productImageService;

    @Autowired
    private IProductParamService productParamService;

    @Resource
    ProductMapper productMapper;
    /**
     * 跳转到product首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "product.html";
    }

    /**
     * 跳转到添加product
     */
    @RequestMapping("/product_add")
    public String productAdd() {
        return PREFIX + "product_add.html";
    }

    /**
     * 跳转到修改product
     */
    @RequestMapping("/product_update/{productId}")
    public String productUpdate(@PathVariable Integer productId, Model model) {
        Product product = productService.selectById(productId);
        model.addAttribute("shopName", ConstantFactory.me().getShopName(product.getShopId()));
        model.addAttribute("productCategoryName", ConstantFactory.me().getProductCategoryName(product.getCategoryId()));
        model.addAttribute("item",product);
        LogObjectHolder.me().set(product);
        return PREFIX + "product_edit.html";
    }

    /**
     * 商品图片
     */
    //TODO 参照webuploader的demmo写product_images.html页面
    @RequestMapping(value = "/product_images/{productId}")
    public String productImages(@PathVariable Integer productId, Model model) {
        List<ProductImage> productImages = productImageService
                .selectList(new EntityWrapper<ProductImage>()
                        .eq("productId",productId.toString()));
        model.addAttribute("images", productImages);
        return PREFIX + "product_images.html";
    }

    /**
     * 上传图片
     */
    @RequestMapping(method = RequestMethod.POST, path = "/upload")
    @ResponseBody
    public String upload(@RequestPart("file") MultipartFile picture) {
        String pictureName = UUID.randomUUID().toString() + ".jpg";
        try {
            //String filePath = "file:" + ToolUtil.getJarPath(this, "zyAssets/image/")+filename;
            //String fileSavePath = gunsProperties.getFileUploadPath();
            String fileSavePath = ToolUtil.getJarPath(this, "zyAssets/image/");
            File file = new File(fileSavePath + pictureName);
            picture.transferTo(file);
        } catch (Exception e) {
            throw new GunsException(BizExceptionEnum.UPLOAD_ERROR);
        }
        return "http://120.78.158.241:8200/images/"+pictureName;
    }

    /**
     * 商品参数
     */
    @RequestMapping(value = "/product_param/{productId}")
    public String productParam(@PathVariable Integer productId, Model model) {
        Product product = productMapper.selectById(productId);
        List<ProductParam> productParam = productParamService
                .selectList(new EntityWrapper<ProductParam>()
                        .eq("productId",productId.toString()));
        model.addAttribute("params", productParam);
        LogObjectHolder.me().set(product);
        return PREFIX + "product_param.html";
    }

//    /**
//     * 新增商品参数
//     *
//     * @param paramValues 格式例如   "产地:中国;生产日期:2018-05-04"
//     */
//    @RequestMapping(value = "/addParam")
//    @Permission(Const.ADMIN_NAME)
//    @ResponseBody
//    public Object add(Integer productId, String paramValues) {
//        if (ToolUtil.isOneEmpty(productId, paramValues)) {
//            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
//        }
//        this.productParamService.addProductParam(productId, paramValues);
//        return SUCCESS_TIP;
//    }

    /**
     * 修改商品参数
     */
    @RequestMapping(value = "/updateParam")
    @ResponseBody
    public Object updateParam(Integer productId, String paramValues) {
        if (ToolUtil.isOneEmpty(productId, paramValues)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        this.productParamService.editProductParam(productId,paramValues);
        return super.SUCCESS_TIP;
    }

    /**
     * 修改商品图片
     */
    @RequestMapping(value = "/updateImage")
    @ResponseBody
    public Object updateImage(Integer productId, String imageValues) {
        if (ToolUtil.isOneEmpty(productId, imageValues)) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        this.productImageService.editProductImage(productId,imageValues);
        return super.SUCCESS_TIP;
    }

    /**
     * 获取product列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(@RequestParam(required = false) String condition,@RequestParam(required = false) String shopId) {
        Object objects;
        EntityWrapper ew = new EntityWrapper<Product>();
        List<Map<String, Object>> tShops;
        if (condition!=null && !condition.equals("")) {
            ew.like("name", condition);
//            List<Map<String, Object>> tShops = productService.selectMaps(new EntityWrapper<Product>().like("name", condition));
//            objects = new ProductCategoryWarpper(tShops).warp();
        }
        if (shopId!=null && !shopId.equals("")){
            ew.eq("shopId", shopId);
//            List<Map<String, Object>> tShops = productService.selectMaps(new EntityWrapper<Product>().eq("shopId", shopId));
//            objects = new ProductCategoryWarpper(tShops).warp();
        }
        if (ew.isEmptyOfWhere()){
            tShops= productService.searchProducts(condition);
        }else{
            tShops= productService.selectMaps(ew);
        }
        objects = new ProductCategoryWarpper(tShops).warp();
        return objects;
    }

    /**
     * 新增product
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Product product) {
        productService.insert(product);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除product
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer productId) {
        productService.deleteById(productId);
        return SUCCESS_TIP;
    }

    /**
     * 修改product
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Product product) {
        productService.updateById(product);
        return super.SUCCESS_TIP;
    }

    /**
     * product详情
     */
    @RequestMapping(value = "/detail/{productId}")
    @ResponseBody
    public Object detail(@PathVariable("productId") Integer productId) {
        return productService.selectById(productId);
    }

}
