package com.stylefeng.guns.zy;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.common.persistence.model.TUser;
import org.junit.Test;

public class MybatisPlusTest {

    @Test
    public void testTSQL11() {
        /*
         * 实体带查询使用方法  输出看结果
         */
        EntityWrapper<TUser> ew = new EntityWrapper<TUser>();
        ew.setEntity(new TUser());
        ew.where("id=1");

        System.out.println(ew.getSqlSegment());
    }
}
