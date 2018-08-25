package com.stylefeng.guns.rest.common.constant.factory;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.util.SpringContextHolder;
import com.stylefeng.guns.rest.common.persistence.dao.DictMapper;
import com.stylefeng.guns.rest.common.persistence.model.Dict;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 常量的生产工厂
 *
 * @author fengshuonan
 * @date 2017年2月13日 下午10:55:21
 */
@Component
@DependsOn("springContextHolder")
public class ConstantFactory implements IConstantFactory {


    private DictMapper dictMapper = SpringContextHolder.getBean(DictMapper.class);

    public static IConstantFactory me() {
        return SpringContextHolder.getBean("constantFactory");
    }

    /**
     * 查询字典
     */
    @Override
    public List<Dict> getAllShopType() {

        EntityWrapper<Dict> wrapper = new EntityWrapper<>();
        List<Dict> dicts = dictMapper.selectList(wrapper);
        if (dicts == null || dicts.size() == 0) {
            return null;
        } else {
            return dicts;
        }

    }



}
