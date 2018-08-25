package com.stylefeng.guns.common.persistence.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 应用版本更新
 * </p>
 *
 * @author Chile
 * @since 2018-05-09
 */
@TableName("t_app_version")
public class AppVersion extends Model<AppVersion> {

    private static final long serialVersionUID = 1L;

    /**
     * 主建id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 版本号
     */
	private String version;
    /**
     * 更新说明
     */
	private String description;
    /**
     * 下载地址
     */
	private String url;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "AppVersion{" +
			"id=" + id +
			", version=" + version +
			", description=" + description +
			", url=" + url +
			"}";
	}
}
