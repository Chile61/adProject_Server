package com.stylefeng.guns.zy.modular.ad.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.Ad;
import com.stylefeng.guns.rest.common.persistence.dao.AdMapper;
import com.stylefeng.guns.zy.modular.ad.service.IAdService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 广告表 服务实现类
 * </p>
 *
 * @author chile
 * @since 2018-01-10
 */
@Service
public class AdServiceImpl extends ServiceImpl<AdMapper, Ad> implements IAdService {
	
}
