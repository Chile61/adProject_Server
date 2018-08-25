package com.stylefeng.guns.modular.zy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.stylefeng.guns.common.persistence.dao.OrderProductMapper;
import com.stylefeng.guns.common.persistence.model.OrderProduct;
import com.stylefeng.guns.modular.zy.service.IOrderProductService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单商品列表 服务实现类
 * </p>
 *
 * @author Chile
 * @since 2018-05-06
 */
@Service
public class OrderProductServiceImpl extends ServiceImpl<OrderProductMapper, OrderProduct> implements IOrderProductService {
	
}
