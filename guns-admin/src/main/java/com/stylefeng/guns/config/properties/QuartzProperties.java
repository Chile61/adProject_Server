package com.stylefeng.guns.config.properties;

import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

//这个类暂时没用
@Component
@ConfigurationProperties(prefix = QuartzProperties.PREFIX)
public class QuartzProperties {

    public static final String PREFIX = "quartz";
    private Integer enableTask = 1;
    private String Cron = "*/5 * * * * ?";

    public Integer getEnableTask() {
        return enableTask;
    }

    public void setEnableTask(Integer enableTask) {
        this.enableTask = enableTask;
    }

    public String getCron() {
        return Cron;
    }

    public void setCron(String Cron) {
        this.Cron = Cron;
    }
}