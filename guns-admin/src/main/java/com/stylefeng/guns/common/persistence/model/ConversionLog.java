package com.stylefeng.guns.common.persistence.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 每天用户转换日志
 * </p>
 *
 * @author jerry
 * @since 2018-02-23
 */
@TableName("t_conversion_log")
public class ConversionLog extends Model<ConversionLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 用户id
     */
	private Integer userId;
    /**
     * 用户当前积分
     */
	private BigDecimal points;
    /**
     * 用户当前云积分
     */
	private BigDecimal cloudPoints;
    /**
     * 用户当前消费积分
     */
	private BigDecimal onlyPayPoints;
    /**
     * 每日云积分转换率
     */
	private BigDecimal dailyCloudConversionRate;
    /**
     * 每日获得云积分
     */
	private BigDecimal dailyCloudConverPoints;
    /**
     * 每日消费积分转换率
     */
	private BigDecimal dailyConsumptionConversionRate;
    /**
     * 每日获得消费积分
     */
	private BigDecimal dailyConsumptionConverPoints;
    /**
     * 每日结算后用户积分
     */
	private BigDecimal newPoints;
    /**
     * 每日结算后用户云积分
     */
	private BigDecimal newCloudPoints;
    /**
     * 每日结算后用户消费积分
     */
	private BigDecimal newOnlyPayPoints;
    /**
     * 当日充值积分
     */
	private BigDecimal dailyRechargeSum;
    /**
     * 当日提现总数
     */
	private BigDecimal dailyWithdrawSum;
    /**
     * 手续费率
     */
	private BigDecimal formalityRate;
    /**
     * 当日购物消费
     */
	private BigDecimal dailyConsumptionSum;
    /**
     * 转换时间
     */
	private Date createTime;
    /**
     * 是否成功
     */
	private String succeed;
    /**
     * 备注
     */
	private String message;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public BigDecimal getPoints() {
		return points;
	}

	public void setPoints(BigDecimal points) {
		this.points = points;
	}

	public BigDecimal getCloudPoints() {
		return cloudPoints;
	}

	public void setCloudPoints(BigDecimal cloudPoints) {
		this.cloudPoints = cloudPoints;
	}

	public BigDecimal getOnlyPayPoints() {
		return onlyPayPoints;
	}

	public void setOnlyPayPoints(BigDecimal onlyPayPoints) {
		this.onlyPayPoints = onlyPayPoints;
	}

	public BigDecimal getDailyCloudConversionRate() {
		return dailyCloudConversionRate;
	}

	public void setDailyCloudConversionRate(BigDecimal dailyCloudConversionRate) {
		this.dailyCloudConversionRate = dailyCloudConversionRate;
	}

	public BigDecimal getDailyCloudConverPoints() {
		return dailyCloudConverPoints;
	}

	public void setDailyCloudConverPoints(BigDecimal dailyCloudConverPoints) {
		this.dailyCloudConverPoints = dailyCloudConverPoints;
	}

	public BigDecimal getDailyConsumptionConversionRate() {
		return dailyConsumptionConversionRate;
	}

	public void setDailyConsumptionConversionRate(BigDecimal dailyConsumptionConversionRate) {
		this.dailyConsumptionConversionRate = dailyConsumptionConversionRate;
	}

	public BigDecimal getDailyConsumptionConverPoints() {
		return dailyConsumptionConverPoints;
	}

	public void setDailyConsumptionConverPoints(BigDecimal dailyConsumptionConverPoints) {
		this.dailyConsumptionConverPoints = dailyConsumptionConverPoints;
	}

	public BigDecimal getNewPoints() {
		return newPoints;
	}

	public void setNewPoints(BigDecimal newPoints) {
		this.newPoints = newPoints;
	}

	public BigDecimal getNewCloudPoints() {
		return newCloudPoints;
	}

	public void setNewCloudPoints(BigDecimal newCloudPoints) {
		this.newCloudPoints = newCloudPoints;
	}

	public BigDecimal getNewOnlyPayPoints() {
		return newOnlyPayPoints;
	}

	public void setNewOnlyPayPoints(BigDecimal newOnlyPayPoints) {
		this.newOnlyPayPoints = newOnlyPayPoints;
	}

	public BigDecimal getDailyRechargeSum() {
		return dailyRechargeSum;
	}

	public void setDailyRechargeSum(BigDecimal dailyRechargeSum) {
		this.dailyRechargeSum = dailyRechargeSum;
	}

	public BigDecimal getDailyWithdrawSum() {
		return dailyWithdrawSum;
	}

	public void setDailyWithdrawSum(BigDecimal dailyWithdrawSum) {
		this.dailyWithdrawSum = dailyWithdrawSum;
	}

	public BigDecimal getFormalityRate() {
		return formalityRate;
	}

	public void setFormalityRate(BigDecimal formalityRate) {
		this.formalityRate = formalityRate;
	}

	public BigDecimal getDailyConsumptionSum() {
		return dailyConsumptionSum;
	}

	public void setDailyConsumptionSum(BigDecimal dailyConsumptionSum) {
		this.dailyConsumptionSum = dailyConsumptionSum;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getSucceed() {
		return succeed;
	}

	public void setSucceed(String succeed) {
		this.succeed = succeed;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "ConversionLog{" +
			"id=" + id +
			", userId=" + userId +
			", points=" + points +
			", cloudPoints=" + cloudPoints +
			", onlyPayPoints=" + onlyPayPoints +
			", dailyCloudConversionRate=" + dailyCloudConversionRate +
			", dailyCloudConverPoints=" + dailyCloudConverPoints +
			", dailyConsumptionConversionRate=" + dailyConsumptionConversionRate +
			", dailyConsumptionConverPoints=" + dailyConsumptionConverPoints +
			", newPoints=" + newPoints +
			", newCloudPoints=" + newCloudPoints +
			", newOnlyPayPoints=" + newOnlyPayPoints +
			", dailyRechargeSum=" + dailyRechargeSum +
			", dailyWithdrawSum=" + dailyWithdrawSum +
			", formalityRate=" + formalityRate +
			", dailyConsumptionSum=" + dailyConsumptionSum +
			", createTime=" + createTime +
			", succeed=" + succeed +
			", message=" + message +
			"}";
	}
}
