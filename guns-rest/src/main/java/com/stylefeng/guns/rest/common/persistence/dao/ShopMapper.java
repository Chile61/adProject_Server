package com.stylefeng.guns.rest.common.persistence.dao;

import com.stylefeng.guns.rest.common.persistence.model.Shop;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
  * 店铺表 Mapper 接口
 * </p>
 *
 * @author chile
 * @since 2018-01-07
 */
public interface ShopMapper extends BaseMapper<Shop> {
    /**
     * 通过店铺类型获取对应店铺列表
     * @param typeId
     * @return
     */
    List<Map<String, Object>> getShopList (@Param("typeId") Integer typeId);
}