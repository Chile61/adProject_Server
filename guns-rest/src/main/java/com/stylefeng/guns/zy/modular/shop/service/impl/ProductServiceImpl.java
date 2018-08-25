package com.stylefeng.guns.zy.modular.shop.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.Product;
import com.stylefeng.guns.rest.common.persistence.dao.ProductMapper;
import com.stylefeng.guns.zy.modular.shop.service.IProductService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品表 服务实现类
 * </p>
 *
 * @author luyi
 * @since 2018-01-04
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements IProductService {
	
}
