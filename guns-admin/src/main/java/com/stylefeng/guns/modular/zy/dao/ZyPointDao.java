package com.stylefeng.guns.modular.zy.dao;

import java.util.List;
import java.util.Map;

public interface ZyPointDao {

    /**
     * 获取所有启用状态的用户
     * @return
     */
    List<Map<String, Object>> selectAllActiveUsers ();

    /**
     * 更新各个用户的积分
     * @param list
     */
    void updateBatchUser(List<Map<String, Object>> list);

    /**
     * 更新各个用户的积分转换日志
     * @param list
     */
    void insertBatchNormUserCnvLog(List<Map<String, Object>> list);

    /**
     * 更新股东用户的积分转换日志
     * @param list
     */
    void insertBatchPartnerUserCnvLog(List<Map<String, Object>> list);

    /**
     * 更新股东用户的云积分流水日志
     */
    void insertBatchPartnerUserCloudJour(List<Map<String, Object>> list);

    /**
     * 更新普通用户的云积分流水日志
     */
    void insertBatchNormUserCloudJour(List<Map<String, Object>> list);
}
