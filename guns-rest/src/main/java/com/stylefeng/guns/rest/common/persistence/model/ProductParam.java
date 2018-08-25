package com.stylefeng.guns.rest.common.persistence.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * <p>
 * 商品参数表
 * </p>
 *
 * @author Chile
 * @since 2018-01-16
 */
@TableName("t_product_param")
public class ProductParam extends Model<ProductParam> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 参数
     */
	private String param;
    /**
     * 描述
     */
	private String description;
    /**
     * 对应商品
     */
	private Integer productId;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "ProductParam{" +
			"id=" + id +
			", param=" + param +
			", description=" + description +
			", productId=" + productId +
			"}";
	}
}
