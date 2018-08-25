package com.stylefeng.guns.zy.modular.log.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.ConversionLog;
import com.stylefeng.guns.rest.common.persistence.dao.ConversionLogMapper;
import com.stylefeng.guns.zy.modular.log.service.IConversionLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 每天用户转换日志 服务实现类
 * </p>
 *
 * @author stylefeng
 * @since 2018-01-01
 */
@Service
public class ConversionLogServiceImpl extends ServiceImpl<ConversionLogMapper, ConversionLog> implements IConversionLogService {
	
}
