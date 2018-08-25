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
 * 云积分账户流水
 * </p>
 *
 * @author jerry
 * @since 2018-01-17
 */
@TableName("t_cloud_points_account_journal")
public class CloudPointsAccountJournal extends Model<CloudPointsAccountJournal> {

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
     * 描述
     */
	private String description;
    /**
     * 分值
     */
	private BigDecimal points;
    /**
     * 时间
     */
	private Date dateTime;
	/**
	 * 类型
	 */
	private Integer type;
	/**
	 * 提成来自
	 */
	private Integer fromId;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getFromId() {
		return fromId;
	}

	public void setFromId(Integer fromId) {
		this.fromId = fromId;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "CloudPointsAccountJournal{" +
			"id=" + id +
			", userId=" + userId +
			", description=" + description +
			", points=" + points +
			", dateTime=" + dateTime +
			", type=" + type +
			", fromId=" + fromId +
			"}";
	}
}
