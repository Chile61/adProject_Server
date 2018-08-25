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
 * 广告表
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@TableName("t_ad")
public class Ad extends Model<Ad> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 标题
     */
	private String title;
    /**
     * 广告类别
     */
	private Integer typeId;
    /**
     * 广告位置
     */
	private Integer positionId;
    /**
     * 发布人
     */
	private Integer userId;
    /**
     * 发布店铺
     */
	private Integer shopId;
    /**
     * 对应品牌
     */
	private Integer brandId;
    /**
     * 对应商品
     */
	private Integer productId;
    /**
     * 对应文章
     */
	private Integer articleId;
    /**
     * 开始时间
     */
	private Date startTime;
    /**
     * 截止时间
     */
	private Date endTime;
    /**
     * 图片
     */
	private String image;
    /**
     * 折后价
     */
	private BigDecimal lowPrice;
    /**
     * 价格
     */
	private BigDecimal highPrice;
    /**
     * 排序
     */
	private Integer sortNum;
    /**
     * 列宽(1-12)
     */
	private Integer col;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
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

	public Integer getBrandId() {
		return brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public BigDecimal getLowPrice() {
		return lowPrice;
	}

	public void setLowPrice(BigDecimal lowPrice) {
		this.lowPrice = lowPrice;
	}

	public BigDecimal getHighPrice() {
		return highPrice;
	}

	public void setHighPrice(BigDecimal highPrice) {
		this.highPrice = highPrice;
	}

	public Integer getSortNum() {
		return sortNum;
	}

	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
	}

	public Integer getCol() {
		return col;
	}

	public void setCol(Integer col) {
		this.col = col;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Ad{" +
			"id=" + id +
			", title=" + title +
			", typeId=" + typeId +
			", positionId=" + positionId +
			", userId=" + userId +
			", shopId=" + shopId +
			", brandId=" + brandId +
			", productId=" + productId +
			", articleId=" + articleId +
			", startTime=" + startTime +
			", endTime=" + endTime +
			", image=" + image +
			", lowPrice=" + lowPrice +
			", highPrice=" + highPrice +
			", sortNum=" + sortNum +
			", col=" + col +
			"}";
	}
}
