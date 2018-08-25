package com.stylefeng.guns.rest.common.persistence.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * <p>
 * 充值日志表
 * </p>
 *
 * @author stylefeng
 * @since 2018-01-01
 */
@TableName("t_recharge_log")
public class RechargeLog extends Model<RechargeLog> {

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
     * 1积分,2库存
     */
	private Integer type;
    /**
     * 充值积分
     */
	private BigDecimal points;
    /**
     * 充值时间
     */
	private Date dateTime;


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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public BigDecimal getPoints() {
		return points;
	}

	public void setPoints(BigDecimal points) {
		this.points = points;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "RechargeLog{" +
			"id=" + id +
			", operatorId=" + operatorId +
			", userId=" + userId +
			", type=" + type +
			", points=" + points +
			", dateTime=" + dateTime +
			"}";
	}
}
