package com.stylefeng.guns.modular.zy.service.impl;

import com.baomidou.mybatisplus.mapper.SqlRunner;
import com.stylefeng.guns.common.constant.Const;
import com.stylefeng.guns.common.persistence.dao.ConversionSumLogMapper;
import com.stylefeng.guns.common.persistence.model.*;
import com.stylefeng.guns.core.util.DateUtil;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.core.util.zyBackgroundUtil;
import com.stylefeng.guns.modular.zy.dao.ZyPointDao;
import com.stylefeng.guns.modular.zy.service.IParamService;
import com.stylefeng.guns.modular.zy.service.IZyPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.*;

@Service
public class ZyPointServiceImpl implements IZyPointService {

    @Autowired
    private ZyPointDao zyPointDao;

    @Autowired
    private IParamService iParamService;

    @Autowired
    private ConversionSumLogServiceImpl conversionSumLogService;

    @Autowired
    private CloudPointsAccountJournalServiceImpl cloudPointsAccountJournalService;

    @Autowired
    private ShoppingPointsAccountJournalServiceImpl shoppingPointsAccountJournalService;

    @Autowired
    private PointsAccountJournalServiceImpl pointsAccountJournalService;

    @Autowired
    private ConversionSumLogMapper cnvSumLogMapper;

    public List<Map<String, Object>> selectAllActiveUsers() {
        List<Map<String, Object>> activeUsers = zyPointDao.selectAllActiveUsers();
        return activeUsers;
    }

    @Transactional
    public void updateBatchUser(List<Map<String, Object>> list) {
        zyPointDao.updateBatchUser(list);
    }

    @Transactional
    public void insertBatchNormUserCnvLog(List<Map<String, Object>> list) {
        zyPointDao.insertBatchNormUserCnvLog(list);
    }

    @Transactional
    public void insertBatchPartnerUserCnvLog(List<Map<String, Object>> list) {
        zyPointDao.insertBatchPartnerUserCnvLog(list);
    }

    /**
     * 进行日常积分转换操作
     * @return true／false
     */
    @Transactional
    public Boolean dailyConversion() {
        List<Map<String, Object>> activeUsers = selectAllActiveUsers();
        List<Param> params = iParamService.selectList(null);
        Param param;
        if (params.size() > 0) {
            param = params.get(0);
            //获取转换规则
            String jsonPath = ToolUtil.getJarPath(this, Const.JSONRELPATH);
            Map<String, Object> jsonConfig = zyBackgroundUtil.getJsonConfig(jsonPath);
            String str = jsonConfig.get(Const.PARTNER_USER_LEVEL).toString();
            List<String> CloudConversionLevel = Arrays.asList(str.split(","));

            for (Map i : activeUsers) {

                String useId = i.get("id").toString();
                Map<String, Object> userYdPntAcctJourSum = getUserYdPntAcctJourSum(useId);
                Map<String, Object> userYdWithDrawSum = getUserYdWithDrawSum(useId);
                Map<String, Object> userYdShoppingSum = getUserYdShoppingSum(useId);
                i.put("account", "'" +i.get("account") + "每日转换'");
                //只填入转换率和昨日的数据，转换后数据通过映射的Mapper.xml计算
                i.put("cloudConverRate", param.getDailyCloudConversionRate());
                i.put("consumConverRate", param.getDailyConsumptionConversionRate());
                i.put("dailyWithdrawSum", ToolUtil.isEmpty(userYdWithDrawSum)?0:userYdWithDrawSum.get("pntsSum"));
                i.put("dailyRechargeSum", ToolUtil.isEmpty(userYdPntAcctJourSum)?0:userYdPntAcctJourSum.get("pntsSum"));
                i.put("formalityRate", param.getFormalityRate());
                i.put("dailyConsumptionSum", ToolUtil.isEmpty(userYdShoppingSum)?0:userYdShoppingSum.get("pntsSum"));
            }

            //将股东账户单独取出
            List<Map<String, Object>> cloudConversionUsers = new ArrayList<>();
            Iterator<Map<String, Object>> sListIterator = activeUsers.iterator();
            while (sListIterator.hasNext()) {
                Map<String, Object> e = sListIterator.next();
                String a = e.get("level").toString();
                if (CloudConversionLevel.contains(a)) {
                    cloudConversionUsers.add(e);
                    sListIterator.remove();
                }
            }
            if (activeUsers.size()>0){
                insertBatchNormUserCnvLog(activeUsers);//更新消费用户数据到总日志表
            }
            if (cloudConversionUsers.size()>0) {
                insertBatchPartnerUserCnvLog(cloudConversionUsers);//更新股东用户数据到总日志表
            }
            updateCnvSumLog();
            updateUserPoint();
            zyPointDao.insertBatchNormUserCloudJour(activeUsers);//更新股东用户云积分流水表
            zyPointDao.insertBatchPartnerUserCloudJour(cloudConversionUsers);//更新普通用户云积分流水表
            return true;
        } else {
            return false;
        }
    }

