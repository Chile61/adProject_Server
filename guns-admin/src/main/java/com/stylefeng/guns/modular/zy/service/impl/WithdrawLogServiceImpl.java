package com.stylefeng.guns.modular.zy.service.impl;

import com.stylefeng.guns.common.persistence.model.WithdrawLog;
import com.stylefeng.guns.common.persistence.dao.WithdrawLogMapper;
import com.stylefeng.guns.modular.zy.service.IWithdrawLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 提现日志 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@Service
public class WithdrawLogServiceImpl extends ServiceImpl<WithdrawLogMapper, WithdrawLog> implements IWithdrawLogService {
	
}
