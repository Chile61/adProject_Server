package com.stylefeng.guns.rest.common.persistence.dao;

import com.stylefeng.guns.rest.common.persistence.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * 管理员的dao
 *
 * @author fengshuonan
 * @date 2017年2月12日 下午8:43:52
 */
public interface UserMgrDao {

    /**
     * 通过账号获取用户
     *
     * @param account
     * @return
     * @date 2017年2月17日 下午11:07:46
     */
    Map getUserMapByAccount(@Param("account") String account);

    User getUserModelByAccount(@Param("account") String account);
}
