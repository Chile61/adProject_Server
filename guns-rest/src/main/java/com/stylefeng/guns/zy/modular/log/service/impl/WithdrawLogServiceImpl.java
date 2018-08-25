package com.stylefeng.guns.zy.modular.log.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.WithdrawLog;
import com.stylefeng.guns.rest.common.persistence.dao.WithdrawLogMapper;
import com.stylefeng.guns.zy.modular.log.service.IWithdrawLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 提现日志 服务实现类
 * </p>
 *
 * @author chile
 * @since 2018-01-09
 */
@Service
public class WithdrawLogServiceImpl extends ServiceImpl<WithdrawLogMapper, WithdrawLog> implements IWithdrawLogService {
	
}
