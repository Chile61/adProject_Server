package com.stylefeng.guns.modular.zy.service.impl;

import com.baomidou.mybatisplus.mapper.SqlRunner;
import com.stylefeng.guns.common.persistence.model.ConversionLog;
import com.stylefeng.guns.common.persistence.dao.ConversionLogMapper;
import com.stylefeng.guns.modular.zy.service.IConversionLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 每天用户转换日志 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@Service
public class ConversionLogServiceImpl extends ServiceImpl<ConversionLogMapper, ConversionLog> implements IConversionLogService {

    /**
     * 列出所有积分转换记录
     * @return
     */
    public List<Map<String, Object>> getConversionLog() {
            String sql = "SELECT t1.id,t1.userId,t2.account,t1.points,t1.cloudPoints,t1.onlyPayPoints, " +
                        "t1.dailyCloudConversionRate,t1.dailyCloudConverPoints, " +
                        "t1.dailyConsumptionConversionRate,t1.dailyConsumptionConverPoints, " +
                        "t1.newPoints,t1.newCloudPoints,t1.newOnlyPayPoints, " +
                        "t1.dailyRechargeSum,t1.dailyWithdrawSum,t1.formalityRate, " +
                        "t1.dailyConsumptionSum,t1.createTime,t1.succeed,t1.message " +
                        "FROM t_conversion_log as t1 LEFT JOIN t_user as t2 on t1.userId = t2.id ";
            List<Map<String, Object>> data = SqlRunner.db().selectList(sql);
            return data;
        }

    /**
     * 列出指定用户的积分转换记录
     * @param userId
     * @return
     */
    public List<Map<String, Object>> getConversionLog(Integer userId) {
            String sql = "SELECT t1.id,t1.userId,t2.account,t1.points,t1.cloudPoints,t1.onlyPayPoints, " +
            "t1.dailyCloudConversionRate,t1.dailyCloudConverPoints, t1.dailyConsumptionConversionRate, " +
            "t1.dailyConsumptionConverPoints, t1.newPoints,t1.newCloudPoints,t1.newOnlyPayPoints, " +
            "t1.dailyRechargeSum,t1.dailyWithdrawSum,t1.formalityRate, t1.dailyConsumptionSum, " +
            "t1.createTime,t1.succeed,t1.message FROM t_conversion_log as t1 " +
            "LEFT JOIN t_user as t2 on t1.userId = t2.id WHERE t1.userId = " + userId.toString();
            List<Map<String, Object>> data = SqlRunner.db().selectList(sql);
            return data;
        }
}
