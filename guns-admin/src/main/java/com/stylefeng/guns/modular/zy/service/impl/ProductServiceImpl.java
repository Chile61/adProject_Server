package com.stylefeng.guns.modular.zy.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.common.persistence.model.Product;
import com.stylefeng.guns.common.persistence.dao.ProductMapper;
import com.stylefeng.guns.modular.zy.service.IProductService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {
    @Autowired
    private ProductMapper productMapper;
    /**
     * 搜索商品
     * @return map
     */
    public List<Map<String, Object>> searchProducts(String condition) {
        List<Map<String, Object>> products = productMapper.searchProducts(condition);
        return products;
    }

    /**
     * 搜索商品
     * @return map
     */
    public List<Product> searchProducts(Integer id) {
        List<Product> products = productMapper.selectList(new EntityWrapper<Product>().eq("id", id));
        return products;
    }
}
