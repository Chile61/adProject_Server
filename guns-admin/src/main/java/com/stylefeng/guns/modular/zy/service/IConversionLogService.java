package com.stylefeng.guns.modular.zy.service;

import com.stylefeng.guns.common.persistence.model.ConversionLog;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 每天用户转换日志 服务类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
public interface IConversionLogService extends IService<ConversionLog> {
    public List<Map<String, Object>> getConversionLog();
}
