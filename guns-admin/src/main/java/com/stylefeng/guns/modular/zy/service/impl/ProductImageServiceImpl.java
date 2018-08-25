package com.stylefeng.guns.modular.zy.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.stylefeng.guns.common.exception.BizExceptionEnum;
import com.stylefeng.guns.common.persistence.dao.ProductMapper;
import com.stylefeng.guns.common.persistence.model.Product;
import com.stylefeng.guns.common.persistence.model.ProductImage;
import com.stylefeng.guns.common.persistence.dao.ProductImageMapper;
import com.stylefeng.guns.core.exception.GunsException;
import com.stylefeng.guns.modular.zy.service.IProductImageService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

import static com.stylefeng.guns.common.constant.factory.MutiStrFactory.MUTI_STR_KEY;
import static com.stylefeng.guns.common.constant.factory.MutiStrFactory.MUTI_STR_VALUE;
import static com.stylefeng.guns.common.constant.factory.MutiStrFactory.parseImageValue;

/**
 * <p>
 * 商品图片表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@Service
public class ProductImageServiceImpl extends ServiceImpl<ProductImageMapper, ProductImage> implements IProductImageService {
    @Resource
    ProductImageMapper productImageMapper;
    @Resource
    ProductMapper productMapper;

    @Override
    public void addProductImage(Integer productId, String imageValues) {
        //判断有没有该商品
        List<Product> product = productMapper.searchProductById(productId);
        if(product == null || product.size() == 0){
            throw new GunsException(BizExceptionEnum.PRODUCT_NOT_EXISTED);
        }

        //paramValues
        List<Map<String, String>> items = parseImageValue(imageValues);

        //添加字典条目
        for (Map<String, String> item : items) {
            String desc = item.get(MUTI_STR_KEY);
            String image = item.get(MUTI_STR_VALUE);
            ProductImage itemImage = new ProductImage();
            itemImage.setImage(image);
            itemImage.setDescription(desc);
            itemImage.setProductId(productId);

            this.productImageMapper.insert(itemImage);
        }
    }

    @Override
    public void editProductImage(Integer productId, String imageValues) {
        //删除之前的参数
        this.deleteProductImage(productId);

        //重新添加新的字典
        this.addProductImage(productId,imageValues);
    }

    @Override
    public void deleteProductImage(Integer productId) {
        //删除这个商品参数
        Wrapper<ProductImage> productImageEntityWrapper = new EntityWrapper<>();
        productImageEntityWrapper = productImageEntityWrapper.eq("productId", productId);
        productImageMapper.delete(productImageEntityWrapper);
    }
}
