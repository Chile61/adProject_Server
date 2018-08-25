package com.stylefeng.guns.zy.modular.log.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.RechargeWithdrawSumLog;
import com.stylefeng.guns.rest.common.persistence.dao.RechargeWithdrawSumLogMapper;
import com.stylefeng.guns.zy.modular.log.service.IRechargeWithdrawSumLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 每天冲值和提现总数统计日志 服务实现类
 * </p>
 *
 * @author Chile
 * @since 2018-01-31
 */
@Service
public class RechargeWithdrawSumLogServiceImpl extends ServiceImpl<RechargeWithdrawSumLogMapper, RechargeWithdrawSumLog> implements IRechargeWithdrawSumLogService {
	
}
