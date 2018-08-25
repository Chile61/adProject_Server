package com.stylefeng.guns.rest.common.persistence.dao;

import com.stylefeng.guns.rest.common.persistence.model.Product;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
  * 商品表 Mapper 接口
 * </p>
 *
 * @author luyi
 * @since 2018-01-04
 */
public interface ProductMapper extends BaseMapper<Product> {
    Product getProductById(@Param("productId") Integer productId);
}