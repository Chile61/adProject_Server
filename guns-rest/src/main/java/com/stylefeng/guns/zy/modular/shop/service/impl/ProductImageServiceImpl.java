package com.stylefeng.guns.zy.modular.shop.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.ProductImage;
import com.stylefeng.guns.rest.common.persistence.dao.ProductImageMapper;
import com.stylefeng.guns.zy.modular.shop.service.IProductImageService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品图片表 服务实现类
 * </p>
 *
 * @author Chile
 * @since 2018-01-16
 */
@Service
public class ProductImageServiceImpl extends ServiceImpl<ProductImageMapper, ProductImage> implements IProductImageService {
	
}
