package com.stylefeng.guns.modular.zy.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ZyPointHistoryDao {

    /**
     * 获取所有启用状态的用户
     * @return
     */
    List<Map<String, Object>> selectAllActiveUsers(@Param("userRole") Integer userRole, @Param("userLevel") Integer userLevel);

    /**
     * 获取用户1级冲值金额合计
     * @return
     */
    Map<String, Object> selectSumFirstClientRecharge(@Param("superior") String superior,@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 获取用户1级奖励合计
     * @return
     */
    Map<String, Object> selectSumFirstClientReward(@Param("userId") String userId,@Param("beginTime") String beginTime, @Param("endTime") String endTime);
    /**
     * 获取用户2级冲值金额合计
     * @return
     */
    Map<String, Object> selectSumSecondClientRecharge(@Param("superiorSecond") String superiorSecond,@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 获取用户2级奖励合计
     * @return
     */
    Map<String, Object> selectSumSecondClientReward(@Param("userId") String userId,@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 获取用户3级冲值金额合计
     * @return
     */
    Map<String, Object> selectSumThirdClientRecharge(@Param("superiorThird") String superiorThird,@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 获取用户3级奖励合计
     * @return
     */
    Map<String, Object> selectSumThirdClientReward(@Param("userId") String userId,@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 获取用户全部下级冲值金额合计
     * @return
     */
    Map<String, Object> selectSumAllClientRecharge(@Param("userId") String userId,@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 获取用户统一管理奖合计
     * @return
     */
    Map<String, Object> selectSumManageReward(@Param("userId") String userId,@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 获取用户消费合计
     * @return
     */
    Map<String, Object> selectSumRecharge(@Param("userId") String userId,@Param("beginTime") String beginTime, @Param("endTime") String endTime);

    /**
     * 获取用户提现合计
     * @return
     */
    Map<String, Object> selectSumWithdraw(@Param("userId") String userId,@Param("beginTime") String beginTime, @Param("endTime") String endTime);
    /**
     * 获取下级信息
     * @param superior
     */
    List<Map<String, Object>> selectClient(@Param("superior") String superior);

    /**
     * 获取用户冲值积分记录统计信息
     * @param userId
     */
    List<Map<String, Object>> selectClientRechargePoints(@Param("userId") String userId);

    /**
     * 获取用户提成积分记录统计信息
     * @param userId
     */
    List<Map<String, Object>> selectClientCommissionPoints(@Param("userId") String userId);


    /**
     * 获取用户提成云积分记录统计信息
     * @param userId
     */
    List<Map<String, Object>> selectClientCommissionCloudPoints(@Param("userId") String userId);


    /**
     * 获取用户全部下线冲值积分记录统计信息
     * @param userId
     */
    List<Map<String, Object>> selectAllClientRechargePoints(@Param("userId") String userId);


    /**
     * 获取用户全部下线总人数记录统计信息
     * @param userId
     */
    List<Map<String, Object>> selectAllClientCount(@Param("userId") String userId);


    /**
     * 获取用户提现云积分记录统计信息
     * @param userId
     */
    List<Map<String, Object>> selectClientWithdrawCloudPoints(@Param("userId") String userId);

    /**
     * 获取用户管理奖积分记录统计信息
     * @param userId,fromId
     */
    List<Map<String, Object>> selectManagePoints(@Param("userId") String userId,@Param("userId") String fromId);
}
