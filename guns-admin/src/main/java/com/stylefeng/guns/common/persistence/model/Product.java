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
 * 商品表
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@TableName("t_product")
public class Product extends Model<Product> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 商品名称
     */
	private String name;
    /**
     * 描述
     */
	private String description;
    /**
     * 折后价
     */
	private BigDecimal lowPice;
    /**
     * 售价
     */
	private BigDecimal highPice;
    /**
     * 品牌
     */
	private Integer brandId;
	/**
	 * 分类
	 */
	private Integer categoryId;
    /**
     * 店铺
     */
	private Integer shopId;
    /**
     * 获得积分
     */
	private Integer points;
    /**
     * 显示售价
     */
	private Boolean showPice;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getLowPice() {
		return lowPice;
	}

	public void setLowPice(BigDecimal lowPice) {
		this.lowPice = lowPice;
	}

	public BigDecimal getHighPice() {
		return highPice;
	}

	public void setHighPice(BigDecimal highPice) {
		this.highPice = highPice;
	}

	public Integer getBrandId() {
		return brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getPoints() {
		return points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}

	public Boolean getShowPice() {
		return showPice;
	}

	public void setShowPice(Boolean showPice) {
		this.showPice = showPice;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Product{" +
			"id=" + id +
			", name=" + name +
			", description=" + description +
			", lowPice=" + lowPice +
			", highPice=" + highPice +
			", brandId=" + brandId +
			", categoryId=" + categoryId +
			", shopId=" + shopId +
			", points=" + points +
			", showPice=" + showPice +
			"}";
	}
}
