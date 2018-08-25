package com.stylefeng.guns.modular.zy.service.impl;

import com.stylefeng.guns.modular.zy.dao.ZyPointHistoryDao;
import com.stylefeng.guns.modular.zy.service.IZyPointHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ZyPointHistoryServiceImpl implements IZyPointHistoryService {

    @Autowired
    private ZyPointHistoryDao zyPointHistoryDao;

    /**
     * 获取所有启用状态的用户
     * @return map
     */
    public List<Map<String, Object>> selectAllActiveUsers(Integer userRole,Integer userLevel) {
        List<Map<String, Object>> activeUsers = zyPointHistoryDao.selectAllActiveUsers(userRole,userLevel);
        return activeUsers;
    }

    /**
     * 获取用户1级冲值金额合计
     * @return map
     */
    public Map<String, Object> selectSumFirstClientRecharge(String superior,String beginTime,String endTime) {
        Map<String, Object> sumFirstClientRecharge = zyPointHistoryDao.selectSumFirstClientRecharge(superior,beginTime,endTime);
        return sumFirstClientRecharge;
    }

    /**
     * 获取用户1级奖励合计
     * @return map
     */
    public Map<String, Object> selectSumFirstClientReward(String userId,String beginTime,String endTime) {
        Map<String, Object> sumFirstClientReward = zyPointHistoryDao.selectSumFirstClientReward(userId,beginTime,endTime);
        return sumFirstClientReward;
    }

    /**
     * 获取用户2级冲值金额合计
     * @return map
     */
    public Map<String, Object> selectSumSecondClientRecharge(String superiorSecond,String beginTime,String endTime) {
        Map<String, Object> sumSecondClientRecharge = zyPointHistoryDao.selectSumSecondClientRecharge(superiorSecond,beginTime,endTime);
        return sumSecondClientRecharge;
    }

    /**
     * 获取用户2级奖励合计
     * @return map
     */
    public Map<String, Object> selectSumSecondClientReward(String userId,String beginTime,String endTime) {
        Map<String, Object> sumSecondClientReward = zyPointHistoryDao.selectSumSecondClientReward(userId,beginTime,endTime);
        return sumSecondClientReward;
    }

    /**
     * 获取用户3级冲值金额合计
     * @return map
     */
    public Map<String, Object> selectSumThirdClientRecharge(String superiorThird,String beginTime,String endTime) {
        Map<String, Object> sumThirdClientRecharge = zyPointHistoryDao.selectSumThirdClientRecharge(superiorThird,beginTime,endTime);
        return sumThirdClientRecharge;
    }
    /**
     * 获取用户3级奖励合计
     * @return map
     */
    public Map<String, Object> selectSumThirdClientReward(String userId,String beginTime,String endTime) {
        Map<String, Object> sumThirdClientReward = zyPointHistoryDao.selectSumThirdClientReward(userId,beginTime,endTime);
        return sumThirdClientReward;
    }

    /**
     * 获取用户全部下级冲值金额合计
     * @return map
     */
    public Map<String, Object> selectSumAllClientRecharge(String userId,String beginTime,String endTime) {
        Map<String, Object> sumAllClientRecharge = zyPointHistoryDao.selectSumAllClientRecharge(userId,beginTime,endTime);
        return sumAllClientRecharge;
    }

    /**
     * 获取用户统一管理奖合计
     * @return map
     */
    public Map<String, Object> selectSumManageReward(String userId,String beginTime,String endTime) {
        Map<String, Object> sumManageReward = zyPointHistoryDao.selectSumManageReward(userId,beginTime,endTime);
        return sumManageReward;
    }

    /**
     * 获取用户消费合计
     * @return map
     */
    public Map<String, Object> selectSumRecharge(String userId,String beginTime,String endTime) {
        Map<String, Object> sumRecharge = zyPointHistoryDao.selectSumRecharge(userId,beginTime,endTime);
        return sumRecharge;
    }

    /**
     * 获取用户提现合计
     * @return map
     */
    public Map<String, Object> selectSumWithdraw(String userId,String beginTime,String endTime) {
        Map<String, Object> sumWithdraw = zyPointHistoryDao.selectSumWithdraw(userId,beginTime,endTime);
        return sumWithdraw;
    }
    /**
     * 获取下级信息
     * @return map
     */
    public List<Map<String, Object>> selectClient(String superior) {
        List<Map<String, Object>> userClient = zyPointHistoryDao.selectClient(superior);
        return userClient;
    }

    /**
     * 获取用户冲值积分记录统计信息
     * @return map
     */
    public List<Map<String, Object>> selectClientRechargePoints(String userId) {
        List<Map<String, Object>> userRechargePoints = zyPointHistoryDao.selectClientRechargePoints(userId);
        return userRechargePoints;
    }

    /**
     * 获取用户提成积分记录统计信息
     * @return map
     */
    public List<Map<String, Object>> selectClientCommissionPoints(String userId) {
        List<Map<String, Object>> userCommissionPoints = zyPointHistoryDao.selectClientCommissionPoints(userId);
        return userCommissionPoints;
    }

    /**
     * 获取用户提成云积分记录统计信息
     * @return map
     */
    public List<Map<String, Object>> selectClientCommissionCloudPoints(String userId) {
        List<Map<String, Object>> userCommissionCloudPoints = zyPointHistoryDao.selectClientCommissionCloudPoints(userId);
        return userCommissionCloudPoints;
    }

    /**
     * 获取用户全部下线冲值积分记录统计信息
     * @return map
     */
    public List<Map<String, Object>> selectAllClientRechargePoints(String userId) {
        List<Map<String, Object>> userRechargePoints = zyPointHistoryDao.selectAllClientRechargePoints(userId);
        return userRechargePoints;
    }

    /**
     * 获取用户全部下线总人数记录统计信息
     * @return map
     */
    public List<Map<String, Object>> selectAllClientCount(String userId) {
        List<Map<String, Object>> userAllClientCount = zyPointHistoryDao.selectAllClientCount(userId);
        return userAllClientCount;
    }

    /**
     * 获取用户提现云积分记录统计信息
     * @return map
     */
    public List<Map<String, Object>> selectClientWithdrawCloudPoints(String userId) {
        List<Map<String, Object>> userWithdrawCloudPoints = zyPointHistoryDao.selectClientWithdrawCloudPoints(userId);
        return userWithdrawCloudPoints;
    }

    /**
     * 获取用户管理奖积分记录统计信息
     * @return map
     */
    public List<Map<String, Object>> selectManagePoints(String userId,String fromId) {
        List<Map<String, Object>> userManagePoints = zyPointHistoryDao.selectManagePoints(userId,fromId);
        return userManagePoints;
    }
}
