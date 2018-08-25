package com.stylefeng.guns.config.Quartz;
import org.quartz.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.*;

/**
 * Quartz核心概念
 * Job接口，实现类写具体的业务逻辑。
 * JobDetail 封装Job详细信息，如Job分组、名称、执行Job的类。
 * Trigger 触发器，记录触发器分组、名称、定时表达式。
 * CronExpression 定时表达式，封装在Trigger中。
 * Schedule 调度器。Schedule动态操作Job。
 * 如新增、更新、暂停、启动、删除、立即执行等。JobDetail 、Trigger 需要注册到Schedule中。
 */
@Configuration
public class JobConfig {

    /**
     * 调度器，可以操作每个Job，如新增、更新、暂停等。JobDetail、Trigger需要注册到Schedule中，
     * 这里把JobDetail和Trigger打包进jobConfigBean了
     * @return
     */
    @Bean("schedulerFactoryBean")
    public SchedulerFactoryBean schedulerFactoryBean() throws SchedulerException {
        //一个定时任务，注意这里是调度器工厂，不是调度器，上面的定时器、任务详情也一样
        SchedulerFactoryBean schedulerFactoryBean = new SchedulerFactoryBean();
        return schedulerFactoryBean;
    }
}
