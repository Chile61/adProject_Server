package com.stylefeng.guns.modular.zy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.stylefeng.guns.common.persistence.dao.OrderMapper;
import com.stylefeng.guns.common.persistence.model.Order;
import com.stylefeng.guns.modular.zy.service.IOrderService;
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
