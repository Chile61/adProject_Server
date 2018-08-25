package com.stylefeng.guns.zy.modular.appVersion.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.AppVersion;
import com.stylefeng.guns.rest.common.persistence.dao.AppVersionMapper;
import com.stylefeng.guns.zy.modular.appVersion.service.IAppVersionService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 应用版本更新 服务实现类
 * </p>
 *
 * @author Chile
 * @since 2018-05-09
 */
@Service
public class AppVersionServiceImpl extends ServiceImpl<AppVersionMapper, AppVersion> implements IAppVersionService {
	
}
