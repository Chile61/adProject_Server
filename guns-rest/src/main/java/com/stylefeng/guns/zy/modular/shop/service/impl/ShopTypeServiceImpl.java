package com.stylefeng.guns.zy.modular.shop.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.stylefeng.guns.rest.common.persistence.dao.DictMapper;
import com.stylefeng.guns.rest.common.persistence.model.Dict;
import com.stylefeng.guns.zy.modular.shop.service.IShopTypeService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 获取商品类别 服务实现类
 * </p>
 *
 * @author luyi
 * @since 2018-01-04
 */
@Service
public class ShopTypeServiceImpl extends ServiceImpl<DictMapper, Dict> implements IShopTypeService {
	
}
