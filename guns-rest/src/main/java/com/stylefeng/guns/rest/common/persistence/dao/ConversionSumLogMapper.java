package com.stylefeng.guns.rest.common.persistence.dao;

import com.stylefeng.guns.rest.common.persistence.model.ConversionSumLog;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.Map;

/**
 * <p>
  * 每天转换总日志 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2018-01-01
 */
public interface ConversionSumLogMapper extends BaseMapper<ConversionSumLog> {
    /**
     * 获取最后一次转换统计
     * @return
     */

    Map<String, Object> getLast ();
}