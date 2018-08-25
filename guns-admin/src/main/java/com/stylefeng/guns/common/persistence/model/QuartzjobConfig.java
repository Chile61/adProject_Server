package com.stylefeng.guns.common.persistence.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author jerry
 * @since 2018-01-14
 */
@TableName("t_quartzjob_config")
public class QuartzjobConfig extends Model<QuartzjobConfig> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 创建时间
     */
	@TableField("create_at")
	private Date createAt;
    /**
     * 任务运行时间表达式
     */
	@TableField("cron_expression")
	private String cronExpression;
    /**
     * 任务描述
     */
	@TableField("job_desc")
	private String jobDesc;
    /**
     * 任务组名
     */
	@TableField("group_name")
	private String groupName;
    /**
     * 任务名称
     */
	@TableField("job_name")
	private String jobName;
    /**
     * 任务状态 0禁用 1启用 2删除
     */
	@TableField("job_status")
	private Integer jobStatus;
    /**
     * 更新时间
     */
	@TableField("update_at")
	private Date updateAt;
    /**
     * 任务sql
     */
	@TableField("job_sql")
	private String jobSql;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public String getCronExpression() {
		return cronExpression;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	public String getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public Integer getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(Integer jobStatus) {
		this.jobStatus = jobStatus;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

	public String getJobSql() {
		return jobSql;
	}

	public void setJobSql(String jobSql) {
		this.jobSql = jobSql;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "QuartzjobConfig{" +
			"id=" + id +
			", createAt=" + createAt +
			", cronExpression=" + cronExpression +
			", jobDesc=" + jobDesc +
			", groupName=" + groupName +
			", jobName=" + jobName +
			", jobStatus=" + jobStatus +
			", updateAt=" + updateAt +
			", jobSql=" + jobSql +
			"}";
	}
}
