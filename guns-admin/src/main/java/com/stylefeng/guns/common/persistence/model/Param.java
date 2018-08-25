package com.stylefeng.guns.common.persistence.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 系统参数表
 * </p>
 *
 * @author jerry
 * @since 2018-02-25
 */
@TableName("t_param")
public class Param extends Model<Param> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 一级提成
     */
	private BigDecimal firstcommission;
    /**
     * 二级提成
     */
	private BigDecimal secondcommission;
    /**
     * 每日云积分转换率
     */
	private BigDecimal dailyCloudConversionRate;
    /**
     * 每日消费积分转换率
     */
	private BigDecimal dailyConsumptionConversionRate;
    /**
     * 手续费率
     */
	private BigDecimal formalityRate;
    /**
     * 充值倍数
     */
	private BigDecimal rechargeTimes;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BigDecimal getFirstcommission() {
		return firstcommission;
	}

	public void setFirstcommission(BigDecimal firstcommission) {
		this.firstcommission = firstcommission;
	}

	public BigDecimal getSecondcommission() {
		return secondcommission;
	}

	public void setSecondcommission(BigDecimal secondcommission) {
		this.secondcommission = secondcommission;
	}

	public BigDecimal getDailyCloudConversionRate() {
		return dailyCloudConversionRate;
	}

	public void setDailyCloudConversionRate(BigDecimal dailyCloudConversionRate) {
		this.dailyCloudConversionRate = dailyCloudConversionRate;
	}

	public BigDecimal getDailyConsumptionConversionRate() {
		return dailyConsumptionConversionRate;
	}

	public void setDailyConsumptionConversionRate(BigDecimal dailyConsumptionConversionRate) {
		this.dailyConsumptionConversionRate = dailyConsumptionConversionRate;
	}

	public BigDecimal getFormalityRate() {
		return formalityRate;
	}

	public void setFormalityRate(BigDecimal formalityRate) {
		this.formalityRate = formalityRate;
	}

	public BigDecimal getRechargeTimes() {
		return rechargeTimes;
	}

	public void setRechargeTimes(BigDecimal rechargeTimes) {
		this.rechargeTimes = rechargeTimes;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Param{" +
			"id=" + id +
			", firstcommission=" + firstcommission +
			", secondcommission=" + secondcommission +
			", dailyCloudConversionRate=" + dailyCloudConversionRate +
			", dailyConsumptionConversionRate=" + dailyConsumptionConversionRate +
			", formalityRate=" + formalityRate +
			", rechargeTimes=" + rechargeTimes +
			"}";
	}
}
