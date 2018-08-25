package com.stylefeng.guns.core.quartz.job;

import com.stylefeng.guns.modular.zy.service.impl.ZyPointServiceImpl;
import org.quartz.*;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;

@Component
public class ScheduledJob extends QuartzJobBean {

    /**
     * 每日积分转换工作
     * @param context
     * @throws JobExecutionException
     */
    //TODO 传入的dataMap应该包含数据库里给任务定义的信息
    @Override
    protected void executeInternal(JobExecutionContext context) {
        JobKey key = context.getJobDetail().getKey();
        JobDataMap dataMap = context.getJobDetail().getJobDataMap();
        ZyPointServiceImpl zyPointService = (ZyPointServiceImpl) dataMap.get("dailyConversion");
        zyPointService.dailyConversion();
        System.out.println("进行每日积分转换操作");
        System.out.println("Instance " + key);
    }
}
