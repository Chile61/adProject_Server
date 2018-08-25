package com.stylefeng.guns.rest.common.persistence.dao;

import com.stylefeng.guns.rest.common.persistence.model.RechargeWithdrawSumLog;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
  * 每天冲值和提现总数统计日志 Mapper 接口
 * </p>
 *
 * @author Chile
 * @since 2018-01-31
 */
public interface RechargeWithdrawSumLogMapper extends BaseMapper<RechargeWithdrawSumLog> {
    /**
     * 获取最后一次冲值和提现统计
     * @return
     */
    Map<String, Object> getLast ();
}