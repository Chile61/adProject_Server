package com.stylefeng.guns.zy.modular.log.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.LoginLog;
import com.stylefeng.guns.rest.common.persistence.dao.LoginLogMapper;
import com.stylefeng.guns.zy.modular.log.service.ILoginLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 登录记录 服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2018-01-01
 */
@Service
public class LoginLogServiceImpl extends ServiceImpl<LoginLogMapper, LoginLog> implements ILoginLogService {
	
}
