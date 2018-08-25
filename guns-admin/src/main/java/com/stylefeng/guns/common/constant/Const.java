package com.stylefeng.guns.common.constant;

/**
 * 系统常量
 *
 * @author fengshuonan
 * @date 2017年2月12日 下午9:42:53
 */
public interface Const {

    /**
     * 系统默认的管理员密码
     */
    String DEFAULT_PWD = "111111";

    /**
     * 管理员角色的名字
     */
    String ADMIN_NAME = "administrator";

    /**
     * 管理员id
     */
    Integer ADMIN_ID = 1;

    /**
     * 超级管理员角色id
     */
    Integer ADMIN_ROLE_ID = 1;

    /**
     * 接口文档的菜单名
     */
    String API_MENU_NAME = "接口文档";

    /**
     * 中盈管理员名字
     */
    String ZYADMIN_NAME = "zyadmin";

    String JSONRELPATH = "zyAssets/config/param.json";

    /**
     * 销售提成
     */
    String DESC_SALES_COMMISON = "销售提成";

    /**
     * 管理奖
     */
    String DESC_SALES_MAMAGE = "管理奖";

    /**
     * 转换所得
     */
    String DESC_CNV = "每日转换";

    /**
     * 管理员充值
     */
    String DESC_ADMIN_DEP = "管理员充值";

    /**
     * 股东用户等级
     */
    String PARTNER_USER_LEVEL = "partnerUserLevel";
}
