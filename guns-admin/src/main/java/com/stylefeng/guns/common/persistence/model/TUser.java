package com.stylefeng.guns.common.persistence.model;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.models.auth.In;

import java.io.Serializable;

/**
 * <p>
 * 管理员表
 * </p>
 *
 * @author jerry
 * @since 2018-01-06
 */
@TableName("t_user")
public class TUser extends Model<TUser> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 头像
     */
	private String avatar;
    /**
     * 账号
     */
	private String account;
    /**
     * 密码
     */
	private String password;
    /**
     * md5密码盐
     */
	private String salt;
    /**
     * 名字
     */
	private String name;
    /**
     * 生日
     */
	private Date birthday;
    /**
     * 性别（1：男 2：女）
     */
	private Integer sex;
    /**
     * 电子邮件
     */
	private String email;
    /**
     * 电话
     */
	private String phone;
	/**
	 * 是否验证
	 */
	private Boolean phoneVerification;
    /**
     * 角色id
     */
	private String roleid;
    /**
     * 上级id
     */
	private String superior;
	/**
	 * 上上级id
	 */
	private String superiorSecond;
	/**
	 * 上上上级id
	 */
	private String superiorThird;
	/**
     * 所有上级id
     */
	private String superiors;
    /**
     * 状态(1：启用  2：冻结  3：删除）
     */
	private Integer status;
    /**
     * 创建时间
     */
	private Date createtime;
    /**
     * 身份证号
     */
	private String cardID;
	/**
	 * 身份证类别
	 */
	private Integer cardType;
	/**
	 * 身份证图片
	 */
	private String cardPic;
    /**
     * 用户等级
     */
	private Integer level;
    /**
     * 微信号
     */
	private String weiXin;
    /**
     * 库存积分
     */
	private BigDecimal stockPoints;
    /**
     * 积分
     */
	private BigDecimal points;
    /**
     * 云积分
     */
	private BigDecimal cloudPoints;
    /**
     * 消费积分
     */
	private BigDecimal onlyPayPoints;
    /**
     * 二维码
     */
	private String QRcode;
	/**
	 * 顶级推荐人
	 */
	private String superiorTop;
	/**
	 * 现金账户
	 */
	private BigDecimal cash;
	/**
	 * 验证状态
	 */
	private Integer verification;
	/**
	 * 充值管理员
	 */
	private Boolean managerApply;
	/**
	 * 订单管理员
	 */
	private Boolean managerOrder;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Boolean getPhoneVerification() {
		return phoneVerification;
	}

	public void setPhoneVerification(Boolean phoneVerification) {
		this.phoneVerification = phoneVerification;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getSuperior() {
		return superior;
	}

	public void setSuperior(String superior) {
		this.superior = superior;
	}

	public String getSuperiorSecond() {
		return superiorSecond;
	}

	public void setSuperiorSecond(String superiorSecond) {
		this.superiorSecond = superiorSecond;
	}

	public String getSuperiorThird() {
		return superiorThird;
	}

	public void setSuperiorThird(String superiorThird) {
		this.superiorThird = superiorThird;
	}

	public String getSuperiors() {
		return superiors;
	}

	public void setSuperiors(String superiors) {
		this.superiors = superiors;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getCardID() {
		return cardID;
	}

	public void setCardID(String cardID) {
		this.cardID = cardID;
	}

	public Integer getCardType() {
		return cardType;
	}

	public void setCardType(Integer cardType) {
		this.cardType = cardType;
	}
	public String getCardPic() {
		return cardPic;
	}

	public void setCardPic(String cardPic) {
		this.cardPic = cardPic;
	}
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getWeiXin() {
		return weiXin;
	}

	public void setWeiXin(String weiXin) {
		this.weiXin = weiXin;
	}

	public BigDecimal getStockPoints() {
		return stockPoints;
	}

	public void setStockPoints(BigDecimal stockPoints) {
		this.stockPoints = stockPoints;
	}

	public BigDecimal getPoints() {
		return points;
	}

	public void setPoints(BigDecimal points) {
		this.points = points;
	}

	public BigDecimal getCloudPoints() {
		return cloudPoints;
	}

	public void setCloudPoints(BigDecimal cloudPoints) {
		this.cloudPoints = cloudPoints;
	}

	public BigDecimal getOnlyPayPoints() {
		return onlyPayPoints;
	}

	public void setOnlyPayPoints(BigDecimal onlyPayPoints) {
		this.onlyPayPoints = onlyPayPoints;
	}

	public String getQRcode() {
		return QRcode;
	}

	public void setQRcode(String QRcode) {
		this.QRcode = QRcode;
	}

	public String getSuperiorTop() {
		return superiorTop;
	}

	public void setSuperiorTop(String superiorTop) {
		this.superiorTop = superiorTop;
	}

	public BigDecimal getCash() {
		return cash;
	}

	public void setCash(BigDecimal cash) {
		this.cash = cash;
	}

	public Integer getVerification() {
		return verification;
	}

	public void setVerification(Integer verification) {
		this.verification = verification;
	}

	public Boolean getManagerApply() {
		return managerApply;
	}

	public void setManagerApply(Boolean managerApply) {
		this.managerApply = managerApply;
	}

	public Boolean getManagerOrder() {
		return managerOrder;
	}

	public void setManagerOrder(Boolean managerOrder) {
		this.managerOrder = managerOrder;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "TUser{" +
			"id=" + id +
			", avatar=" + avatar +
			", account=" + account +
			", password=" + password +
			", salt=" + salt +
			", name=" + name +
			", birthday=" + birthday +
			", sex=" + sex +
			", email=" + email +
			", phone=" + phone +
			", phoneVerification=" + phoneVerification +
			", roleid=" + roleid +
			", superior=" + superior +
			", superiorSecond=" + superiorSecond +
			", superiorThird=" + superiorThird +
			", superiors=" + superiors +
			", status=" + status +
			", createtime=" + createtime +
			", cardID=" + cardID +
			", cardType=" + cardType +
			", cardPic=" + cardPic +
			", level=" + level +
			", weiXin=" + weiXin +
			", stockPoints=" + stockPoints +
			", points=" + points +
			", cloudPoints=" + cloudPoints +
			", onlyPayPoints=" + onlyPayPoints +
			", QRcode=" + QRcode +
			", superiorTop=" + superiorTop +
			", cash=" + cash +
			", verification=" + verification +
			", managerApply=" + managerApply +
			", managerOrder=" + managerOrder +
			"}";
	}
}
