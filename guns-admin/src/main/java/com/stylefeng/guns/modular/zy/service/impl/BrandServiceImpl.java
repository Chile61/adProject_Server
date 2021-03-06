package com.stylefeng.guns.modular.zy.service.impl;

import com.stylefeng.guns.common.persistence.model.Brand;
import com.stylefeng.guns.common.persistence.dao.BrandMapper;
import com.stylefeng.guns.modular.zy.service.IBrandService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户品牌表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@Service
public class BrandServiceImpl extends ServiceImpl<BrandMapper, Brand> implements IBrandService {
	
}
