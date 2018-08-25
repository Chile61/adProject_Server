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
 * 提现日志
 * </p>
 *
 * @author jerry
 * @since 2018-02-23
 */
@TableName("t_withdraw_log")
public class WithdrawLog extends Model<WithdrawLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 操作员id
     */
	private Integer operatorId;
    /**
     * 用户id
     */
	private Integer userId;
    /**
     * 提现积分
     */
	private BigDecimal points;
    /**
     * 手续费率
     */
	private BigDecimal formalityRate;
    /**
     * 提现时间
     */
	private Date dateTime;
    /**
     * 审核时间
     */
	private Date auditDateTime;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(Integer operatorId) {
		this.operatorId = operatorId;
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

	public BigDecimal getFormalityRate() {
		return formalityRate;
	}

	public void setFormalityRate(BigDecimal formalityRate) {
		this.formalityRate = formalityRate;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public Date getAuditDateTime() {
		return auditDateTime;
	}

	public void setAuditDateTime(Date auditDateTime) {
		this.auditDateTime = auditDateTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "WithdrawLog{" +
			"id=" + id +
			", operatorId=" + operatorId +
			", userId=" + userId +
			", points=" + points +
			", formalityRate=" + formalityRate +
			", dateTime=" + dateTime +
			", auditDateTime=" + auditDateTime +
			"}";
	}
}
