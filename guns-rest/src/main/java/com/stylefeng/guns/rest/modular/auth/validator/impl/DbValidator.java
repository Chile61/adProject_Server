package com.stylefeng.guns.rest.modular.auth.validator.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.rest.common.persistence.dao.RestUserMapper;
import com.stylefeng.guns.rest.common.persistence.model.RestUser;
import com.stylefeng.guns.rest.modular.auth.validator.IReqValidator;
import com.stylefeng.guns.rest.modular.auth.validator.dto.Credence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 账号密码验证
 *
 * @author fengshuonan
 * @date 2017-08-23 12:34
 */
@Service
public class DbValidator implements IReqValidator {

    @Autowired
    RestUserMapper restUserMapper;

    @Override
    public boolean validate(Credence credence) {
        List<RestUser> users = restUserMapper.selectList(new EntityWrapper<RestUser>().eq("userName", credence.getCredenceName()));
        if (users != null && users.size() > 0) {
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