    /**
     * 更新转换汇总日志
     */
    public void updateCnvSumLog() {
        String toDay =  DateUtil.getDay();
        String sqlCnvLog = "select " +
                "SUM(cnvlog.points) as points," +
                "SUM(cnvlog.cloudPoints) as cloudPoints," +
                "SUM(cnvlog.onlyPayPoints) as onlyPayPoints," +
                "SUM(cnvlog.dailyCloudConverPoints) as dailyCloudConverPoints," +
                "SUM(cnvlog.dailyConsumptionConverPoints) as dailyConsumptionConverPoints," +
                "SUM(cnvlog.newPoints) as newPoints," +
                "SUM(cnvlog.newCloudPoints) as newCloudPoints," +
                "SUM(cnvlog.newOnlyPayPoints) as newOnlyPayPoints," +
                "SUM(cnvlog.dailyRechargeSum) as dailyRechargeSum," +
                "SUM(cnvlog.dailyWithdrawSum) as dailyWithdrawSum," +
                "SUM(cnvlog.dailyConsumptionSum) as dailyConsumptionSum" +
                " FROM " +
                " t_conversion_log as cnvlog " +
                " WHERE date(cnvlog.createTime) = '" + toDay + "'";
        Map<String, Object> cnvLogSum = SqlRunner.db().selectOne(sqlCnvLog);
        String sqlParam = "SELECT " +
                "dailyCloudConversionRate, " +
                "dailyConsumptionConversionRate," +
                "formalityRate " +
                "FROM t_param WHERE 1";
        Map<String, Object> param = SqlRunner.db().selectOne(sqlParam);
        ConversionSumLog t = new ConversionSumLog();
        t.setPoints((BigDecimal) cnvLogSum.get("points"));
        t.setCloudPoints((BigDecimal) cnvLogSum.get("cloudPoints"));
        t.setOnlyPayPoints((BigDecimal) cnvLogSum.get("onlyPayPoints"));
        t.setDailyCloudConversionRate((BigDecimal) param.get("dailyCloudConversionRate"));
        t.setDailyCloudConverPoints((BigDecimal) cnvLogSum.get("dailyCloudConverPoints"));
        t.setDailyConsumptionConversionRate((BigDecimal) param.get("dailyConsumptionConversionRate"));
        t.setDailyConsumptionConverPoints((BigDecimal) cnvLogSum.get("dailyConsumptionConverPoints"));
        t.setNewPoints((BigDecimal) cnvLogSum.get("newPoints"));
        t.setNewCloudPoints((BigDecimal) cnvLogSum.get("newCloudPoints"));
        t.setNewOnlyPayPoints((BigDecimal) cnvLogSum.get("newOnlyPayPoints"));
        t.setDailyRechargeSum((BigDecimal) cnvLogSum.get("dailyRechargeSum"));
        t.setDailyWithdrawSum((BigDecimal) cnvLogSum.get("dailyWithdrawSum"));
        t.setDailyConsumptionSum((BigDecimal) cnvLogSum.get("dailyConsumptionSum"));
        t.setFormalityRate((BigDecimal) param.get("formalityRate"));
        cnvSumLogMapper.insert(t);
    }

    /**
     * 根据结算记录更新用户表的各项积分
     */
    public void updateUserPoint() {
        String toDay =  DateUtil.getDay();
        String sql = "update t_user as t1 " +
                "left join t_conversion_log as t2 " +
                "on t1.id = t2.userId " +
                "set " +
                "t1.cloudPoints = t2.newCloudPoints, " +
                "t1.onlyPayPoints = t2.newOnlyPayPoints, " +
                "t1.points = t2.newPoints " +
                "where " +
                "t1.id = t2.userId and date(t2.createTime) = " +
                "'" + toDay + "'";
        SqlRunner.db().selectOne(sql);
    }

    /**
     * 统计用户过去24小时的充值总额
     * @param useId
     * @return
     */
    public Map<String, Object> getUserYdPntAcctJourSum(String useId) {
        //由于转换任务在凌晨进行，所以统计昨天的数据
        String cntTime =  DateUtil.getTime();
        String ydTime = DateUtil.getAfterDayDate("-1");
        String sql = "SELECT SUM(points) as pntsSum, userId " +
                "FROM `t_points_account_journal` " +
                "WHERE `userId` = " + useId +
                " and `dateTime` between " + "'" + ydTime + "'" + " and "  + "'" + cntTime + "'" +
                " and " + "description != " + "'" + Const.DESC_CNV + "'";
        Map<String, Object> data = SqlRunner.db().selectOne(sql);
        return data;
    }

    /**
     * 统计用户过去24小时的提现总额
     * @param useId
     * @return
     */
    public Map<String, Object> getUserYdWithDrawSum(String useId) {
        String cntTime =  DateUtil.getTime();
        String ydTime = DateUtil.getAfterDayDate("-1");
        String sql = "SELECT SUM(points) as pntsSum, userId " +
                "FROM `t_withdraw_log` " +
                "WHERE `userId` = " + useId +
                " and `dateTime` between " + "'" + ydTime + "'" + " and "  + "'" + cntTime + "'";
        Map<String, Object> data = SqlRunner.db().selectOne(sql);
        return data;
    }

    /**
     * 统计用户过去24小时的消费积分使用总额
     * @param useId
     * @return
     */
    public Map<String, Object> getUserYdShoppingSum(String useId) {
        //由于转换任务在凌晨进行，所以统计昨天的数据
        String cntTime =  DateUtil.getTime();
        String ydTime = DateUtil.getAfterDayDate("-1");
        String sql = "SELECT SUM(points) as pntsSum, userId " +
                "FROM `t_shopping_points_account_journal` " +
                "WHERE `userId` = " + useId +
                " and `dateTime` between " + "'" + ydTime + "'" + " and "  + "'" + cntTime + "'";
        Map<String, Object> data = SqlRunner.db().selectOne(sql);
        return data;
    }
}
