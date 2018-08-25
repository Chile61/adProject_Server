package com.stylefeng.guns.rest.common.persistence.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * <p>
 * 订单商品列表
 * </p>
 *
 * @author Chile
 * @since 2018-05-06
 */
@TableName("t_order_product")
public class OrderProduct extends Model<OrderProduct> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 订单id
     */
	private Integer orderId;
    /**
     * 商品id
     */
	private Integer productId;
    /**
     * 数量
     */
	private Integer num;
    /**
     * 单价
     */
	private BigDecimal price;
    /**
     * 积分
     */
	private Integer point;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "OrderProduct{" +
			"id=" + id +
			", orderId=" + orderId +
			", productId=" + productId +
			", num=" + num +
			", price=" + price +
			", point=" + point +
			"}";
	}
}
