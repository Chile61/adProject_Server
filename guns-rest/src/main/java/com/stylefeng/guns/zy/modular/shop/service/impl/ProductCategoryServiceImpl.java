package com.stylefeng.guns.zy.modular.shop.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.ProductCategory;
import com.stylefeng.guns.rest.common.persistence.dao.ProductCategoryMapper;
import com.stylefeng.guns.zy.modular.shop.service.IProductCategoryService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品类别表 服务实现类
 * </p>
 *
 * @author Chile
 * @since 2018-01-15
 */
@Service
public class ProductCategoryServiceImpl extends ServiceImpl<ProductCategoryMapper, ProductCategory> implements IProductCategoryService {
	
}
