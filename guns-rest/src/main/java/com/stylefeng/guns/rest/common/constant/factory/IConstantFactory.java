package com.stylefeng.guns.rest.common.constant.factory;

import com.stylefeng.guns.rest.common.persistence.model.Dict;

import java.util.List;

/**
 * 常量生产工厂的接口
 *
 * @author fengshuonan
 * @date 2017-06-14 21:12
 */
public interface IConstantFactory {

    /**
     * 获取店铺类型名称
     */
    public List<Dict> getAllShopType();


}
