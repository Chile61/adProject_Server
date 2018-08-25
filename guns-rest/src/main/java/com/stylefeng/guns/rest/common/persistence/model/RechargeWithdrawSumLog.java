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
 * 每天冲值和提现总数统计日志
 * </p>
 *
 * @author Chile
 * @since 2018-01-31
 */
@TableName("t_recharge_withdraw_sum_log")
public class RechargeWithdrawSumLog extends Model<RechargeWithdrawSumLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键Id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 充值总数
     */
	private BigDecimal recharge;
    /**
     * 提现总数
     */
	private BigDecimal withdraw;
    /**
     * 日期
     */
	private Date logDate;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BigDecimal getRecharge() {
		return recharge;
	}

	public void setRecharge(BigDecimal recharge) {
		this.recharge = recharge;
	}

	public BigDecimal getWithdraw() {
		return withdraw;
	}

	public void setWithdraw(BigDecimal withdraw) {
		this.withdraw = withdraw;
	}

	public Date getLogDate() {
		return logDate;
	}

	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "RechargeWithdrawSumLog{" +
			"id=" + id +
			", recharge=" + recharge +
			", withdraw=" + withdraw +
			", logDate=" + logDate +
			"}";
	}
}
