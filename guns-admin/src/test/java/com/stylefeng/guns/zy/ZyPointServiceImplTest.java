package com.stylefeng.guns.zy;

import com.stylefeng.guns.base.BaseJunit;
import com.stylefeng.guns.modular.zy.service.impl.ZyPointServiceImpl;
import org.junit.Test;

import javax.annotation.Resource;

import static com.stylefeng.guns.core.util.DateUtil.getAfterDayDate;

public class ZyPointServiceImplTest extends BaseJunit {

    @Resource
    ZyPointServiceImpl zyPointService;

    @Test
    public void test (){
        Object t = zyPointService.getUserYdPntAcctJourSum("1");
        System.out.println("----------"+t.toString()+"----------");
    }

    @Test
    public void test2 () {
        String day = getAfterDayDate("-1");
        System.out.println("----------"+day+"----------");
    }
}
