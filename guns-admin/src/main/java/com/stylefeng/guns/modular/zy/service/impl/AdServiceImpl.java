package com.stylefeng.guns.modular.zy.service.impl;

import com.stylefeng.guns.common.persistence.model.Ad;
import com.stylefeng.guns.common.persistence.dao.AdMapper;
import com.stylefeng.guns.modular.zy.service.IAdService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 广告表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@Service
public class AdServiceImpl extends ServiceImpl<AdMapper, Ad> implements IAdService {
	
}
