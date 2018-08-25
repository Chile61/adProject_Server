package com.stylefeng.guns.zy.modular.order.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.Order;
import com.stylefeng.guns.rest.common.persistence.dao.OrderMapper;
import com.stylefeng.guns.zy.modular.order.service.IOrderService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 定单信息 服务实现类
 * </p>
 *
 * @author Chile
 * @since 2018-05-06
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {
	
}
