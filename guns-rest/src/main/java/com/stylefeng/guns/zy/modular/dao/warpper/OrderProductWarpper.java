package com.stylefeng.guns.zy.modular.dao.warpper;

import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;
import com.stylefeng.guns.core.util.SpringContextHolder;
import com.stylefeng.guns.rest.common.persistence.dao.DictMapper;
import com.stylefeng.guns.rest.common.persistence.dao.ProductMapper;
import com.stylefeng.guns.rest.common.persistence.model.Dict;
import com.stylefeng.guns.rest.common.persistence.model.Product;

import java.util.Map;

/**
 * 字典列表的包装
 *
 * @author fengshuonan
 * @date 2017年4月25日 18:10:31
 */
public class OrderProductWarpper extends BaseControllerWarpper {

    private ProductMapper productMapper = SpringContextHolder.getBean(ProductMapper.class);

    public OrderProductWarpper(Object list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        Integer id = (Integer) map.get("productId");
        Product product = productMapper.getProductById(id);
        if(product != null){
            map.put("productName", product.getName());
        }
    }

}
