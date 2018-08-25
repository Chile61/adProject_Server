package com.stylefeng.guns.zy.modular.order.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.OrderProduct;
import com.stylefeng.guns.rest.common.persistence.dao.OrderProductMapper;
import com.stylefeng.guns.zy.modular.order.service.IOrderProductService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
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
