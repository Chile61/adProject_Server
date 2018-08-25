package com.stylefeng.guns.modular.zy.warpper;

import com.stylefeng.guns.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;

import java.util.List;
import java.util.Map;

/**
 * 中盈用户管理包装类
 */
public class TUserWarpper extends BaseControllerWarpper {


    public TUserWarpper(List<Map<String, Object>> list) {
        super(list);
    }
    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("sexName", ConstantFactory.me().getSexName((Integer) map.get("sex")));
        map.put("typeName", ConstantFactory.me().getUserType((String) map.get("roleid")));
        map.put("levelName", ConstantFactory.me().getUserLevel(map.get("level").toString()));
        map.put("statusName", ConstantFactory.me().getStatusName((Integer) map.get("status")));
        map.put("verificationName", ConstantFactory.me().getVerificationName((Integer) map.get("verification")));
        map.put("managerApplyShow", ConstantFactory.me().getTypeName((Boolean)map.get("managerApply")));
    }

}