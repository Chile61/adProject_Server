package com.stylefeng.guns.common.persistence.dao;

import com.stylefeng.guns.common.persistence.model.Shop;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.stylefeng.guns.core.node.ZTreeNode;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
  * 店铺表 Mapper 接口
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
public interface ShopMapper extends BaseMapper<Shop> {
    /**
     * 获取店铺3列表（给前端select下拉选择）
     *
     * @author fengshuonan
     * @Date 2017/4/26 13:04
     */
    List<ZTreeNode> getShopTree();

    /**
     * 获取店铺名称
     *
     * @author fengshuonan
     * @Date 2018/4/26 13:04
     */
    Map<String, Object> getShopName(@Param("shopId") Integer shopId);
}