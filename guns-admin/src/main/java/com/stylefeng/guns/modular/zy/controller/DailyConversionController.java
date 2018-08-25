package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.common.persistence.model.QuartzjobConfig;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.quartz.job.ScheduledJob;
import com.stylefeng.guns.core.util.SpringContextHolder;
import com.stylefeng.guns.modular.zy.service.impl.QuartzjobConfigServiceImpl;
import com.stylefeng.guns.modular.zy.service.impl.ZyPointServiceImpl;
import io.swagger.annotations.ApiOperation;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

//TODO 管理太简单应该结合dataMap来管理
@Controller
@RequestMapping("/dailyConversion")
public class DailyConversionController extends BaseController {

    @Autowired
    private ZyPointServiceImpl zyPointService;

    @Autowired
    private QuartzjobConfigServiceImpl quartzjobConfigService;

    private Scheduler scheduler = SpringContextHolder.getBean(Scheduler.class);

    @ApiOperation(value="创建每日积分转换任务", notes="创建每日积分转换任务")
    @RequestMapping(value = "/createConversionJob",method = RequestMethod.POST)
    @ResponseBody
    public String CreateJob(){
        List<QuartzjobConfig> quartzjobConfigList = quartzjobConfigService.selectList(null);
        try {
            if (scheduler.getPausedTriggerGroups().isEmpty()) {
                if (quartzjobConfigList.size() > 0) {
                    QuartzjobConfig quartzjobConfig = quartzjobConfigList.get(0);
                    JobDetail jobDetail = JobBuilder
                            .newJob(ScheduledJob.class)
                            .withIdentity(quartzjobConfig.getJobName(), quartzjobConfig.getGroupName())
                            .build();
                    jobDetail.getJobDataMap().put("dailyConversion", zyPointService);
                    //表达式调度构建器
                    CronScheduleBuilder scheduleBuilder = CronScheduleBuilder
                            .cronSchedule(quartzjobConfig.getCronExpression());
                    //按新的cronExpression表达式构建一个新的trigger
                    CronTrigger trigger = TriggerBuilder
                            .newTrigger()
                            .withIdentity(quartzjobConfig.getJobName(), quartzjobConfig.getGroupName())
                            .withSchedule(scheduleBuilder)
                            .build();
                    scheduler.scheduleJob(jobDetail, trigger);
                    return super.SUCCESS;
                } else {
                    return "积分转换任务配置不正确";
                }
            } else {
                return "已存在处于暂停状态的积分转换任务";
            }
        } catch (SchedulerException e) {
            return "已启动积分转换任务";
        }
    }

    @ApiOperation(value="暂停每日积分转换任务", notes="暂停每日积分转换任务")
    @RequestMapping(value = "/pauseConversionJob", method = RequestMethod.POST)
    @ResponseBody
    public Object PauseJob() {
        try {
            scheduler.pauseAll();
            return super.SUCCESS;
        }catch (SchedulerException e) {
            return super.ERROR;
        }
    }

    @ApiOperation(value="恢复每日积分转换任务", notes="恢复每日积分转换任务")
    @RequestMapping(value = "/resumeConversionJob",method = RequestMethod.POST)
    @ResponseBody
    public Object ResumeJob() {
        try {
            scheduler.resumeAll();
            return super.SUCCESS;
        }catch (SchedulerException e) {
            return super.ERROR;
        }
    }

    @ApiOperation(value="测试每日积分转换任务", notes="测试每日积分转换任务")
    @RequestMapping(value = "/testJob", method = RequestMethod.POST)
    @ResponseBody
    public Object TestJob() {
        List<QuartzjobConfig> quartzjobConfigList = quartzjobConfigService.selectList(null);
        if (quartzjobConfigList.size() > 0) {
            try {
                    QuartzjobConfig quartzjobConfig = quartzjobConfigList.get(0);
                    JobKey jobKey = JobKey.jobKey(quartzjobConfig.getJobName(), quartzjobConfig.getGroupName());
                    scheduler.triggerJob(jobKey);
                    return super.SUCCESS;
                } catch (SchedulerException e) {
                    return super.ERROR;
            }
        } else {
            return super.ERROR;
        }
    }
}
