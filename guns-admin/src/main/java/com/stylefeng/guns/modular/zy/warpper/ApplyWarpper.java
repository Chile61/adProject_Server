package com.stylefeng.guns.modular.zy.warpper;

import com.stylefeng.guns.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;

import java.util.List;
import java.util.Map;

/**
 * 中盈店铺管理包装类
 */
public class ApplyWarpper extends BaseControllerWarpper {


    public ApplyWarpper(List<Map<String, Object>> list) {
        super(list);
    }
    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("stateName", ConstantFactory.me().getApplyState((Integer) map.get("state")));
        map.put("userName", ConstantFactory.me().getZyUserNameById((Integer)map.get("userId")));
    }

}