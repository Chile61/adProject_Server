package com.stylefeng.guns.rest.modular.auth.validator.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.rest.common.persistence.dao.RestUserMapper;
import com.stylefeng.guns.rest.common.persistence.model.RestUser;
import com.stylefeng.guns.rest.modular.auth.validator.IReqValidator;
import com.stylefeng.guns.rest.modular.auth.validator.dto.Credence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 直接验证账号密码是不是admin
 *
 * @author fengshuonan
 * @date 2017-08-23 12:34
 */
@Service
public class SimpleValidator implements IReqValidator {

    private static String USER_NAME = "admin";

    private static String PASSWORD = "admin";
    @Autowired
    RestUserMapper restUserMapper;

    @Override
    public boolean validate(Credence credence) {

        String userName = credence.getCredenceName();
        String password = credence.getCredenceCode();

        if (USER_NAME.equals(userName) && PASSWORD.equals(password)) {
            return true;
        } else {
            return false;
        }
    }
    @Override
    public String getPhoneUser(String phone) {
        List<RestUser> users = restUserMapper.selectList(new EntityWrapper<RestUser>().eq("phone", phone));
        if (users != null && users.size() == 1){
            return users.get(0).getUserName();
        }else{
            return "";
        }
    }
}
