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
 * 文章表
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@TableName("t_article")
public class Article extends Model<Article> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 文章类别
     */
	private Integer typeId;
    /**
     * 发布人
     */
	private Integer userId;
    /**
     * 标题
     */
	private String title;
    /**
     * 创建时间
     */
	private Date createTime;
    /**
     * 开始时间
     */
	private Date startTtime;
    /**
     * 截止时间
     */
	private Date endTime;
    /**
     * 图片
     */
	private String image;
    /**
     * 内容
     */
	private String content;
    /**
     * 审核人
     */
	private Integer auditorId;
    /**
     * 审核时间
     */
	private Integer auditorTime;
    /**
     * 发布
     */
	private Boolean publish;
    /**
     * 排序
     */
	private Integer sort;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getStartTtime() {
		return startTtime;
	}

	public void setStartTtime(Date startTtime) {
		this.startTtime = startTtime;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getAuditorId() {
		return auditorId;
	}

	public void setAuditorId(Integer auditorId) {
		this.auditorId = auditorId;
	}

	public Integer getAuditorTime() {
		return auditorTime;
	}

	public void setAuditorTime(Integer auditorTime) {
		this.auditorTime = auditorTime;
	}

	public Boolean getPublish() {
		return publish;
	}

	public void setPublish(Boolean publish) {
		this.publish = publish;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "Article{" +
			"id=" + id +
			", typeId=" + typeId +
			", userId=" + userId +
			", title=" + title +
			", createTime=" + createTime +
			", startTtime=" + startTtime +
			", endTime=" + endTime +
			", image=" + image +
			", content=" + content +
			", auditorId=" + auditorId +
			", auditorTime=" + auditorTime +
			", publish=" + publish +
			", sort=" + sort +
			"}";
	}
}
