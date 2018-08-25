package com.stylefeng.guns.modular.zy.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.stylefeng.guns.common.exception.BizExceptionEnum;
import com.stylefeng.guns.common.persistence.dao.ProductMapper;
import com.stylefeng.guns.common.persistence.model.Product;
import com.stylefeng.guns.common.persistence.model.ProductParam;
import com.stylefeng.guns.common.persistence.dao.ProductParamMapper;
import com.stylefeng.guns.core.exception.GunsException;
import com.stylefeng.guns.modular.zy.service.IProductParamService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

import static com.stylefeng.guns.common.constant.factory.MutiStrFactory.MUTI_STR_KEY;
import static com.stylefeng.guns.common.constant.factory.MutiStrFactory.MUTI_STR_VALUE;
import static com.stylefeng.guns.common.constant.factory.MutiStrFactory.parseKeyValue;

/**
 * <p>
 * 商品参数表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@Service
public class ProductParamServiceImpl extends ServiceImpl<ProductParamMapper, ProductParam> implements IProductParamService {
    @Resource
    ProductParamMapper productParamMapper;
    @Resource
    ProductMapper productMapper;

    @Override
    public void addProductParam(Integer productId, String paramValues) {
        //判断有没有该商品
        List<Product> product = productMapper.searchProductById(productId);
        if(product == null || product.size() == 0){
            throw new GunsException(BizExceptionEnum.PRODUCT_NOT_EXISTED);
        }

        //paramValues
        List<Map<String, String>> items = parseKeyValue(paramValues);

        //添加字典条目
        for (Map<String, String> item : items) {
            String param = item.get(MUTI_STR_KEY);
            String desc = item.get(MUTI_STR_VALUE);
            ProductParam itemParam = new ProductParam();
            itemParam.setParam(param);
            itemParam.setDescription(desc);
            itemParam.setProductId(productId);

            this.productParamMapper.insert(itemParam);
        }
    }

    @Override
    public void editProductParam(Integer productId, String paramValues) {
        //删除之前的参数
        this.deleteProductParam(productId);

        //重新添加新的字典
        this.addProductParam(productId,paramValues);
    }

    @Override
    public void deleteProductParam(Integer productId) {
        //删除这个商品参数
        Wrapper<ProductParam> productParamEntityWrapper = new EntityWrapper<>();
        productParamEntityWrapper = productParamEntityWrapper.eq("productId", productId);
        productParamMapper.delete(productParamEntityWrapper);

    }
}
