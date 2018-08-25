package com.stylefeng.guns.rest.common.persistence.dao;

import com.stylefeng.guns.rest.common.persistence.model.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * <p>
  * 管理员表 Mapper 接口
 * </p>
 *
 * @author jerry
 * @since 2018-01-04
 */
public interface UserMapper extends BaseMapper<User> {
    User list(@Param("id") Integer id);
}