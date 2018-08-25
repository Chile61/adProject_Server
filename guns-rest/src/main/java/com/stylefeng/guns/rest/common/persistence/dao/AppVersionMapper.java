package com.stylefeng.guns.rest.common.persistence.dao;

import com.stylefeng.guns.rest.common.persistence.model.AppVersion;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
  * 应用版本更新 Mapper 接口
 * </p>
 *
 * @author Chile
 * @since 2018-05-09
 */
public interface AppVersionMapper extends BaseMapper<AppVersion> {
    AppVersion getLastVersion();
}