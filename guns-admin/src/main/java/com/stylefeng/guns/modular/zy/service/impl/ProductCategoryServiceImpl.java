package com.stylefeng.guns.modular.zy.service.impl;

import com.stylefeng.guns.common.persistence.model.ProductCategory;
import com.stylefeng.guns.common.persistence.dao.ProductCategoryMapper;
import com.stylefeng.guns.modular.zy.service.IProductCategoryService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品类别表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@Service
public class ProductCategoryServiceImpl extends ServiceImpl<ProductCategoryMapper, ProductCategory> implements IProductCategoryService {
	
}
