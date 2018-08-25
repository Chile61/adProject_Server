package com.stylefeng.guns.common.persistence.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 申请提现云积分户
 * </p>
 *
 * @author Chile
 * @since 2018-05-07
 */
@TableName("t_withdraw_apply_cloud")
public class WithdrawApplyCloud extends Model<WithdrawApplyCloud> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 用户id
     */
	private Integer userId;
    /**
     * 申请提现云积分
     */
	private Integer points;
    /**
     * 状态0申请中,1通过,2中止
     */
	private Integer state;
    /**
     * 创建时间
     */
	private Date createTime;


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

	public Integer getPoints() {
		return points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "WithdrawApplyCloud{" +
			"id=" + id +
			", userId=" + userId +
			", points=" + points +
			", state=" + state +
			", createTime=" + createTime +
			"}";
	}
}
