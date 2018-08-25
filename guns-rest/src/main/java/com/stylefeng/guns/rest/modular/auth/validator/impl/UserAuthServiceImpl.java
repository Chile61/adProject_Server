package com.stylefeng.guns.rest.modular.auth.validator.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.rest.common.persistence.dao.RestUserMapper;
import com.stylefeng.guns.rest.common.persistence.model.RestUser;
import com.stylefeng.guns.rest.modular.auth.validator.IReqValidator;
import com.stylefeng.guns.rest.modular.auth.validator.dto.Credence;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.rest.common.persistence.dao.UserMapper;
import com.stylefeng.guns.zy.modular.user.service.IUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.stylefeng.guns.zy.modular.util.securityKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-01
 */
@Service
public class UserAuthServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService,IReqValidator {

    @Autowired
    UserMapper userMapper;


    @Override
    public boolean validate(Credence credence) {
        String userName = credence.getCredenceName();
        String password = credence.getCredenceCode();

        List<User> users = userMapper.selectList(new EntityWrapper<User>().eq("account", userName));
        if (users != null && users.size() > 0) {
            String encryptedPwd = securityKit.md5(password, users.get(0).getSalt());
            if (users.get(0).getPassword().equals(encryptedPwd)) {
                return true;
            }
            else {
                return false;
            }
        } else {
            return false;
        }
    }

    @Override
    public String getPhoneUser(String phone) {
        List<User> users = userMapper.selectList(new EntityWrapper<User>().eq("phone", phone));
        if (users != null && users.size() == 1){
            return users.get(0).getAccount();
        }else{
            return "";
        }
    }
}
