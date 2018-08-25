package com.stylefeng.guns.modular.zy.service;

import com.stylefeng.guns.common.persistence.model.Product;
import com.baomidou.mybatisplus.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品表 服务类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
public interface IProductService extends IService<Product> {
    /**
     * 按名称搜索产品
     *
     * @return
     * @date 2017年2月17日 下午8:28:43
     */
    List<Map<String,Object>> searchProducts(@Param("condition") String condition);
}
