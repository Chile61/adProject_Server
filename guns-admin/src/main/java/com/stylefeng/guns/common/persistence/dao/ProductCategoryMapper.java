package com.stylefeng.guns.common.persistence.dao;

import com.stylefeng.guns.common.persistence.model.ProductCategory;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.stylefeng.guns.core.node.ZTreeNode;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
  * 商品类别表 Mapper 接口
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
public interface ProductCategoryMapper extends BaseMapper<ProductCategory> {
    /**
     * 获取商品分类列表（给前端select下拉选择）
     *
     * @author fengshuonan
     * @Date 2017/4/26 13:04
     */
    List<ZTreeNode> getProductCategoryTree(@Param("categoryShopId") String categoryShopId);

    /**
     * 获取店铺名称
     *
     * @author fengshuonan
     * @Date 2018/4/26 13:04
     */
    Map<String, Object> getProductCategoryName(@Param("productCategoryId") Integer productCategoryId);
}