package com.stylefeng.guns.common.persistence.dao;

import com.stylefeng.guns.common.persistence.model.Product;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
  * 商品表 Mapper 接口
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
public interface ProductMapper extends BaseMapper<Product> {
    /**
     * 按名称搜索产品
     *
     * @return
     * @date 2017年2月17日 下午8:28:43
     */
    List<Map<String,Object>> searchProducts(@Param("condition") String condition);
    /**
     * 按ID搜索产品
     *
     * @return
     * @date 2017年2月17日 下午8:28:43
     */
    List<Product> searchProductById(@Param("id") Integer id);
}