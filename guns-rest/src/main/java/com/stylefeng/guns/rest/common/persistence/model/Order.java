package com.stylefeng.guns.rest.common.persistence.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 定单信息
 * </p>
 *
 * @author Chile
 * @since 2018-05-06
 */
@TableName("t_order")
public class Order extends Model<Order> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 订单号
     */
	private String sn;
    /**
     * 下单人
     */
	private Integer userId;
    /**
     * 店铺
     */
	private Integer shopId;
    /**
     * 合计金额
     */
	private BigDecimal money;
    /**
     * 合计积分
     */
	private Integer points;
    /**
     * 下单时间
     */
	private Date createTime;
    /**
     * 收货地址
     */
	private String shipAddress;
    /**
     * 收货人
     */
	private String shipName;
    /**
     * 收货人联系电话
     */
	private String shipMobile;
    /**
     * 备注
     */
	private String remark;
    /**
     * 状态 0未付款 1待发货 2待收货 3已收货 4退货中 5已退货
     */
	private Integer state;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public Integer getPoints() {
		return points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getShipMobile() {
		return shipMobile;
	}

	public void setShipMobile(String shipMobile) {
		this.shipMobile = shipMobile;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Order{" +
			"id=" + id +
			", sn=" + sn +
			", userId=" + userId +
			", shopId=" + shopId +
			", money=" + money +
			", points=" + points +
			", createTime=" + createTime +
			", shipAddress=" + shipAddress +
			", shipName=" + shipName +
			", shipMobile=" + shipMobile +
			", remark=" + remark +
			", state=" + state +
			"}";
	}
}
