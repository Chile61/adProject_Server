package com.stylefeng.guns.modular.zy.service.impl;

import com.stylefeng.guns.common.persistence.model.Param;
import com.stylefeng.guns.common.persistence.dao.ParamMapper;
import com.stylefeng.guns.modular.zy.service.IParamService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统参数表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-09
 */
@Service
public class ParamServiceImpl extends ServiceImpl<ParamMapper, Param> implements IParamService {
	
}
