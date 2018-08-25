package com.stylefeng.guns.zy.modular.dao.warpper;

import com.stylefeng.guns.core.util.SpringContextHolder;
import com.stylefeng.guns.rest.common.persistence.dao.DictMapper;
import com.stylefeng.guns.rest.common.persistence.model.Dict;
import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;

import java.util.Map;

/**
 * 字典列表的包装
 *
 * @author fengshuonan
 * @date 2017年4月25日 18:10:31
 */
public class AdWarpper extends BaseControllerWarpper {

    private DictMapper dictMapper = SpringContextHolder.getBean(DictMapper.class);

    public AdWarpper(Object list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        Integer id = (Integer) map.get("typeId");
        Dict type = dictMapper.list(id);
        if(type != null){
            map.put("type", type.getName());
        }
        id = (Integer) map.get("positionId");
        Dict position = dictMapper.list(id);
        if(position != null){
            map.put("position", position.getName());
        }
    }

}
