package com.stylefeng.guns.rest.common.constant.dictmap;

import com.stylefeng.guns.rest.common.constant.dictmap.base.AbstractDictMap;

/**
 * 部门的映射
 *
 * @author fengshuonan
 * @date 2017-05-06 15:01
 */
public class ShopTypeDict extends AbstractDictMap {

    @Override
    public void init() {
    }

    @Override
    protected void initBeWrapped() {
        putFieldWrapperMethodName("shopTypeId", "getAllShopType");
    }
}
