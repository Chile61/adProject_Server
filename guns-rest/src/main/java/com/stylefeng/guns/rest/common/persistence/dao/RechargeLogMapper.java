package com.stylefeng.guns.rest.common.persistence.dao;

import com.stylefeng.guns.rest.common.persistence.model.RechargeLog;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
  * 充值日志表 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2018-01-01
 */
public interface RechargeLogMapper extends BaseMapper<RechargeLog> {

    /**
     * 通过用户id和充值类型获取积分充值流水表
     * @param userId
     * @param type
     * @return
     */
    List<Map<String, Object>> getByUserIdAndType (@Param("userId") Integer userId, @Param("type") Integer type);
}