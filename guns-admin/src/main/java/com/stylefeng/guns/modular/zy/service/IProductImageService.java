package com.stylefeng.guns.modular.zy.service;

import com.stylefeng.guns.common.persistence.model.ProductImage;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 商品图片表 服务类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
public interface IProductImageService extends IService<ProductImage> {
    /**
     * 添加商品图片
     *
     * @author fengshuonan
     * @Date 2017/4/27 17:01
     */
    void addProductImage(Integer productId, String imageValues);

    /**
     * 编辑商品图片
     *
     * @author fengshuonan
     * @Date 2017/4/28 11:01
     */
    void editProductImage(Integer productId, String imageValues);

    /**
     * 删除商品图片
     *
     * @author fengshuonan
     * @Date 2017/4/28 11:39
     */
    void deleteProductImage(Integer productId);
}
