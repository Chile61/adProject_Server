package com.stylefeng.guns.modular.zy.service;

import com.stylefeng.guns.common.persistence.model.ProductParam;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 商品参数表 服务类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
public interface IProductParamService extends IService<ProductParam> {
    /**
     * 添加商品参数
     *
     * @author fengshuonan
     * @Date 2017/4/27 17:01
     */
    void addProductParam(Integer productId, String paramValues);

    /**
     * 编辑商品参数
     *
     * @author fengshuonan
     * @Date 2017/4/28 11:01
     */
    void editProductParam(Integer productId, String paramValues);

    /**
     * 删除商品参数
     *
     * @author fengshuonan
     * @Date 2017/4/28 11:39
     */
    void deleteProductParam(Integer productId);
}
