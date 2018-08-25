package com.stylefeng.guns.common.persistence.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 店铺表
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@TableName("t_shop")
public class Shop extends Model<Shop> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 店铺名称
     */
	private String name;
    /**
     * 店铺类型
     */
	private Integer typeId;
    /**
     * 店铺描述
     */
	private String description;
    /**
     * 店铺所属用户
     */
	private Integer userid;
    /**
     * 店铺二维码
     */
	private Integer QRcode;
    /**
     * 经营类别
     */
	private Integer category;
    /**
     * 主营品牌
     */
	private String brand;
    /**
     * 店铺LOGO
     */
	private String logo;
    /**
     * 经营执照
     */
	private String license;
    /**
     * 店铺状态
     */
	private Integer state;


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

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getQRcode() {
		return QRcode;
	}

	public void setQRcode(Integer QRcode) {
		this.QRcode = QRcode;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
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
		return "Shop{" +
			"id=" + id +
			", name=" + name +
			", typeId=" + typeId +
			", description=" + description +
			", userid=" + userid +
			", QRcode=" + QRcode +
			", category=" + category +
			", brand=" + brand +
			", logo=" + logo +
			", license=" + license +
			", state=" + state +
			"}";
	}
}
